package luzminhavida

class LoginController {

    def index() {
		redirect(action:"login")
	}
	
	def login = {}
	
	def authenticate = {
		def user = Funcionario.findByLoginAndPassword(params.login, params.password)
		if(user){
			session.user = user
			flash.message = "Bem vindo ${user.nome}!"
			redirect(uri : "/index")
			
		}else{
		flash.message = "Desculpe, tente novamente."
		redirect(action:"login")
		}
	}
	
	def logout = {
		if(session.user){
			flash.message = "${session.user.nome} desconectado."
			session.user = null
			
		}
		redirect(action:"login")
	}
}
