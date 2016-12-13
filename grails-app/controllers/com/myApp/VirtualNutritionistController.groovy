package com.myApp

import grails.plugin.springsecurity.SpringSecurityService
import wirtualnydietetyk.VirtualNutritionistService

class VirtualNutritionistController {
    SpringSecurityService springSecurityService
    VirtualNutritionistService virtualNutritionistService

    def index() { }

    def generateDiet(){
        CurrentUserMacro currentUserMacro = virtualNutritionistService.getCurrentUserMacro(springSecurityService.getCurrentUser());
        println currentUserMacro.Wperc + ' ' + currentUserMacro.carbohydrates + ' weglowodany, ' + currentUserMacro.Bperc + ' ' + currentUserMacro.protein + ' bialko'
        double previousCoefficient = 100;
        double coefficient;
        ArrayList<Meal> utilisedMeals = new ArrayList<Meal>();

        for(int i = 1; i<3; i++){
            Meal currentMeal;

            Meal.list().each{
               it.name;
            }


        }



        println 'xxx'
        render 'status ok';
    }
}
