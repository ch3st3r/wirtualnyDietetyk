package wirtualnydietetyk

class CalculatorTagLib {
    static defaultEncodeAs = [taglib:'html']
    static namespace = "calculator"
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def calculateExerciseKcalPerDay = {attrs ->
        double exercisesKcal = attrs.kcal.asType(double);
        double kcalPerDay = exercisesKcal/7;
        out << kcalPerDay;
    }
}
