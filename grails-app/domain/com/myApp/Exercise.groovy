package com.myApp

class Exercise {
    Sport sport;
    int minutes;

    static belongsTo = [user: User];

    static constraints = {
    }

    Exercise(Sport sport, int minutes){
        this.sport = sport;
        this.minutes = minutes;
    }
}
