
<%@ page import="luzminhavida.Cliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cliente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cliente">
			
				<g:if test="${clienteInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="cliente.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${clienteInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.CPF}">
				<li class="fieldcontain">
					<span id="CPF-label" class="property-label"><g:message code="cliente.CPF.label" default="CPF" /></span>
					
						<span class="property-value" aria-labelledby="CPF-label"><g:fieldValue bean="${clienteInstance}" field="CPF"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.telefone}">
				<li class="fieldcontain">
					<span id="telefone-label" class="property-label"><g:message code="cliente.telefone.label" default="Telefone" /></span>
					
						<span class="property-value" aria-labelledby="telefone-label"><g:fieldValue bean="${clienteInstance}" field="telefone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="cliente.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${clienteInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteInstance?.CEP}">
				<li class="fieldcontain">
					<span id="CEP-label" class="property-label"><g:message code="cliente.CEP.label" default="CEP" /></span>
					
						<span class="property-value" aria-labelledby="CEP-label"><g:fieldValue bean="${clienteInstance}" field="CEP"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:clienteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${clienteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
