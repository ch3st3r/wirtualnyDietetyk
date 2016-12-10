package com.myApp

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import wirtualnydietetyk.CalculatorService
import wirtualnydietetyk.UserService

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    SpringSecurityService springSecurityService;
    CalculatorService calculatorService;
    UserService userService;

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def userPanel(){
        User user = springSecurityService.getCurrentUser();

    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    def myProfile() {
        User userInstance = springSecurityService.getCurrentUser();
        return [userInstance:userInstance];
    }

    def editProfile() {
        User userInstance = springSecurityService.getCurrentUser();
        return [userInstance:userInstance, sportList: Sport.findAll()];
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'editProfile'
            return
        }

        println params;
        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    def updateProfile(){
        println params.bmrData;
        User userInstance = springSecurityService.getCurrentUser();
        userInstance = userService.updateProfile(userInstance, params.bmrData);
        def jsonData = JSON.parse(params.bmrData);
        def jsonUserKcalInfo = JSON.parse(params.bmrData.replace('.', ','));
        UserKcalInfo userKcalInfo = userService.getUserKcalInfo(userInstance);
        userInstance.properties = jsonData;
        userKcalInfo.properties = jsonUserKcalInfo;
        userInstance.exercises.each(){
            println it.sport.name + it.minutes;
        }
        println userKcalInfo.exercisesKcal;
        println userInstance.userKcalInfo.exercisesKcal;
        userKcalInfo.save(flush:true);
        userInstance.save(flush:true);
        render("Successful call to fooAction")
    }


    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


    def countRMR(){
        println params.bmrData;
        def meal = JSON.parse(params.bmrData);
        println meal.sports.each(){
            println it.minutes + ' ' + it.name;
        };
        double rmr = calculatorService.countRMR(meal.age.asType(int), meal.sex, meal.weight.asType(double));
        println rmr;
        render([rmr:rmr] as JSON)
    }

    def countDWE(){
        def meal = JSON.parse(params.bmrData);
        double rmr = calculatorService.countRMR(meal.age.asType(int), meal.sex, meal.weight.asType(double));
        String lifeStyleMode = meal?.lifeStyleMode?.replace(',','.');
        double dwe = 0
        if(lifeStyleMode) {
            dwe = rmr * lifeStyleMode?.asType(double);
        }
        println dwe;
        render([dwe:dwe] as JSON)
    }

    def countExercisesKcal(){
        double kcal = userService.countExercisesKcalories(params.bmrData)
        render ([kcal: (int) kcal] as JSON)
    }

    def countDailyKcal(){
        double kcal = userService.countDailyKcalories(params.bmrData)
        render ([kcal:(int) kcal] as JSON)
    }

    def countAllKcal(){
        double kcal = userService.countAllKcalories(params.bmrData);
        render ([kcal:(int) kcal] as JSON)
    }
}
