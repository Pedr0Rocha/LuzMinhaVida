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
}
