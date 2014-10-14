package luzminhavida

class Reserva {
    
    Boolean ativa = true
    Integer itemPesca
    Date date = new Date()
    Integer numeroPessoas
    Cliente cliente
    
    static constraints = {
        date min: new Date()-1
        cliente nullable:true
        numeroPessoas min:1
        itemPesca min:0
    }
}
