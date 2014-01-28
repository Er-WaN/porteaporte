package fr.ps.porteaporte



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QuartierController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Quartier.list(params), model:[quartierInstanceCount: Quartier.count()]
    }

    def show(Quartier quartierInstance) {
        respond quartierInstance
    }

    def create() {
        respond new Quartier(params)
    }

    @Transactional
    def save(Quartier quartierInstance) {
        if (quartierInstance == null) {
            notFound()
            return
        }

        if (quartierInstance.hasErrors()) {
            respond quartierInstance.errors, view:'create'
            return
        }

        quartierInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'quartierInstance.label', default: 'Quartier'), quartierInstance.nom])
                redirect quartierInstance
            }
            '*' { respond quartierInstance, [status: CREATED] }
        }
    }

    def edit(Quartier quartierInstance) {
        respond quartierInstance
    }

    @Transactional
    def update(Quartier quartierInstance) {
        if (quartierInstance == null) {
            notFound()
            return
        }

        if (quartierInstance.hasErrors()) {
            respond quartierInstance.errors, view:'edit'
            return
        }

        quartierInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Quartier.label', default: 'Quartier'), quartierInstance.id])
                redirect quartierInstance
            }
            '*'{ respond quartierInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Quartier quartierInstance) {

        if (quartierInstance == null) {
            notFound()
            return
        }

        quartierInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Quartier.label', default: 'Quartier'), quartierInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'quartierInstance.label', default: 'Quartier'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
