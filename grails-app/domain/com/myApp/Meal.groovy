package com.myApp

/**
 * Created by Damian on 2016-10-28.
 */
class Meal {
    String name;
    String receipt;
    MealDetailsInfo mealDetailsInfo;

    static hasMany = [ingredients: Ingredient]
    /*static hasOne = [mealDetailsInfo: MealDetailsInfo]*/

    Meal(String name, String receipt){
        this.name = name;
        this.receipt = receipt;
    }

    static constraints = {
        mealDetailsInfo nullable:true;
    }
}
