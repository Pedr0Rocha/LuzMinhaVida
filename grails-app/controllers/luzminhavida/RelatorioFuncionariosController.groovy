package luzminhavida



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RelatorioFuncionariosController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RelatorioFuncionarios.list(params), model:[relatorioFuncionariosInstanceCount: RelatorioFuncionarios.count()]
    }

    def show(RelatorioFuncionarios relatorioFuncionariosInstance) {
        respond relatorioFuncionariosInstance
    }

    def create() {
        respond new RelatorioFuncionarios(params)
    }

    @Transactional
    def save(RelatorioFuncionarios relatorioFuncionariosInstance) {
        if (relatorioFuncionariosInstance == null) {
            notFound()
            return
        }

        if (relatorioFuncionariosInstance.hasErrors()) {
            respond relatorioFuncionariosInstance.errors, view:'create'
            return
        }

        relatorioFuncionariosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'relatorioFuncionarios.label', default: 'RelatorioFuncionarios'), relatorioFuncionariosInstance.id])
                redirect relatorioFuncionariosInstance
            }
            '*' { respond relatorioFuncionariosInstance, [status: CREATED] }
        }
    }

    def edit(RelatorioFuncionarios relatorioFuncionariosInstance) {
        respond relatorioFuncionariosInstance
    }

    @Transactional
    def update(RelatorioFuncionarios relatorioFuncionariosInstance) {
        if (relatorioFuncionariosInstance == null) {
            notFound()
            return
        }

        if (relatorioFuncionariosInstance.hasErrors()) {
            respond relatorioFuncionariosInstance.errors, view:'edit'
            return
        }

        relatorioFuncionariosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RelatorioFuncionarios.label', default: 'RelatorioFuncionarios'), relatorioFuncionariosInstance.id])
                redirect relatorioFuncionariosInstance
            }
            '*'{ respond relatorioFuncionariosInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RelatorioFuncionarios relatorioFuncionariosInstance) {

        if (relatorioFuncionariosInstance == null) {
            notFound()
            return
        }

        relatorioFuncionariosInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RelatorioFuncionarios.label', default: 'RelatorioFuncionarios'), relatorioFuncionariosInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'relatorioFuncionarios.label', default: 'RelatorioFuncionarios'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
