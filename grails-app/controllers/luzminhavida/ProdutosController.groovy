package luzminhavida

class ProdutosController {
    def beforeInterceptor = [action:this.&auth]
    
    static scaffold = Produtos
   
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password)
        
        if(!user) {
            redirect(controller:"Login", action:"login")
            return false
        }/*else if(user.permissao.nome.equals("Cliente")){
        flash.message = "Voce não tem permissão para acessar esta área"
        redirect(uri: "/" )
        return false
        }*/
    }
    
    def show(Produtos produtosInstance){
        RelatorioProdutos relProd = new RelatorioProdutos()
        relProd.cliente = Usuario.findByLoginAndPassword(session.user.login, session.user.password)
        if (relProd.cliente instanceof Cliente){
            relProd.produto = produtosInstance
            relProd.save flush:true
        }
        respond produtosInstance
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
        println("Matriz " + listaz.size())
        println(categorias.size())
        render view: 'cardapio', model: [aMatrizCategoria : listaz]
    }
   
    
    def search () {
        if (!request.post) {
            return
        }
        //def produtos = Produtos.findAllByNomeProduto(params.nomeProduto)
        def prod2 = Produtos.findAll()
        def listProd = []
       
        for (Produtos pp in prod2){
            if(pp?.nomeProduto?.contains(params.nomeProduto)){
                listProd.add(pp)
            }
        }
        
        if (!listProd) {
            flash.message = "Produto Não Encontrado!"  
            return //[message: 'owners.not.found']
        }
        
        if (listProd.size() > 1) {
            //[oProduto : produtos]
            render view: 'listarProdutos', model: [oProduto : listProd]
        } else {
            redirect action: 'show', id: listProd[0].id
        }         
    }
    
    def relatorio(){
        def relatorio = RelatorioProdutos.findAll()
        println(relatorio.size())
        
    }
    
    def filtro(){
         if (!request.post) {
            return
        }        
        
        def todosProdutos = Produtos.findAll()
        def listaPorNome = []
        
        
        //filtro por nomes
        for (Produtos prod in todosProdutos){
            if(prod?.nomeProduto?.contains(params?.nomeProduto)){
                listaPorNome.add(prod)
              //  println("ADD LISTA POR NOME")
                
            }
        }
        println(listaPorNome.size() + " << lista por nome size")
        
        // filtro por valor
        
        def listaPorValor = []
        
        if (!params.valor.equals("")){
            for (Produtos prod in listaPorNome){
                if(prod?.valor?.equals(params.valor)){
                    listaPorValor.add(prod)
                   // println("ADD LISTA POR VALOR")
                }
            }
        } else {
            listaPorValor = listaPorNome
        }
        
        println(listaPorValor.size() + " << lista por valor size")
        
        // filtro por categoria

        def listaPorCategoria = []
        if (params?.categoria?.id != '-1'){            
            for (Produtos prod in listaPorValor){
                if(prod?.categoria?.id.toString().equals(params?.categoria?.id.toString())){
                    listaPorCategoria.add(prod)
                    //println("ADD LISTA POR CATEGORIA") 
                }
            }
        } else {
            listaPorCategoria = listaPorValor
        }
           
        println(listaPorCategoria.size() + " << lista por categoria size")
        Date
        // filtro por data
        println((params.datai - params.dataf) +" ! AJHISBGDUAHGUOIHASIYFRIUYASOHJFIPSGHÒFDJA")
        if (params.datai.after(params.dataf)){
            println("deu certo")
        } else {
            println("deu ruim")
        }
        println(params.datai.toString() + "datai <     dataf > " + params.dataf.toString())
        
    }
    
}
