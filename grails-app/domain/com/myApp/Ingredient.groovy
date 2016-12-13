package com.myApp

class Ingredient {
    Product product;
    double weight;

    static belongsTo = [meal: Meal, userMeal:UserMeal]

    static searchable = true;

    static constraints = {
        meal (nullable: true, validator: {field, inst -> inst.userMeal || field})
        userMeal nullable:true
    }

    Ingredient(Product product, double weight){
        this.product = product;
        this.weight = weight;
    }
}
