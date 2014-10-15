
<%@ page import="luzminhavida.RelatorioProdutos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relatorioProdutos.label', default: 'RelatorioProdutos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-relatorioProdutos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-relatorioProdutos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list relatorioProdutos">
			
				<g:if test="${relatorioProdutosInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="relatorioProdutos.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${relatorioProdutosInstance?.cliente?.id}">${relatorioProdutosInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${relatorioProdutosInstance?.data}">
				<li class="fieldcontain">
					<span id="data-label" class="property-label"><g:message code="relatorioProdutos.data.label" default="Data" /></span>
					
						<span class="property-value" aria-labelledby="data-label"><g:formatDate date="${relatorioProdutosInstance?.data}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${relatorioProdutosInstance?.produto}">
				<li class="fieldcontain">
					<span id="produto-label" class="property-label"><g:message code="relatorioProdutos.produto.label" default="Produto" /></span>
					
						<span class="property-value" aria-labelledby="produto-label"><g:link controller="produtos" action="show" id="${relatorioProdutosInstance?.produto?.id}">${relatorioProdutosInstance?.produto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:relatorioProdutosInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${relatorioProdutosInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
