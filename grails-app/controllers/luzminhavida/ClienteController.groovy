package luzminhavida

class ClienteController {
    def beforeInterceptor = [action:this.&auth]
	
    static scaffold = Cliente
	
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
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
}
