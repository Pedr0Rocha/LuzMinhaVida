package luzminhavida



import static org.springframework.http.HttpStatus.*

import org.apache.catalina.startup.Bootstrap;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReservaController {
    
    def beforeInterceptor = [action:this.&auth]

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password)
        
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
        respond Reserva.list(params), model:[reservaInstanceCount: Reserva.count()]
    }

    def listarHistorico(){
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password)
        //def produtos = Produtos.findAllByNomeProduto(params.nomeProduto)
        def reservas = Reserva.findAllByCliente(user)
        
        if (!reservas) {
            flash.message = "Você não possui reservas!"  
            redirect(action: "create")
            //[message: 'owners.not.found']
        }else {
        
            if (reservas.size() > 1) {
                [oReserva : reservas]
                // render view: 'listarHistorico', model: [oReserva : reservas]
            } else {
                redirect action: 'show', id: reservas[0].id
            }      
        }
    }
    
    def show(Reserva reservaInstance) {        
        respond reservaInstance
    }

    def create() {
        respond new Reserva(params)
    }

    @Transactional
    def save(Reserva reservaInstance) {
        if (reservaInstance == null) {
            notFound()
            return
        }

        if (reservaInstance.hasErrors()) {
            respond reservaInstance.errors, view:'create'
            return
        }
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password);
       
        def reservas      = Reserva.findAllByDate(reservaInstance.date)
        int numPessoas    = reservaInstance.numeroPessoas
        int numItensPesca = reservaInstance.itemPesca 
        for (Reserva res in reservas){
            if (res.ativa){
                numPessoas    += res.numeroPessoas
                numItensPesca += res.itemPesca
            }
            if(res.cliente.id == user.id){
                flash.message = "Você já possui reserva para esta Data"
                respond reservaInstance.errors, view:'create'
                return
            }
        }
        
        if (numPessoas > Constantes.MAXPESSOAS){
            flash.message = "Limite de reservas esgotados para esta data"
            respond reservaInstance.errors, view:'create'
            return
        }else if (numItensPesca > Constantes.ITEMSPESCA){
            flash.message = "Limite de Itens de Pesca esgotados para esta data"
            respond reservaInstance.errors, view:'create'
            return
        }
        
        reservaInstance.cliente = user
        reservaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reserva.label', default: 'Reserva'), reservaInstance.id])
                redirect reservaInstance
            }
            '*' { respond reservaInstance, [status: CREATED] }
        }
    }
    
    

    def edit(Reserva reservaInstance) {
        respond reservaInstance
    }

    @Transactional
    def update(Reserva reservaInstance) {
        if (reservaInstance == null) {
            notFound()
            return
        }

        if (reservaInstance.hasErrors()) {
            respond reservaInstance.errors, view:'edit'
            return
        }
        def reservas      = Reserva.findAllByDate(reservaInstance.date)
        int numPessoas    = reservaInstance.numeroPessoas
        int numItensPesca = reservaInstance.itemPesca
        for (Reserva res in reservas){
            if (res.ativa && res.id != reservaInstance.id){
                numPessoas    += res.numeroPessoas
                numItensPesca += res.itemPesca
            }
        }
        
        if (numPessoas > Constantes.MAXPESSOAS){
            flash.message = "Limite de reservas esgotados para esta data"
            respond reservaInstance.errors, view:'edit'
            return
        }else if(numItensPesca > Constantes.ITEMSPESCA) {
            flash.message = "Limite de Itens de Pesca esgotados para esta data"
            respond reservaInstance.errors, view:'edit'
            return
        }
        reservaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Reserva.label', default: 'Reserva'), reservaInstance.id])
                redirect reservaInstance
            }
            '*'{ respond reservaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Reserva reservaInstance) {

        if (reservaInstance == null) {
            notFound()
            return
        }

        reservaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Reserva.label', default: 'Reserva'), reservaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reserva.label', default: 'Reserva'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
