package com.myApp;

/**
 * Created by Damian on 2016-12-12.
 */
public class CurrentUserMacro {
    double protein;
    double carbohydrates;
    double fats;
    double kcal;
    double Wperc;
    double Bperc;
    double Tperc;

    CurrentUserMacro(double protein, double carbohydrates, double fats, double kcal, double Wperc, double Bperc, double Tperc){
        this.protein = protein;
        this.carbohydrates = carbohydrates;
        this.fats = fats;
        this.kcal = kcal;
        this.Wperc = Wperc;
        this.Bperc = Bperc;
        this.Tperc = Tperc;
    }
}
