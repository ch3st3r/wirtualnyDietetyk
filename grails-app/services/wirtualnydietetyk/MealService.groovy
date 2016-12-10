package wirtualnydietetyk

import com.myApp.Ingredient
import com.myApp.Meal
import com.myApp.MealDetailsInfo
import com.myApp.Product
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.JSONElement

@Transactional
class MealService {

    def serviceMethod() {

    }

    def addMeal(JSONElement meal, String mealName, String receipt){
        Meal newMeal = new Meal(mealName, receipt);
        MealDetailsInfo mealDetails = new MealDetailsInfo();
        meal.each(){
            Product product = Product.findByName(it?.product);
            Ingredient ingredient = new Ingredient(product, it?.weight.asType(double))
            mealDetails = countMealDetails(mealDetails, product, it?.weight.asType(double));
            println ingredient.product.name;
            newMeal.addToIngredients(ingredient);
        }
       mealDetails.save(flush:true);
       newMeal.mealDetailsInfo = mealDetails;
       newMeal.save(flush:true)
    }


    def countMealDetails(MealDetailsInfo mealDetails, product, double weight){
        mealDetails.kcal += product.kcal * weight / product.weight;
        mealDetails.carbohydrates += product.carbohydrates * weight / product.weight;
        mealDetails.protein += product.protein * weight / product.weight;
        mealDetails.fats += product.fats * weight / product.weight;
        return mealDetails;
    }
}
