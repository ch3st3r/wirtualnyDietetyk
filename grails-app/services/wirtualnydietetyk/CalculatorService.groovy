package wirtualnydietetyk

import com.myApp.User
import grails.transaction.Transactional

@Transactional
class CalculatorService {

    def serviceMethod() {

    }

    def countRMR(User user){
        ArrayList<Double> rmrCoefficient = getRmrCoefficient(user?.age);
        double rmr = user?.weight * rmrCoefficient.get(0) + rmrCoefficient.get(1);
        return rmr;
    }

    def getRmrCoefficient(int age){
        ArrayList<Double> rmrCoefficient = new ArrayList<>(2);

        if(age > 10 && age <= 18){
            rmrCoefficient.add(0, 17,5)
            rmrCoefficient.add(1, 651)
        } else if(age > 18 && age <= 30){
            rmrCoefficient.add(0, 15,3)
            rmrCoefficient.add(1, 679)
        } else if(age >= 31){
            rmrCoefficient.add(0, 11,6)
            rmrCoefficient.add(1, 879)
        }
        return rmrCoefficent;
    }


    def rmrMenFirstPattern(double weight){
        double RMR = weight * 17.5 + 651;
        return RMR;
    }

    def rmrMenSecondPattern(double weight){
        double RMR = weight * 15.3 + 679;
        return RMR;
    }

    def rmrMenThridPattern(double weight){
        double RMR = weight * 11.6 + 879;
        return RMR;
    }

    def rmrWomanFirstPattern(double weight){
        double RMR = weight * 12.2 + 746;
        return RMR;
    }

    def rmrWomanSecondPattern(double weight){
        double RMR = weight * 14.7 + 496;
        return RMR;
    }

    def rmrWomanThirdPattern(double weight){
        double RMR = weight * 8.7 + 829;
        return RMR;
    }

    def countRMR(int age, String sex, double weight){
        double RMR = 0;
        println age;
        println sex;
        println weight;

       if(sex == 'men'){
           if(age >= 10 && age < 18){
               RMR = rmrMenFirstPattern(weight);
               println 'man1'
           } else if(age >= 18 && age <= 30){
               RMR = rmrMenSecondPattern(weight);
               println 'man2'
           } else if(age >= 31 && age <= 60){
               RMR = rmrMenThridPattern(weight);
               println 'man3'
           }
       } else if(sex == 'women'){
           if(age >= 10 && age < 18){
               RMR = rmrWomanFirstPattern(weight);
               println 'woman1'
           } else if(age >= 18 && age <= 30){
               RMR = rmrWomanSecondPattern(weight);
               println 'woman2'
           } else if(age >= 31 && age <= 60){
               RMR = rmrWomanThirdPattern(weight);
               println 'woman3'
           }
       }

       return RMR;
    }








}
