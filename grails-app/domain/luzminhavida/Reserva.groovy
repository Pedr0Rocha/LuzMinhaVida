package luzminhavida

class Reserva {
    
    Boolean ativa = true
    Boolean itemPesca = false
    Date date = new Date()
    Integer numeroPessoas
    Cliente cliente
    
    static constraints = {
        date min: new Date()-1
        cliente nullable:true
        numeroPessoas min:1
    }
}
