

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TestowaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Testowa.list(params), model:[testowaInstanceCount: Testowa.count()]
    }

    def show(Testowa testowaInstance) {
        respond testowaInstance
    }

    def create() {
        respond new Testowa(params)
    }

    @Transactional
    def save(Testowa testowaInstance) {
        if (testowaInstance == null) {
            notFound()
            return
        }

        if (testowaInstance.hasErrors()) {
            respond testowaInstance.errors, view:'create'
            return
        }

        testowaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'testowa.label', default: 'Testowa'), testowaInstance.id])
                redirect testowaInstance
            }
            '*' { respond testowaInstance, [status: CREATED] }
        }
    }

    def edit(Testowa testowaInstance) {
        respond testowaInstance
    }

    @Transactional
    def update(Testowa testowaInstance) {
        if (testowaInstance == null) {
            notFound()
            return
        }

        if (testowaInstance.hasErrors()) {
            respond testowaInstance.errors, view:'edit'
            return
        }

        testowaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Testowa.label', default: 'Testowa'), testowaInstance.id])
                redirect testowaInstance
            }
            '*'{ respond testowaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Testowa testowaInstance) {

        if (testowaInstance == null) {
            notFound()
            return
        }

        testowaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Testowa.label', default: 'Testowa'), testowaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'testowa.label', default: 'Testowa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
