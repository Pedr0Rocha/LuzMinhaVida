package luzminhavida



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = true)
class ClienteController {
    def beforeInterceptor = [action:this.&auth]

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password);
        if (user instanceof Cliente){
            redirect(action:"show", id: user.id)
        }
        params.max = Math.min(max ?: 10, 100)
        respond Cliente.list(params), model:[clienteInstanceCount: Cliente.count()]
    }

    def show(Cliente clienteInstance) {
        respond clienteInstance
    }
    
    def auth() {
        if(!session.user) {
            redirect(action:"create")
            return false
        }
    }

    def create() {
        respond new Cliente(params)
    }

    @Transactional
    def save(Cliente clienteInstance) {
        if (clienteInstance == null) {
            notFound()
            return
        }

        if (clienteInstance.hasErrors()) {
            respond clienteInstance.errors, view:'create'
            return
        }
        clienteInstance.permissao = Permiss.findByNome("Cliente")

        clienteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
                redirect clienteInstance
            }
            '*' { respond clienteInstance, [status: CREATED] }
        }
    }

    def edit(Cliente clienteInstance) {
        respond clienteInstance
    }
    
    def search () {
        if (!request.post) {
            return
        }
        
        def clientes = Cliente.findAll()
        def listCliente = []
       
        for (Cliente c in clientes){
            if(c?.nome?.contains(params.nome)){
                listCliente.add(c)
            }
        }
        
        if (!listCliente) {
            flash.message = "Cliente não encontrado!"  
            return //[message: 'owners.not.found']
        }
        
        if (listCliente.size() > 1) {
            //[oProduto : produtos]
            render view: 'listarClientes', model: [oCliente : listCliente]
        } else {
            redirect action: 'show', id: listCliente[0].id
        }         
    }

    @Transactional
    def update(Cliente clienteInstance) {
        if (clienteInstance == null) {
            notFound()
            return
        }

        if (clienteInstance.hasErrors()) {
            respond clienteInstance.errors, view:'edit'
            return
        }

        clienteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cliente.label', default: 'Cliente'), clienteInstance.id])
                redirect clienteInstance
            }
            '*'{ respond clienteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cliente clienteInstance) {

        if (clienteInstance == null) {
            notFound()
            return
        }

        clienteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cliente.label', default: 'Cliente'), clienteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
