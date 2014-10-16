package luzminhavida

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(ReservaController)
@Mock(Reserva)
class ReservaControllerSpec extends Specification {
    
    void "busca de cliente - encontrado"() {
        when:
        def produtoTeste = new Cliente(nomeCliente: "Joaquim").save(failOnError: true)
        params.nomeCliente == "Joaquim"
        controller.buscaCliente()
                  
        then:
        response.text == "encontrado"
    }
    
    void "busca de cliente - nao encontrado"() {
        when:
        def produtoTeste = new Cliente(nomeCliente: "Joaquim").save(failOnError: true)
        params.nomeCliente == "Luiz"
        controller.buscaCliente()
                  
        then:
        response.text == "nenhum"
    }
    
    void "reserva - limite pessoas"(){
        when:
            params.numeroPessoas > Constantes.MAXPESSOAS
        then:
            response.text == "false"
        def reservaTeste = new Reserva(params).save()
        controller.verifica(reservaTeste)
    }
    
    void "reserva - limite equipamento"(){
        when:
            params.itemPesca > Constantes.ITEMSPESCA
        then:
            response.text == "false"
        def reservaTeste = new Reserva(params).save()
        controller.verifica(reservaTeste)
    }
}
