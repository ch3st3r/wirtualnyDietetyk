package com.myApp

class Product {
    static searchable = [only: ['name']];

    String name;
    double weight;
    String units;

    double kcal;
    double protein;
    double carbohydrates;
    double fats;

    Product(String name, double weight, String units, double kcal, double protein, double carbohydrates, double fats){
        this.name = name;
        this.weight = weight;
        this.units = units;
        this.kcal = kcal;
        this.protein = protein;
        this.carbohydrates = carbohydrates;
        this.fats = fats;
    }

    static constraints = {
    }

/*    static mapping = {
        id generator: 'sequence'
    }*/
}
