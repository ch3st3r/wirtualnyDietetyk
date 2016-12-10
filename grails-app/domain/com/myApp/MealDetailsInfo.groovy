package com.myApp

class MealDetailsInfo {
    double kcal;
    double protein;
    double carbohydrates;
    double fats;

    static belongsTo = [meal:Meal]

    static constraints = {
    }
}
