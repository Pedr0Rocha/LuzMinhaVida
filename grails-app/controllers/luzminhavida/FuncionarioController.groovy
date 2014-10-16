package luzminhavida

class FuncionarioController {
	
    def beforeInterceptor = [action:this.&auth]
	
    static scaffold = Funcionario
	
    def auth() {
        if(!session.user) {
			redirect(controller:"Login", action:"login")
			return false
		}
	
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password);
        
        if(!user) {
            redirect(controller:"Login", action:"login")
            return false
        }else if(user.permissao.nome.equals("Cliente") || user.permissao.nome.equals("Funcionario")){
            flash.message = "Voce não tem permissão para acessar esta área"
            redirect(uri: "/" )
            return false
        }
    }
    
    void cadastrar(Funcionario funcionarioInstance){
        if (funcionarioInstance == null || funcionarioInstance.hasErrors()) {
            render "erro"
            return
        }
        funcionarioInstance.save flush:true
        render "salvo"
    }
}
