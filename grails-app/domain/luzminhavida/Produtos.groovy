package luzminhavida

class Produtos {
	String nomeProduto
	String descricao
	String valor
	String categoria
	//Boolean mostrarNoCardapio
	
	static constraints = {
		nomeProduto(blank: false)
		descricao (blank: false, maxSize: 300)
		categoria (blank: false)
		valor (blank: false, matches:"[0-9,]+")
	}
}
