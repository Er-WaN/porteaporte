package fr.ps.porteaporte



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
		def user = new User(params)
		user.enabled = true
        respond user
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }
		
		userInstance.save()
		
		def r = Role.get(params.role_id)
		UserRole.create_ur(userInstance, r)

		if (!params.containsKey("enabled")) {
			userInstance.setEnabled(false)
		}
		
        request.withFormat {
            form {
                flash.message = message(code: 'user.created.message', args: [message(code: 'userInstance.label', default: 'User'), userInstance.nom])
                redirect(controller: "user")
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }
		
		def u = User.get(params.id)
		def r = Role.get(params.role_id)
		UserRole.update_ur(u, r)

		if (!params.containsKey("enabled")) {
			userInstance.setEnabled(false)
		}
		
        userInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'user.updated.message')
				redirect(controller: "user")
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }
		
		fr.ps.porteaporte.UserRole.removeAll(userInstance)

        userInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'user.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
