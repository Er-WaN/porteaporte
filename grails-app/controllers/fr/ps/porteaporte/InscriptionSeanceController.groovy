package fr.ps.porteaporte



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InscriptionSeanceController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def c = Seance.createCriteria()
		def result = c.list(params) { eq("etat", 1) }
		respond result, model:[seanceInstanceCount: result.size()]
	}

	def show(InscriptionSeance inscriptionSeanceInstance) {
		respond inscriptionSeanceInstance
	}

	def create() {
		respond new InscriptionSeance(params)
	}

	@Transactional
	def save(InscriptionSeance inscriptionSeanceInstance) {
						
		if (inscriptionSeanceInstance == null) {
			notFound()
			return
		}

		if (inscriptionSeanceInstance.hasErrors()) {
			respond inscriptionSeanceInstance.errors, view:'participer'
			return
		}

		inscriptionSeanceInstance.save flush:true

		request.withFormat {
			form {
				flash.message = "Merci pour votre participation."
				redirect(controller: "inscriptionSeance", action: "index")
			}
			'*' { respond inscriptionSeanceInstance, [status: CREATED] }
		}
	}

	def edit(InscriptionSeance inscriptionSeanceInstance) {
		respond inscriptionSeanceInstance
	}

	@Transactional
	def update(InscriptionSeance inscriptionSeanceInstance) {
		if (inscriptionSeanceInstance == null) {
			notFound()
			return
		}

		if (inscriptionSeanceInstance.hasErrors()) {
			respond inscriptionSeanceInstance.errors, view:'edit'
			return
		}

		inscriptionSeanceInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'InscriptionSeance.label', default: 'InscriptionSeance'),
					inscriptionSeanceInstance.id
				])
				redirect inscriptionSeanceInstance
			}
			'*'{ respond inscriptionSeanceInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(InscriptionSeance inscriptionSeanceInstance) {

		if (inscriptionSeanceInstance == null) {
			notFound()
			return
		}

		inscriptionSeanceInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'InscriptionSeance.label', default: 'InscriptionSeance'),
					inscriptionSeanceInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'inscriptionSeanceInstance.label', default: 'InscriptionSeance'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def participer() {
		Seance seance = Seance.get(params.seance_id)
		respond new InscriptionSeance(params), model:[seanceInstance: seance]
	}
}
