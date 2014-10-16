package luzminhavida

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(FuncionarioController)
@Mock(Funcionario)

class FuncionarioControllerSpec extends Specification {

    void "cadastro de funcionario - sucesso"() {
        when:
            params.nome = "Carlos"
            params.endereco = "Rua Exemplo n01"
            params.telefone = "32531733"
            params.CEP = "12345678"
            params.login = "carlito"
            params.password = "abc123"
            def funcionario = new Funcionario(params)
            controller.cadastrar(funcionario)
                  
        then:
            response.text == "salvo"
    }
    
    void "cadastro de funcionario - null"() {
        when:
            controller.cadastrar(null)
                  
        then:
            response.text == "erro"
    }
    
    void "cadastro de funcionario - campo vazio"() {
        when:
            params.nome = ""
            params.endereco = "Rua Exemplo n01"
            params.telefone = "32531733"
            params.CEP = "12345678"
            params.login = "carlito"
            params.password = "abc123"
            def funcionario = new Funcionario(params).save()
            controller.cadastrar(funcionario)
                  
        then:
            response.text == "erro"
    }
}
