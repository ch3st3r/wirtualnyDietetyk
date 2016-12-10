package com.myApp

class UserKcalInfo {
    double bmr;
    double dwe;
    double exercisesKcal;
    double dailyKcal;
    double allKcal;

    static belongsTo = [user: User];

    static constraints = {
    }
}
