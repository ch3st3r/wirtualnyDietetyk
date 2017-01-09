package com.myApp

class Diet {
    static hasMany = [userMeal: UserMeal]
    static belongsTo = [user:User]   // dodane 23:31

    static constraints = {
    }
}
