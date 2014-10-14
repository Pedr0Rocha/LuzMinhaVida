package luzminhavida

class Comentarios {
	
    Cliente cliente
    String comentarios
    Aval estrelas
    Date data = new Date()

    static constraints = {
    	comentarios blank:false, maxSize:300
    }
}
