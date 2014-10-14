package luzminhavida

class CardapioController {
   
    
    def search () {
        if (!request.post) {
            return
        }
        
        def produtos   = Produtos.findAllByNomeProduto(params.nomeProduto)
        
        if (!produtos) {
            flash.message = "Produto Não Encontrado!"  
            return //[message: 'owners.not.found']
        }
        
        if (produtos.size() > 1) {
            render view: 'listarProdutos', model: [oProduto : produtos]
        } else {
            redirect action: 'show', id: produtos[0].id
        }         
    }
    
    def renderTabela(String tabela){
        def produtos = Produtos.findAllByNomeProduto(params.nomeProduto)
        def prodCategoria = Produtos.findAllByCategoria(params.nomeProduto)


        render view: tabela, model: [oProduto: produtos]
    }
}
