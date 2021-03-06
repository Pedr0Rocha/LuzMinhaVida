package luzminhavida

class LoginController {

    def index() {
        redirect(action:"login")
    }

    def login = {}

    def authenticate = {
        def user = Usuario.findByLoginAndPassword(params.login, params.password)
		
        if(user){
            session.user = user
            flash.message = "Bem vindo ${user.nome}!"
            RelatorioLogin relLogin = new RelatorioLogin()
            relLogin.usuario = user  
            relLogin.save flush:true
            redirect(uri : "/")

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
    
    void verifica(Usuario usuarioInstance){
        if (usuarioInstance == null || usuarioInstance.hasErrors()) {
            render "rejeitado"
            return
        }
        usuarioInstance.save flush:true
        render "aceito"
    }

}
