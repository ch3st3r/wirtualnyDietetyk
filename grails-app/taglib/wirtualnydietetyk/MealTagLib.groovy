package wirtualnydietetyk

import com.myApp.Meal
import com.myApp.MealDetailsInfo

class MealTagLib {
    static defaultEncodeAs = [taglib: 'html']
    static namespace = "meal"
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def percentValue = { attrs ->
        double kcal = attrs.kcal.asType(double);
        double bwt = attrs.bwt.asType(double);
        double percent = (bwt * attrs.x.asType(double)) / kcal
        out << round(percent, 2);
    }

    def percentValueOfMeal = { attrs ->
        MealDetailsInfo meal = MealDetailsInfo.findById(attrs.meal.asType(long));
        double bwt = attrs.bwt.asType(double);
        double percent = (bwt * attrs.x.asType(double))/(meal.protein*4 + meal.carbohydrates*4 + meal.fats*9);
        out << round(percent, 2)*100;
    }

    public static double round(double value, int places) {
        if (places < 0) throw new IllegalArgumentException();

        long factor = (long) Math.pow(10, places);
        value = value * factor;
        long tmp = Math.round(value);
        return (double) tmp / factor;
    }
}
