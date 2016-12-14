import com.myApp.MealDetailsInfo
import com.myApp.User;
import com.myApp.Role;
import com.myApp.UserRole;
import com.myApp.Product;
import com.myApp.Sport;
import com.myApp.Meal;
import com.myApp.Ingredient
import wirtualnydietetyk.MealService;

class BootStrap {
    MealService mealService

    def init = { servletContext ->
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        def admin = new User('admin', 'password').save(flush:true);
        def u1 = new UserRole(admin, adminRole).save(flush:true);

        def rise = new Product('ryż biały długoziarnisty', 100, 'g', 357, 7.9, 79, 0.9).save(flush: true);
        def cheese = new Product('ser zółty', 100, 'g', 380, 28.8, 0.1, 29.7).save(flush:true);
        def ham = new Product('szynka gotowana', 100, 'g', 103, 20, 1.1, 2.1).save(flush:true);
        def oil = new Product('oliwa', 100, 'ml', 822, 0, 0, 91.6).save(flush:true);
        def platki = new Product('platki owsiane', 100, 'g', 366, 69.3, 11.9, 7.2).save(flush:true);
        def papryka = new Product('papryka', 100, 'g', 28, 6.6, 1.3, 0.5).save(flush:true);
        def kurczak = new Product('kurczak', 100, 'g', 99, 0, 21.5, 1.3).save(flush:true);
/*
        mealService.bootStrapMethod();*/

        def ing1 = new Ingredient(rise, 50);
        def ing2 = new Ingredient(kurczak, 200);
        def ing3 = new Ingredient(cheese, 40);
        def ing4 = new Ingredient(ham, 40);
        def ing5 = new Ingredient(papryka, 30);
        def ing6 = new Ingredient(platki, 60);

        if(ing1 == null){
            println 'x null';
        }

    /*    Meal meal1 = new Meal('meal1', 'xxx1');
        meal1.addToIngredients(ing1);
        meal1.save(flush:true)
*/

        Meal meal1 = new Meal('meal1', 'xxx1');
        MealDetailsInfo mealDetails1 = new MealDetailsInfo();
        mealDetails1 = mealService.countMealDetails(mealDetails1, rise, 50);
        mealDetails1 = mealService.countMealDetails(mealDetails1, kurczak, 200);
        meal1.addToIngredients(ing1);
        meal1.addToIngredients(ing2);
        meal1.mealDetailsInfo = mealDetails1;
        meal1.save(flush:true);


        Meal meal2 = new Meal('meal2', 'xxx2');
        MealDetailsInfo mealDetails2 = new MealDetailsInfo();
        mealDetails2 = mealService.countMealDetails(mealDetails2, cheese, 40);
        mealDetails2 = mealService.countMealDetails(mealDetails2, ham, 40);
        meal2.addToIngredients(ing3);
        meal2.addToIngredients(ing4);
        meal2.mealDetailsInfo = mealDetails2;
        meal2.save(flush:true);

        Meal meal3 = new Meal('meal3', 'xxx3');
        MealDetailsInfo mealDetails3 = new MealDetailsInfo();
        mealDetails3 = mealService.countMealDetails(mealDetails3, papryka, 30);
        mealDetails3 = mealService.countMealDetails(mealDetails3, platki, 60);
        meal3.addToIngredients(ing5);
        meal3.addToIngredients(ing6);
        meal3.mealDetailsInfo = mealDetails3;
        meal3.save(flush:true);


        def volleyball = new Sport('siatkowka', 150).save(flush:true);
        def football = new Sport('football', 200).save(flush:true);
        def basketball = new Sport('koszykówka', 100).save(flush:true);
        def tennis = new Sport('tenis', 250).save(flush:true);
        def curling = new Sport('curling', 75).save(flush:true);
    }

    def destroy = {
    }
}
