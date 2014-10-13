<%@ page import="luzminhavida.Produtos" %>



<div class="fieldcontain ${hasErrors(bean: produtosInstance, field: 'nomeProduto', 'error')} required">
	<label for="nomeProduto">
		<g:message code="produtos.nomeProduto.label" default="Nome Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nomeProduto" required="" value="${produtosInstance?.nomeProduto}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtosInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="produtos.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="descricao" cols="40" rows="5" maxlength="300" required="" value="${produtosInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtosInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="produtos.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="categoria" required="" value="${produtosInstance?.categoria}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtosInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="produtos.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="valor" pattern="${produtosInstance.constraints.valor.matches}" required="" value="${produtosInstance?.valor}"/>

</div>

