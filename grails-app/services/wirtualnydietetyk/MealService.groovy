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


    def countMealDetails(MealDetailsInfo mealDetails, Product product, double weight){
        mealDetails.kcal += product.kcal * weight / product.weight;
        mealDetails.carbohydrates += product.carbohydrates * weight / product.weight;
        mealDetails.protein += product.protein * weight / product.weight;
        mealDetails.fats += product.fats * weight / product.weight;
        return mealDetails;
    }

/*
    def bootStrapMethod(){
        def ing1 = new Ingredient(Product.findByName(rise, 50).save(flush:true);
        def ing2 = new Ingredient(kurczak, 200).save(flush:true);;
        def ing3 = new Ingredient(cheese, 40).save(flush:true);
        def ing4 = new Ingredient(ham, 40).save(flush:true);
        def ing5 = new Ingredient(papryka, 30).save(flush:true);
        def ing6 = new Ingredient(platki, 60).save(flush:true);

        Meal meal1 = new Meal('meal1', 'xxx1').save(flush:true);
        meal1.addToIngredients(ing1);
        meal1.save(flush:true)
    }*/
}
