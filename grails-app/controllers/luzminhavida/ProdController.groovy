package luzminhavida

class ProdController {
	def beforeInterceptor = [action:this.&auth]
	
	static scaffold = Produtos
	
	def auth() {
		if(!session.user) {
			redirect(controller:"Login", action:"login")
			return false
		}
	}
	
	def search =
	{	
		//redirect(action:"listarProdutos")
	 	// redirecionar pra pesquisa
	}
	
	def listarProdutos =
	{
		def nomeProd = params.nomeProduto
		def resultados
		
		println("Produto:" + nomeProd)

                if (nomeProd){
                    if (nomeProd.equals(Produtos.getNomeProd)){
                        println("DEU CERTO CARAIO")
                        //resultados = Produtos.getProduto
                    }
                }
		
		[oProduto:resultados]
	}
	
	
}
