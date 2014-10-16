

import luzminhavida.Aval
import luzminhavida.Permiss
import luzminhavida.Cliente
import luzminhavida.Comentarios
import luzminhavida.CategoriaProdutos
import luzminhavida.Funcionario
import luzminhavida.Usuario
import luzminhavida.Produtos
import luzminhavida.RelatorioLogin
import luzminhavida.RelatorioProdutos

class BootStrap {
    
    public static final int MAXPESSOAS = 100


    def init = { servletContext ->
        for (String type in ['Cliente','Funcionario','Administrador', 'Gerente']) {
            new Permiss(nome: type).save(failOnError: true)
        }
		
        for (String type in ['1 Estrela','2 Estrelas','3 Estrelas', '4 Estrelas', '5 Estrelas']) {
            new Aval(estrelas: type).save(failOnError: true)
        }
		
        
        Cliente clienteTeste = new Cliente(nome: "Jose", endereco: "Rua Exemplo n01", telefone: "32531733",
            CEP: "12345678", CPF: "123456789012", login:"jose", password:"123", permissao: Permiss.findByNome('Cliente')).save(failOnError: true)

        def clienteTeste2 = new Cliente(nome: "Augusto", endereco: "Rua Exemplo n02", telefone: "32531734",
            CEP: "12345679", CPF: "123456589000", login:"augusto", password:"123", permissao: Permiss.findByNome('Cliente')).save(failOnError: true)
        
        def clienteTeste3 = new Cliente(nome: "Andre", endereco: "Rua Exemplo n03", telefone: "32531343",
            CEP: "12345611", CPF: "123456589111", login:"andre", password:"123", permissao: Permiss.findByNome('Cliente')).save(failOnError: true)
        
        def clienteTeste4 = new Cliente(nome: "ClienteTeste", endereco: "Rua Exemplo n02", telefone: "32531734",
            CEP: "12345655", CPF: "12345612345", login:"cli", password:"123", permissao: Permiss.findByNome('Cliente')).save(failOnError: true)

        def funcionarioTeste2 = new Funcionario(nome: "Func", cargo: "Atendente", endereco: "Rua Exemplo n01", telefone: "11531733",
            CEP: "01234567", CPF: "123226789101", login: "admin", password: "123", permissao: Permiss.findByNome('Funcionario')).save(failOnError: true)

        def funcionarioTeste1 = new Funcionario(nome: "Admin", cargo: "Atendente", endereco: "Rua Exemplo n02", telefone: "22531733",
            CEP: "01234567", CPF: "123456789101", login: "admin2", password: "123", permissao: Permiss.findByNome('Administrador')).save(failOnError: true)

                    

		
        for (String type in ['Porções','Refeições','Bebidas Alcólicas', 'Bebidas', 'Pescaria']) {
            new CategoriaProdutos(name: type).save(failOnError: true)
        }
        
        // PRODUTOS
        def produtoTeste = new Produtos(nomeProduto: "Porcao de batata",
            descricao: "Batata frita com queijo e bacon", valor: "15,50", categoria: CategoriaProdutos.findByName('Porções')).save(failOnError: true)

        def produtoTeste2 = new Produtos(nomeProduto: "Torresmo",
            descricao: "Torresmo frito", valor: "16,00", categoria: CategoriaProdutos.findByName('Porções')).save(failOnError: true)

        def produtoTeste3 = new Produtos(nomeProduto: "Tilapia",
            descricao: "Filé de tilapria", valor: "18,50", categoria: CategoriaProdutos.findByName('Porções')).save(failOnError: true)

        def produtoTeste4 = new Produtos(nomeProduto: "Polenta",
            descricao: "Polenta frita", valor: "12,00", categoria: CategoriaProdutos.findByName('Porções')).save(failOnError: true)

        def produtoTeste5 = new Produtos(nomeProduto: "Prato Feito",
            descricao: "Arroz, Feijão, Salada, Carne", valor: "10,00", categoria: CategoriaProdutos.findByName('Refeições')).save(failOnError: true)

        def produtoTeste6 = new Produtos(nomeProduto: "Picanha na pedra",
            descricao: "Picanha na pedra, acompanha arroz, feijão e salada", valor: "30,50", categoria: CategoriaProdutos.findByName('Refeições')).save(failOnError: true)

        def produtoTeste7 = new Produtos(nomeProduto: "Cerveja",
            descricao: "Brahman, Skol, Antartica", valor: "6,00", categoria: CategoriaProdutos.findByName('Bebidas Alcólicas')).save(failOnError: true)

        def produtoTeste8 = new Produtos(nomeProduto: "Cerveja Original",
            descricao: "Cerveja Original", valor: "7,50", categoria: CategoriaProdutos.findByName('Bebidas Alcólicas')).save(failOnError: true)
        
        def produtoTeste9 = new Produtos(nomeProduto: "Suco",
            descricao: "Caju, Maracuja, Laranja", valor: "4,00", categoria: CategoriaProdutos.findByName('Bebidas')).save(failOnError: true)
        
        def produtoTeste10 = new Produtos(nomeProduto: "Agua Mineral",
            descricao: "Agua mineral sem gás", valor: "2,00", categoria: CategoriaProdutos.findByName('Bebidas')).save(failOnError: true)

        def produtoTeste11 = new Produtos(nomeProduto: "Vara de Bambu",
            descricao: "Vara de pescar feita de bambu", valor: "10,00", categoria: CategoriaProdutos.findByName('Pescaria')).save(failOnError: true)

        def produtoTeste12 = new Produtos(nomeProduto: "Vara de Molinete",
            descricao: "Vara de pescar molinete", valor: "15,00", categoria: CategoriaProdutos.findByName('Pescaria')).save(failOnError: true)

        def produtoTeste13 = new Produtos(nomeProduto: "Isca para pesca",
            descricao: "Isca para pesca", valor: "1,00", categoria: CategoriaProdutos.findByName('Pescaria')).save(failOnError: true)

        
        // relatorios
        
        //def relatorioProdTeste = new RelatorioProdutos(cliente: clienteTeste, produtos: produtoTeste12, produtoTeste13, data: new Date()-3).save(failOnError: true)
        
        //def relatorioProdTeste2 = new RelatorioProdutos(cliente: Cliente.findByNome("Augusto"), produtos: produtoTeste3, produtoTeste7, data: new Date()-5).save(failOnError: true)
        
        //def relatorioLoginTeste = new RelatorioLogin(usuario: Cliente.findByNome("ClienteTeste"), date: new Date()-3).save(failOnError: true)
        
        //def relatorioLoginTeste2 = new RelatorioLogin(usuario: Cliente.findByNome("Andre"), date: new Date()-5).save(failOnError: true)

        //def relatorioLoginTeste3 = new RelatorioLogin(usuario: Funcionario.findByNome("Func"), date: new Date()-7).save(failOnError: true)

        
        // comenatarios
        
        //def comentarioTeste = new Comentarios(cliente: Cliente.findByNome("Andre"), comentarios: "Muito bom restaurante", estrelas: Aval.findByName("5 Estrelas"), data: new Date()-3).save(failOnError: true)
    
        //def comentarioTeste2 = new Comentarios(cliente: Cliente.findByNome("Jose"), comentarios: "Adorei a pescaria", estrelas: Aval.findByName("4 Estrelas"), data: new Date()-5).save(failOnError: true)
    
        //def comentarioTeste3 = new Comentarios(cliente: Cliente.findByNome("Augusto"), comentarios: "Comida estava fria", estrelas: Aval.findByName("2 Estrelas"), data: new Date()-7).save(failOnError: true)

    
    
    }
    def destroy = {
    }
}
