package luzminhavida

class CategoriaProdutos {
    
    String name
	
    static constraints = {
        name blank: false, minSize: 3, maxSize: 20, unique: true
    }
}
