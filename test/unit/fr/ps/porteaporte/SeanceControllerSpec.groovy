package fr.ps.porteaporte



import grails.test.mixin.*
import spock.lang.*

@TestFor(SeanceController)
@Mock(Seance)
class SeanceControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.seanceInstanceList
            model.seanceInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.seanceInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def seance = new Seance()
            seance.validate()
            controller.save(seance)

        then:"The create view is rendered again with the correct model"
            model.seanceInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            seance = new Seance(params)

            controller.save(seance)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/seance/show/1'
            controller.flash.message != null
            Seance.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def seance = new Seance(params)
            controller.show(seance)

        then:"A model is populated containing the domain instance"
            model.seanceInstance == seance
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def seance = new Seance(params)
            controller.edit(seance)

        then:"A model is populated containing the domain instance"
            model.seanceInstance == seance
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/seance/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def seance = new Seance()
            seance.validate()
            controller.update(seance)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.seanceInstance == seance

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            seance = new Seance(params).save(flush: true)
            controller.update(seance)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/seance/show/$seance.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/seance/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def seance = new Seance(params).save(flush: true)

        then:"It exists"
            Seance.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(seance)

        then:"The instance is deleted"
            Seance.count() == 0
            response.redirectedUrl == '/seance/index'
            flash.message != null
    }
}
