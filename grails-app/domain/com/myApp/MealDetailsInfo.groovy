package com.myApp

class MealDetailsInfo {
    double kcal;
    double protein;
    double carbohydrates;
    double fats;

    static belongsTo = [meal:Meal, userMeal:UserMeal]

    static constraints = {
        meal (nullable: true, validator: {field, inst -> inst.userMeal || field})
        userMeal nullable:true
    }
}
