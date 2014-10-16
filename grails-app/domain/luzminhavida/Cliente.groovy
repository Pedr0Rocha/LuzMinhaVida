package luzminhavida

class Cliente extends Usuario {
	String nome
	String endereco
	String telefone
	String CEP
        
      
	
    static constraints = {
		nome (blank:false, size:3..30, matches:"[a-zA-Z ']+")
		telefone (blank:false, matches:"[0-9-() ]+")
		endereco (blank:false)
		CEP (blank:false, size:8..8)
    }
}
