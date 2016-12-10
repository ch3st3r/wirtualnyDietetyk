package wirtualnydietetyk

import com.myApp.Exercise
import com.myApp.Sport
import com.myApp.User
import com.myApp.UserKcalInfo
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }

    def updateProfile(User user, String params){
        def data = JSON.parse(params);
        User testuser;

        if(User.findByUsername('testuser')){
            testuser = User.findByUsername('testuser');
        } else {
            testuser = new User('testuser', 'testuser').save(flush:true);
        }

        Exercise.findAll().each(){
            if(it in user?.exercises)
            user?.removeFromExercises(it);
            testuser?.addToExercises(it);
            it?.save(flush:true);
        }

        data.sports.each(){
            Exercise exercise = new Exercise(Sport.findByName(it.name), it.minutes.asType(int));
            if(exercise != null){
                user.addToExercises(exercise);
            }
        }
        user.save(flush:true);
        return user;
    }

    def countExercisesKcalories(String params){
        def data = JSON.parse(params);

        double allExercisesKcal = 0;

        data.sports.each(){
            Sport sport = Sport.findByName(it.name);
            double kcal = sport.kcal * (it.minutes.asType(double) / 60);
            println kcal + ' kalorie w sporcie ' + it.name;
            allExercisesKcal += kcal;
        }

        return allExercisesKcal;
    }

    def countDailyKcalories(String params){
        double dailyKcalories = 0;
        def data = JSON.parse(params);
        try {
            double dwe = data.dwe.asType(double);
            double sportKcal = data.exercisesKcal.asType(double);

            dailyKcalories = dwe + sportKcal/7;
        } catch (Exception e){

        }
        return dailyKcalories;
    }

    def countAllKcalories(String params){
        double allKcalories = 0;
        def data = JSON.parse(params);
        try {
            double dailyKcal = data.dailyKcal.asType(double);
            String goalString = data?.goal?.replace(',','.');
            double goal = 0;
            if(goalString){
                goal = goalString.asType(double);
            }
            allKcalories = dailyKcal * goal;
        } catch (Exception e){}
        return allKcalories;
    }

    def getUserKcalInfo(User userInstance){
        UserKcalInfo userKcalInfo;
        if(userInstance.userKcalInfo != null){
            println 'tu jest null'
            userKcalInfo = userInstance.userKcalInfo
        } else {
            println 'tu nie jest null'
            userKcalInfo = new UserKcalInfo();
            userKcalInfo.save(flush:true);
            userInstance.userKcalInfo = userKcalInfo;
        }
        return userKcalInfo
    }

    def jsonWithComasParser(jsonData){
        println 'tuuuu' + jsonData;
        jsonData.each(){
            it.key = it.value.replace('.',',');
            println it.key + it.value;
        }
        return jsonData
    }

}
