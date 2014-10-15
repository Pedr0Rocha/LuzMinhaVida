

import luzminhavida.Aval
import luzminhavida.Permiss
import luzminhavida.Cliente
import luzminhavida.CategoriaProdutos
import luzminhavida.Funcionario
import luzminhavida.Usuario
import luzminhavida.Produtos

class BootStrap {
    
    public static final int MAXPESSOAS = 100


    def init = { servletContext ->
        for (String type in ['Cliente','Funcionario','Administrador', 'Gerente']) {
            new Permiss(nome: type).save(failOnError: true)
        }
		
		for (String type in ['1 Estrelas','2 Estrelas','3 Estrelas', '4 Estrelas', '5 Estrelas']) {
			new Aval(estrelas: type).save(failOnError: true)
		}
		
        
        def clienteTeste2 = new Cliente(nome: "Jose", endereco: "Rua Exemplo n01", telefone: "32531733",
			CEP: "12345678", CPF: "123456589012", login:"cli2", password:"toris", permissao: Permiss.findByNome('Cliente')).save(failOnError: true)

		
        
        def funcionarioTeste2 = new Funcionario(nome: "Manuel", cargo: "Atendente", endereco: "Rua Exemplo n02", telefone: "32531733",
            CEP: "01234567", CPF: "123226789101", login: "admin1", password: "123", permissao: Permiss.findByNome('Funcionario')).save(failOnError: true)

        def funcionarioTeste1 = new Funcionario(nome: "Manuel", cargo: "Atendente", endereco: "Rua Exemplo n02", telefone: "32531733",
            CEP: "01234567", CPF: "123456789101", login: "admin", password: "123", permissao: Permiss.findByNome('Administrador')).save(failOnError: true)

                    
        def clienteTeste = new Cliente(nome: "Jose", endereco: "Rua Exemplo n01", telefone: "32531733",
            CEP: "12345678", CPF: "123456789012", login:"cli", password:"toris", permissao: Permiss.findByNome('Cliente')).save(failOnError: true)

		
        for (String type in ['Porções','Refeições','Bebidas Alcólicas', 'Bebidas', 'Pescaria']) {
            new CategoriaProdutos(name: type).save(failOnError: true)
        }

        def produtoTeste = new Produtos(nomeProduto: "Porcao de batata",
            descricao: "Porcao de batata frita com queijo e bacon", valor: "15,50", categoria: CategoriaProdutos.findByName('Porções')).save(failOnError: true)

         def produtoTeste2 = new Produtos(nomeProduto: "Saco de batata",
            descricao: "Porcao de batata frita com queijo e bacon", valor: "15", categoria: CategoriaProdutos.findByName('Refeições')).save(failOnError: true)

         def produtoTeste3 = new Produtos(nomeProduto: "VALOR IGUA",
            descricao: "Porcao de batata frita com queijo e bacon", valor: "15,50", categoria: CategoriaProdutos.findByName('Bebidas')).save(failOnError: true)

         def produtoTeste4 = new Produtos(nomeProduto: "Cat igual",
            descricao: "Porcao de batata frita com queijo e bacon", valor: "14", categoria: CategoriaProdutos.findByName('Porções')).save(failOnError: true)

        
    }
    def destroy = {
    }
}
