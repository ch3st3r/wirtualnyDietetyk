package wirtualnydietetyk

import com.myApp.CurrentUserMacro
import com.myApp.User
import grails.transaction.Transactional

@Transactional
class VirtualNutritionistService {

    def serviceMethod() {

    }

    def getCurrentUserMacro(User user){
        double allKcal = user.userKcalInfo.allKcal;
        double w = 0.6 * allKcal;
        double b = 0.25 * allKcal;
        double f = 0.15 * allKcal;

        CurrentUserMacro currentUserMacro = new CurrentUserMacro(0.25*allKcal, 0.6*allKcal, 0.15*allKcal, allKcal, w/allKcal, b/allKcal, f/allKcal);
        return currentUserMacro;
    }
}
