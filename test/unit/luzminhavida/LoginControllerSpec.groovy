package luzminhavida

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(LoginController)
@Mock(Usuario)
class LoginControllerSpec extends Specification {
    
    void "login - sucesso"(){
        when:
            params.login = "user01"
            params.password = "123"
            def usuario = new Usuario(params)
            controller.verifica(usuario)
        
        then:
            response.text == "aceito"
    }
    
    void "login - null"(){
        when:
            controller.verifica(null)
        
        then:
            response.text == "rejeitado"
    }
    
    void "login - campo vazio"(){
        when:
            params.login = ""
            params.password = "123"
            def usuario = new Usuario(params).save()
            controller.verifica(usuario)
        
        then:
            response.text == "rejeitado"
    }
}
