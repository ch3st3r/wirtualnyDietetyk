package com.myApp

class Ingredient {
    Product product;
    double weight;

    static belongsTo = [meal: Meal]

    static searchable = true;

    static constraints = {
    }

    Ingredient(Product product, double weight){
        this.product = product;
        this.weight = weight;
    }
}
