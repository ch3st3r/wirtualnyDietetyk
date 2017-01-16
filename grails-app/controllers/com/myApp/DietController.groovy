package com.myApp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DietController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Diet.list(params), model:[dietInstanceCount: Diet.count()]
    }

    def show(Diet dietInstance) {
        respond dietInstance
    }

    def create() {
        respond new Diet(params)
    }

    @Transactional
    def save(Diet dietInstance) {
        if (dietInstance == null) {
            notFound()
            return
        }

        if (dietInstance.hasErrors()) {
            respond dietInstance.errors, view:'create'
            return
        }

        dietInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'diet.label', default: 'Diet'), dietInstance.id])
                redirect dietInstance
            }
            '*' { respond dietInstance, [status: CREATED] }
        }
    }

    def edit(Diet dietInstance) {
        respond dietInstance
    }

    @Transactional
    def update(Diet dietInstance) {
        if (dietInstance == null) {
            notFound()
            return
        }

        if (dietInstance.hasErrors()) {
            respond dietInstance.errors, view:'edit'
            return
        }

        dietInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Diet.label', default: 'Diet'), dietInstance.id])
                redirect dietInstance
            }
            '*'{ respond dietInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Diet dietInstance) {

        if (dietInstance == null) {
            notFound()
            return
        }

        dietInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Diet.label', default: 'Diet'), dietInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'diet.label', default: 'Diet'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
