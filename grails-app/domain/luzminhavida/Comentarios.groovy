package luzminhavida

class Comentarios {
	
    Cliente cliente
    String comentarios
    Aval estrelas
    Date data = new Date()

    static constraints = {
        cliente nullable: true
    	comentarios blank:false, maxSize:300
    }
}
