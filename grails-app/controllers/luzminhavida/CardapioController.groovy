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
      
    def cardap() {
        
        def categorias = CategoriaProdutos.findAll()
        def listaz = []
        
        for (CategoriaProdutos cat in categorias) {
            def superProd = Produtos.findAllByCategoriaAndMostrarNoCardapio(cat, true)
            if(superProd.size() > 0){
                listaz.add(superProd)
            }
        }
        render view: 'cardapio', model: [aMatrizCategoria : listaz]
    }
    
    

}
