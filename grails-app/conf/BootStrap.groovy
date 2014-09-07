import luzminhavida.Cliente
import luzminhavida.Funcionario
import luzminhavida.Produtos

class BootStrap {

    def init = { servletContext ->
		def clienteTeste = new Cliente(nome: "Jose", endereco: "Rua Exemplo n01", telefone: "32531733", 
			CEP: "12345678", CPF: "123456789012").save(failOnError: true)
			
		def funcionarioTeste = new Funcionario(nome: "Manuel", cargo: "Atendente", endereco: "Rua Exemplo n02", telefone: "32531733", 
			CEP: "01234567", CPF: "123456789101").save(failOnError: true)
			
		def produtoTeste = new Produtos(nomeProduto: "Porcao de batata", 
			descricao: "Porcao de batata frita com queijo e bacon", valor: "15,50", categoria: "Porcoes").save(failOnError: true)
			
	}
    def destroy = {
    }
}
