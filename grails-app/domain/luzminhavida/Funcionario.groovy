package luzminhavida

class Funcionario {
    String nome
    String cargo
    String endereco
    String telefone
    String CEP
    String CPF
    String login
    String password
	
    static constraints = {
        nome (blank:false, size:3..30, matches:"[a-zA-Z ']+")
        cargo(blank:false)
        CPF (blank:false, size:11..11, unique:true, matches:"[0-9]+")
        telefone (blank:false, matches:"[0-9-() ]+")
        endereco (blank:false)
        CEP (blank:false, size:8..8)
        login(blank:false, unique:true)
        password(blank:false, password:true)
    }
}
