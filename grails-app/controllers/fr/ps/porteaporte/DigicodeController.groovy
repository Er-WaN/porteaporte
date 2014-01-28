package fr.ps.porteaporte



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DigicodeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Digicode.list(params), model:[digicodeInstanceCount: Digicode.count()]
    }

    def show(Digicode digicodeInstance) {
        respond digicodeInstance
    }

    def create() {
        respond new Digicode(params)
    }

    @Transactional
    def save(Digicode digicodeInstance) {
        if (digicodeInstance == null) {
            notFound()
            return
        }

        if (digicodeInstance.hasErrors()) {
            respond digicodeInstance.errors, view:'create'
            return
        }

        digicodeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'digicode.create')
				redirect(controller: "digicode", action: "index")
            }
            '*' { respond digicodeInstance, [status: CREATED] }
        }
    }

    def edit(Digicode digicodeInstance) {
        respond digicodeInstance
    }

    @Transactional
    def update(Digicode digicodeInstance) {
        if (digicodeInstance == null) {
            notFound()
            return
        }

        if (digicodeInstance.hasErrors()) {
            respond digicodeInstance.errors, view:'edit'
            return
        }

        digicodeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'digicode.update')
				redirect(controller: "digicode", action: "index")
            }
            '*'{ respond digicodeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Digicode digicodeInstance) {

        if (digicodeInstance == null) {
            notFound()
            return
        }

        digicodeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'digicode.delete')
				redirect(controller: "digicode", action: "index")
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'digicodeInstance.label', default: 'Digicode'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
