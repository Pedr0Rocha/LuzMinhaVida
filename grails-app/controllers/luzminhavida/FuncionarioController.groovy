package luzminhavida

class FuncionarioController {
	
	def beforeInterceptor = [action:this.&auth]
	
	static scaffold = Funcionario
	
	def auth() {
		if(!session.user) {
			redirect(controller:"Login", action:"login")
			return false
		}
	}
	}
