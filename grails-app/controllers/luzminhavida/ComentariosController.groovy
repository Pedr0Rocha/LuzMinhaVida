package luzminhavida



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ComentariosController {
    
    def beforeInterceptor = [action:this.&auth]

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password);
        
        if(!user) {
            redirect(controller:"Login", action:"login")
            return false
        }else if(!user.permissao.nome.equals("Cliente")){
            flash.message = "Voce não tem permissão para acessar esta área"
            redirect(uri: "/" )
            return false
        }
    }
    
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Comentarios.list(params), model:[comentariosInstanceCount: Comentarios.count()]
    }

    def show(Comentarios comentariosInstance) {
        respond comentariosInstance
    }

    def create() {
        respond new Comentarios(params)
    }

    @Transactional
    def save(Comentarios comentariosInstance) {
        if (comentariosInstance == null) {
            notFound()
            return
        }

        if (comentariosInstance.hasErrors()) {
            respond comentariosInstance.errors, view:'create'
            return
        }
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password);
        
        
        comentariosInstance.cliente = user
        comentariosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'comentarios.label', default: 'Comentarios'), comentariosInstance.id])
                redirect comentariosInstance
            }
            '*' { respond comentariosInstance, [status: CREATED] }
        }
    }

    def edit(Comentarios comentariosInstance) {
        respond comentariosInstance
    }

    @Transactional
    def update(Comentarios comentariosInstance) {
        if (comentariosInstance == null) {
            notFound()
            return
        }

        if (comentariosInstance.hasErrors()) {
            respond comentariosInstance.errors, view:'edit'
            return
        }

        comentariosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Comentarios.label', default: 'Comentarios'), comentariosInstance.id])
                redirect comentariosInstance
            }
            '*'{ respond comentariosInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Comentarios comentariosInstance) {

        if (comentariosInstance == null) {
            notFound()
            return
        }

        comentariosInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Comentarios.label', default: 'Comentarios'), comentariosInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comentarios.label', default: 'Comentarios'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
