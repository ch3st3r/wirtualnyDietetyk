package wirtualnydietetyk

import com.myApp.CurrentUserMacro
import com.myApp.Ingredient
import com.myApp.Meal
import com.myApp.MealDetailsInfo
import com.myApp.User
import com.myApp.UserMeal
import grails.transaction.Transactional

@Transactional
class VirtualNutritionistService {
    MealService mealService;

    def serviceMethod() {

    }

    def getCurrentUserMacro(User user){
        double allKcal = user.userKcalInfo.allKcal;
        CurrentUserMacro currentUserMacro = new CurrentUserMacro((0.25*allKcal)/4, (0.6*allKcal)/4, (0.15*allKcal)/9, allKcal, 0.6, 0.25, 0.15);
        return currentUserMacro;
    }


    def countCoefficient(Meal meal, currentUserMacro){
        MealDetailsInfo mealDetails = meal.mealDetailsInfo
        double bwt = mealDetails.protein*4 + mealDetails.carbohydrates*4 + mealDetails.fats*9;
        double coefficient = Math.abs(mealDetails.protein*4/bwt - currentUserMacro.Bperc);
        coefficient += Math.abs(mealDetails.carbohydrates*4/bwt - currentUserMacro.Wperc);
        coefficient += Math.abs(mealDetails.fats*9/bwt - currentUserMacro.Tperc);
        return coefficient;
    }

    // kcal, podaje wszystkie kcalorie i dziele na liczbę posiłków, w tym wypadku 5
    def createUserMeal(Meal currentMeal, double kcal){
        UserMeal userMeal = new UserMeal();
        userMeal.name = currentMeal.name;
        userMeal.receipt = currentMeal.receipt;
        MealDetailsInfo userMealDetails = new MealDetailsInfo();
        currentMeal.ingredients.each(){
            println 'kcal  ' + kcal +  '     wspolczynnik '+  kcal/(5*currentMeal.mealDetailsInfo.kcal)   ;
            println it.product.name + ' ' + it.weight + ' new weight  ' + it.weight*(kcal/(5*currentMeal.mealDetailsInfo.kcal));
            userMeal.addToIngredients(new Ingredient(it.product, it.weight*(kcal/(5*currentMeal.mealDetailsInfo.kcal))));
            userMealDetails = mealService.countMealDetails(userMealDetails, it.product, it.weight*(kcal/(5*currentMeal.mealDetailsInfo.kcal)));
        }
        userMeal.mealDetailsInfo = userMealDetails;
        println userMealDetails.kcal;
        userMeal.save(flush:true)
        return userMeal
    }


    def updateCurrentUserMacro(CurrentUserMacro currentUserMacro, UserMeal userMeal){
        println 'bialko ' + currentUserMacro.protein +  '  wegle '  + currentUserMacro.carbohydrates  + ' tluszcze '  + currentUserMacro.fats;
        println 'meal bialko ' + userMeal.mealDetailsInfo.protein   +  '  wegle '  + userMeal.mealDetailsInfo.carbohydrates +  '  tluszcze '  +  userMeal.mealDetailsInfo.fats;
        currentUserMacro.protein -= userMeal.mealDetailsInfo.protein;
        currentUserMacro.carbohydrates -= userMeal.mealDetailsInfo.carbohydrates;
        currentUserMacro.fats -= userMeal.mealDetailsInfo.fats;
        println 'po bialko ' + currentUserMacro.protein +  'po wegle '  + currentUserMacro.carbohydrates  + 'po tluszcze '  + currentUserMacro.fats;
        double allNutrientsWeight = currentUserMacro.protein + currentUserMacro.carbohydrates + currentUserMacro.fats;
        currentUserMacro.Bperc = currentUserMacro.protein/allNutrientsWeight;
        currentUserMacro.Wperc = currentUserMacro.carbohydrates/allNutrientsWeight;
        currentUserMacro.Tperc = currentUserMacro.fats/allNutrientsWeight;
        println '%Białka ' + currentUserMacro.Bperc +  '%Węgli '   + currentUserMacro.Wperc  + ' %Tłuszczy '  + currentUserMacro.Tperc;
        return currentUserMacro;
    }


}
