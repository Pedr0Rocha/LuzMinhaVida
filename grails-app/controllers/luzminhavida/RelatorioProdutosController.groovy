package luzminhavida



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RelatorioProdutosController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RelatorioProdutos.list(params), model:[relatorioProdutosInstanceCount: RelatorioProdutos.count()]
    }

    def show(RelatorioProdutos relatorioProdutosInstance) {
        respond relatorioProdutosInstance
    }

    def create() {
        respond new RelatorioProdutos(params)
    }

    @Transactional
    def save(RelatorioProdutos relatorioProdutosInstance) {
        if (relatorioProdutosInstance == null) {
            notFound()
            return
        }

        if (relatorioProdutosInstance.hasErrors()) {
            respond relatorioProdutosInstance.errors, view:'create'
            return
        }

        relatorioProdutosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'relatorioProdutos.label', default: 'RelatorioProdutos'), relatorioProdutosInstance.id])
                redirect relatorioProdutosInstance
            }
            '*' { respond relatorioProdutosInstance, [status: CREATED] }
        }
    }

    def edit(RelatorioProdutos relatorioProdutosInstance) {
        respond relatorioProdutosInstance
    }

    @Transactional
    def update(RelatorioProdutos relatorioProdutosInstance) {
        if (relatorioProdutosInstance == null) {
            notFound()
            return
        }

        if (relatorioProdutosInstance.hasErrors()) {
            respond relatorioProdutosInstance.errors, view:'edit'
            return
        }

        relatorioProdutosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RelatorioProdutos.label', default: 'RelatorioProdutos'), relatorioProdutosInstance.id])
                redirect relatorioProdutosInstance
            }
            '*'{ respond relatorioProdutosInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RelatorioProdutos relatorioProdutosInstance) {

        if (relatorioProdutosInstance == null) {
            notFound()
            return
        }

        relatorioProdutosInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RelatorioProdutos.label', default: 'RelatorioProdutos'), relatorioProdutosInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'relatorioProdutos.label', default: 'RelatorioProdutos'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
