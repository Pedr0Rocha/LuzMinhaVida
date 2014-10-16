package luzminhavida



import grails.test.mixin.*
import spock.lang.*

@TestFor(RelatorioFuncionariosController)
@Mock(RelatorioFuncionarios)
class RelatorioFuncionariosControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.relatorioFuncionariosInstanceList
            model.relatorioFuncionariosInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.relatorioFuncionariosInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def relatorioFuncionarios = new RelatorioFuncionarios()
            relatorioFuncionarios.validate()
            controller.save(relatorioFuncionarios)

        then:"The create view is rendered again with the correct model"
            model.relatorioFuncionariosInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            relatorioFuncionarios = new RelatorioFuncionarios(params)

            controller.save(relatorioFuncionarios)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/relatorioFuncionarios/show/1'
            controller.flash.message != null
            RelatorioFuncionarios.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def relatorioFuncionarios = new RelatorioFuncionarios(params)
            controller.show(relatorioFuncionarios)

        then:"A model is populated containing the domain instance"
            model.relatorioFuncionariosInstance == relatorioFuncionarios
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def relatorioFuncionarios = new RelatorioFuncionarios(params)
            controller.edit(relatorioFuncionarios)

        then:"A model is populated containing the domain instance"
            model.relatorioFuncionariosInstance == relatorioFuncionarios
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/relatorioFuncionarios/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def relatorioFuncionarios = new RelatorioFuncionarios()
            relatorioFuncionarios.validate()
            controller.update(relatorioFuncionarios)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.relatorioFuncionariosInstance == relatorioFuncionarios

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            relatorioFuncionarios = new RelatorioFuncionarios(params).save(flush: true)
            controller.update(relatorioFuncionarios)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/relatorioFuncionarios/show/$relatorioFuncionarios.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/relatorioFuncionarios/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def relatorioFuncionarios = new RelatorioFuncionarios(params).save(flush: true)

        then:"It exists"
            RelatorioFuncionarios.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(relatorioFuncionarios)

        then:"The instance is deleted"
            RelatorioFuncionarios.count() == 0
            response.redirectedUrl == '/relatorioFuncionarios/index'
            flash.message != null
    }
}
