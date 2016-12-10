package com.myApp

import grails.converters.JSON
import groovy.json.JsonBuilder
import wirtualnydietetyk.MealService

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MealController {

    MealService mealService;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Meal.list(params), model:[mealInstanceCount: Meal.count()]
    }

    def show(Meal mealInstance) {
        respond mealInstance
    }

    def showMeal(Meal mealInstance) {
        respond mealInstance
    }

    def create() {
        respond new Meal(params)
    }

    def createMeal(){
        ArrayList<Product> products = Product.findAll();
        return [products: products]
    }

    def addMeal(){
        println params;
        def meal = JSON.parse(params.dupa);
        mealService.addMeal(meal, params.mealName, params.receipt);
    }

    def search(String q){

        def searchResults = [:]
        if(q) {
            searchResults.productResults = trySearch { Product.search("*${q}*", [max: 10]) }
        }
        render template: 'searchResults', model: searchResults
    }

    private trySearch(Closure callable) {
        try {
            return callable()
        } catch (Exception e) {
            log.debug "Search Error: ${e.message}", e
            return []
        }
    }

    def dupa(params){
      def searchResult = [:]
      ArrayList<Object> searchedProducts = new ArrayList<>();

        if(params.q){
            searchResult.productResults = trySearch { Product.search("*${params?.q}*", [max: 10]) }
            for(Product p : searchResult.productResults.results){
                Map<String,Object> map = new HashMap<String,Object>();
                map.put('id', p.id);
                map.put('text', p.name);
                searchedProducts.add(map);
            }
        }

        render searchedProducts as JSON;
          //  render ([[id:'1',text:'dupa'], [id:'2',text:'dupa2']] as JSON )
    }

    @Transactional
    def save(Meal mealInstance) {
        if (mealInstance == null) {
            notFound()
            return
        }

        if (mealInstance.hasErrors()) {
            respond mealInstance.errors, view:'create'
            return
        }

        mealInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'meal.label', default: 'Meal'), mealInstance.id])
                redirect mealInstance
            }
            '*' { respond mealInstance, [status: CREATED] }
        }
    }

    def edit(Meal mealInstance) {
        respond mealInstance
    }

    @Transactional
    def update(Meal mealInstance) {
        if (mealInstance == null) {
            notFound()
            return
        }

        if (mealInstance.hasErrors()) {
            respond mealInstance.errors, view:'edit'
            return
        }

        mealInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Meal.label', default: 'Meal'), mealInstance.id])
                redirect mealInstance
            }
            '*'{ respond mealInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Meal mealInstance) {

        if (mealInstance == null) {
            notFound()
            return
        }

        mealInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Meal.label', default: 'Meal'), mealInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'meal.label', default: 'Meal'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
