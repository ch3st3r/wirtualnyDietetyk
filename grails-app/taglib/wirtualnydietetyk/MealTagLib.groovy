package wirtualnydietetyk

class MealTagLib {
    static defaultEncodeAs = [taglib:'html']
    static namespace = "meal"
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def percentValue = {attrs ->
        double kcal = attrs.kcal.asType(double);
        double bwt = attrs.bwt.asType(double);
        double percent = (bwt * attrs.x.asType(double))/kcal
        out << percent;
    }
}
