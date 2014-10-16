package luzminhavida

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ProdutosController)
@Mock(Produtos)
class ProdutosControllerSpec extends Specification {

    void "busca de produto - encontrado"() {
        when:
        def produtoTeste = new Produtos(nomeProduto: "Porcao de batata",
            descricao: "Porcao de batata frita com queijo e bacon", valor: "15,50", 
            categoria: new CategoriaProdutos(name: "Porções")).save(failOnError: true)
            
        params.nomeProduto = "batata"
        controller.busca()
                  
        then:
        response.text == "encontrado 1"
    }
    
    void "busca de produto - não encontrado"() {
        when:
        def produtoTeste = new Produtos(nomeProduto: "Porcao de batata",
            descricao: "Porcao de batata frita com queijo e bacon", valor: "15,50", 
            categoria: new CategoriaProdutos(name: "Porções")).save(failOnError: true)
            
        params.nomeProduto = "queijo"
        controller.busca()
                  
        then:
        response.text == "nenhum"
    }
    
    void "busca de produto - encontrado muitos"() {
        when:
        def produtoTeste = new Produtos(nomeProduto: "Porcao de batata",
            descricao: "Porcao de batata frita com queijo e bacon", valor: "15,50", 
            categoria: new CategoriaProdutos(name: "Porções")).save(failOnError: true)
        
        def produtoTeste2 = new Produtos(nomeProduto: "Porcao de batata doce",
            descricao: "Porcao de batata frita com queijo e bacon", valor: "15,50", 
            categoria: new CategoriaProdutos(name: "Porções")).save(failOnError: true)
            
        params.nomeProduto = "batata"
        controller.busca()
                  
        then:
        response.text == "encontrado muitos"
    }
}
