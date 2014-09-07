package luzminhavida

class Cliente {
	String nome
	String endereco
	String telefone
	String CEP
	String CPF
	
    static constraints = {
		nome (blank:false, size:3..30, matches:"[a-zA-Z ']+")
		CPF (blank:false, size:12..12, unique: true)
		telefone (blank:false, matches:"[0-9-() ]+")
		endereco (blank:false)
		CEP (blank:false, size:8..8)
    }
}
