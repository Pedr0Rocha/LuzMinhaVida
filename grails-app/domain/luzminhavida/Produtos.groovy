package luzminhavida

class Produtos {
	String nomeProduto
	String descricao
	String valor
	CategoriaProdutos categoria
	Boolean mostrarNoCardapio = true
	
	static constraints = {
		nomeProduto(blank: false, unique: true)
		descricao (blank: false, maxSize: 300)
		valor (blank: false, matches:"[0-9,]+")
                categoria (blank: true)
	}
                
}
