package com.myApp

class UserMeal {
    String name;
    String receipt;
    MealDetailsInfo mealDetailsInfo

    static hasMany = [ingredients: Ingredient]
    static belongsTo = [diet: Diet]
    /*static hasOne = [mealDetailsInfo: MealDetailsInfo]*/

    UserMeal(String name, String receipt){
        this.name = name;
        this.receipt = receipt;
    }

    static constraints = {
        mealDetailsInfo nullable:true;
    }
}