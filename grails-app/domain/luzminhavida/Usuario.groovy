package luzminhavida

class Usuario {

	String login
	String password
	Permiss permissao
        
    static constraints = {
		login(blank:false, minSize:3, unique:true)
		password(blank:false, minSize:3, password:true)
		permissao(blank:true)
    }
}
