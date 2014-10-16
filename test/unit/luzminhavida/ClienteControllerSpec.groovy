package luzminhavida

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ClienteController)
@Mock(Cliente)
class ClienteControllerSpec extends Specification {

    void "cadastro de cliente - sucesso"() {
        when:
            params.nome = "Jose"
            params.endereco = "Rua Exemplo n01"
            params.telefone = "32531733"
            params.CEP = "12345678"
            params.login = "joselito"
            params.password = "abc123"
            def cliente = new Cliente(params)
            controller.cadastrar(cliente)
                  
        then:
            response.text == "salvo"
    }
    
    void "cadastro de cliente - null"() {
        when:
            controller.cadastrar(null)
                  
        then:
            response.text == "erro"
    }
    
    void "cadastro de cliente - campo vazio"() {
        when:
            params.nome = ""
            params.endereco = "Rua Exemplo n01"
            params.telefone = "32531733"
            params.CEP = "12345678"
            params.login = "joselito"
            params.password = "abc123"
            def cliente = new Cliente(params).save()
            controller.cadastrar(cliente)
                  
        then:
            response.text == "erro"
    }
}
