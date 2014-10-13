package luzminhavida

class ProdutosController {
    def beforeInterceptor = [action:this.&auth]
    
    static scaffold = Produtos
   
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password);
        
        if(!user) {
            redirect(controller:"Login", action:"login")
            return false
        }else if(user.permissao.nome.equals("Cliente")){
            flash.message = "Voce não tem permissão para acessar esta área"
            redirect(uri: "/" )
            return false
        }
    }
    
   
    
    def search () {
        if (!request.post) {
            return
        }
        
        def produtos = Produtos.findAllByNomeProduto(params.nomeProduto)
        
        if (!produtos) {
            flash.message = "Produto Não Encontrado!"  
            return //[message: 'owners.not.found']
        }
        
        if (produtos.size() > 1) {
            //[oProduto : produtos]
            render view: 'listarProdutos', model: [oProduto : produtos]
        } else {
            redirect action: 'show', id: produtos[0].id
        }         
    }
    
}
