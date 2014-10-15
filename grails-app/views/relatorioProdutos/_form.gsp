<%@ page import="luzminhavida.RelatorioProdutos" %>



<div class="fieldcontain ${hasErrors(bean: relatorioProdutosInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="relatorioProdutos.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${luzminhavida.Cliente.list()}" optionKey="id" required="" value="${relatorioProdutosInstance?.cliente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: relatorioProdutosInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="relatorioProdutos.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data" precision="day"  value="${relatorioProdutosInstance?.data}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: relatorioProdutosInstance, field: 'produto', 'error')} required">
	<label for="produto">
		<g:message code="relatorioProdutos.produto.label" default="Produto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produto" name="produto.id" from="${luzminhavida.Produtos.list()}" optionKey="id" required="" value="${relatorioProdutosInstance?.produto?.id}" class="many-to-one"/>

</div>

