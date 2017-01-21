package com.myApp

import grails.plugin.springsecurity.SpringSecurityService
import wirtualnydietetyk.VirtualNutritionistService

class VirtualNutritionistController {
    SpringSecurityService springSecurityService
    VirtualNutritionistService virtualNutritionistService

    def index() { }

    def generateDiet(){
        CurrentUserMacro currentUserMacro = virtualNutritionistService.getCurrentUserMacro(springSecurityService.getCurrentUser());
        ArrayList<Meal> utilisedMeals = new ArrayList<Meal>();
        Meal currentMeal;
        UserMeal userMeal;
        Diet diet = new Diet();
        User user = springSecurityService.getCurrentUser();

        for(int i = 1; i<36; i++) {
            double previousCoefficient = 1000;
            double coefficient;

            Meal.list().each {
                coefficient = virtualNutritionistService.countCoefficient(it, currentUserMacro);
                if (coefficient < previousCoefficient && !utilisedMeals.contains(it)) {
                    previousCoefficient = coefficient;
                    currentMeal = it;
                }
            }

            userMeal = virtualNutritionistService.createUserMeal(currentMeal, currentUserMacro.kcal);
            userMeal.ingredients.each {
                println it.product.name + ' ' + it.weight
            }

            currentUserMacro = virtualNutritionistService.updateCurrentUserMacro(currentUserMacro, userMeal);
            utilisedMeals.add(currentMeal);

            utilisedMeals.each{
                println it.name;
            }
            diet.addToUserMeal(userMeal);

            if(i%5 == 0){
                currentUserMacro = virtualNutritionistService.getCurrentUserMacro(springSecurityService.getCurrentUser());
            }

        }
        diet.user = user;
        diet.save(flush:true);

        render 'status ok';
    }

    def deleteUserMeal(){
        UserMeal.findAll().each{
            it.delete(flush:true);
        }

        render 'status ok';
    }

}
