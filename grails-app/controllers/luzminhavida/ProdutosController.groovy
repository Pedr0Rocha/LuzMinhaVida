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
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
        
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password)
        
        if(user instanceof Cliente){
            RelatorioProdutos relProd = new RelatorioProdutos()
            relProd.cliente = user         
            relProd.produto = produtosInstance
            relProd.save flush:true
           
        }
        respond produtosInstance
    }
    
    def search(){
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
        
        def listProd = listaPorCategoria
        
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
        
        // filtro por data
        def acessosProd      = RelatorioProdutos.findAll()
        def listaAcessosProd = []
        if(params.datai.after(new Date()) || params.dataf.after(new Date())){
            flash.message = "Datas não podem serem maiores que a data atual!"  
            return //[message: 'owners.not.found']
        }else if(params.datai.after(params.dataf)){
            flash.message = "Data Inicial não pode ser maior que final"  
            return //[message: 'owners.not.found']
        }else{
            for(RelatorioProdutos rel in acessosProd){
                if(rel.data.after(params.datai-1) && rel.data.before(params.dataf+1)){
                    listaAcessosProd.add(rel)
                }            
            }
        }
        
        // checa os acessos do produto filtrado
        def finalList = []
        for(RelatorioProdutos rel in listaAcessosProd){
            for(Produtos prod in listaPorCategoria){
                if(rel.produto.equals(prod)){
                    finalList.add(rel)
                }
            }
        }
        
        println(listaAcessosProd.size()+ " << listaAcessosProd size>")
        println(finalList.size()+ " << final size>")
        // println(params.datai.toString() + "datai <     dataf > " + params.dataf.toString())
        relatorio(finalList, params.datai, params.dataf)
    }
    

    def  relatorio(List finalList, Date data1, Date data2){
        def superList = [:]
                
        for(RelatorioProdutos rel in finalList){
            if(!superList[rel.produto]){
                superList[rel.produto] = 1
                //println(superList[rel.produto]+"<superList>"+rel.produto.nomeProduto)
            }else{
                superList[rel.produto] += 1
                //println(superList[rel.produto]+"<superList>"+rel.produto.nomeProduto)
            }
        }
        
        int visu = 0
        
        for(elem in superList.sort{-it.value}){
            println (elem.key.nomeProduto + " <key><value> "+ elem.value)
            visu += elem.value;
        }
        
        def listaCadaVisu = []
        for(elem in superList.sort{-it.value}){
            listaCadaVisu.add((int)((elem.value/visu) * 100))
        }
       
        def listaClientes = [:]
        for(RelatorioProdutos rel in finalList){
            if(!listaClientes[rel.cliente]){
                listaClientes[rel.cliente] = 1
            } else {
                listaClientes[rel.cliente] += 1 
            }
        }
        render view: 'relatorio', model: [listaTotal : superList.sort{-it.value}, totalVisu: listaCadaVisu,
            datai : data1.format("dd/MM/yyyy"), dataf : data2.format("dd/MM/yyyy"),
            listaCli : listaClientes.sort{-it.value}, visuTotal: visu]
     
    }
}

    
    

