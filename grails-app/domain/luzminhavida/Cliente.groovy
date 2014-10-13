package luzminhavida

class Cliente {
    String nome
    String endereco
    String telefone
    String CEP
    String CPF
	
    static constraints = {
        nome (blank:false, size:3..30, matches:"[a-zA-Z ']+")
        CPF (blank:false, size:11..11, unique: true, matches:"[0-9]+")
        telefone (blank:false, matches:"[0-9-() ]+")
        endereco (blank:false)
        CEP (blank:false, size:8..8, matches:"[0-9]+")
    }
}
