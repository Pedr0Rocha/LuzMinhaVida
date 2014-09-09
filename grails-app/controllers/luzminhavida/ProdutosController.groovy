package luzminhavida

class ProdutosController {
	def beforeInterceptor = [action:this.&auth]
	
	static scaffold = Produtos
	
	def auth() {
		if(!session.user) {
			redirect(controller:"Login", action:"login")
			return false
		}
	}
}
