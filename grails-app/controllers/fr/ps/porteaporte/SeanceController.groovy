package fr.ps.porteaporte



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import groovy.json.JsonBuilder
import grails.converters.JSON

@Transactional(readOnly = true)
class SeanceController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def c = Seance.createCriteria()
		def result = c.list(params) { eq("etat", 1) }
		respond result, model:[seanceInstanceCount: result.size()]
	}

	def indexClotures(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def c = Seance.createCriteria()
		def result = c.list(params) { eq("etat", 2) }
		respond result, model:[seanceInstanceCount: result.size()]
	}

	def show(Seance seanceInstance) {
		respond seanceInstance
	}

	def create() {

		def seanceInstance = new Seance(params)

		respond seanceInstance
	}

	@Transactional
	def save(Seance seanceInstance) {

		if (seanceInstance == null) {
			notFound()
			return
		}

		if (seanceInstance.hasErrors()) {
			respond seanceInstance.errors, view:'create'
			return
		}

		seanceInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'seance.create')
				redirect seanceInstance
			}
			'*' { respond seanceInstance, [status: CREATED] }
		}
	}

	def edit(Seance seanceInstance) {
		respond seanceInstance
	}

	@Transactional
	def update(Seance seanceInstance) {
		if (seanceInstance == null) {
			notFound()
			return
		}

		if (seanceInstance.hasErrors()) {
			respond seanceInstance.errors, view:'edit'
			return
		}

		seanceInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'seance.update')
				redirect seanceInstance
			}
			'*'{ respond seanceInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Seance seanceInstance) {

		if (seanceInstance == null) {
			notFound()
			return
		}

		seanceInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'seance.delete')
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'seanceInstance.label', default: 'Seance'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def cloturer(Seance seanceInstance) {
		respond seanceInstance
	}

	@Transactional
	def update_cloturer(Seance seanceInstance) {
		if (seanceInstance == null) {
			notFound()
			return
		}

		if (seanceInstance.hasErrors()) {
			respond seanceInstance.errors, view:'edit'
			return
		}
		
		seanceInstance.setEtat(2)

		seanceInstance.save flush:true

		request.withFormat {
			form {
				flash.message = "Séance cloturée"
				redirect seanceInstance
			}
			'*'{ respond seanceInstance, [status: OK] }
		}
	}
	
	def carte(Integer max) {
		
		def converter = new JSON(Seance.list());
		respond converter
	}
}
