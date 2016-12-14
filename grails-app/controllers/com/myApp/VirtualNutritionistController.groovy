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

        for(int i = 1; i<3; i++) {
            double previousCoefficient = 100;
            double coefficient;

            Meal.list().each {
                coefficient = virtualNutritionistService.countCoefficient(it, currentUserMacro);
                if (coefficient < previousCoefficient && !utilisedMeals.contains(it)) {
                    previousCoefficient = coefficient;
                    currentMeal = it;
                }
            }

            UserMeal userMeal = virtualNutritionistService.createUserMeal(currentMeal, currentUserMacro.kcal);
            userMeal.ingredients.each {
                println it.product.name + ' ' + it.weight
            }

            currentUserMacro = virtualNutritionistService.updateCurrentUserMacro(currentUserMacro, userMeal);
            utilisedMeals.add(currentMeal);

            utilisedMeals.each{
                println it.name;
            }


        }
        render 'status ok';
    }
}
