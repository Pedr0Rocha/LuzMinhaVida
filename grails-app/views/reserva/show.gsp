
<%@ page import="luzminhavida.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reserva" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reserva">
			
				<g:if test="${reservaInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="reserva.date.label" default="Data" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${reservaInstance?.date}" format="dd/MM/yyyy" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="reserva.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${reservaInstance?.cliente?.id}">${reservaInstance?.cliente?.nome}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.numeroPessoas}">
				<li class="fieldcontain">
					<span id="numeroPessoas-label" class="property-label"><g:message code="reserva.numeroPessoas.label" default="Numero Pessoas" /></span>
					
						<span class="property-value" aria-labelledby="numeroPessoas-label"><g:fieldValue bean="${reservaInstance}" field="numeroPessoas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.itemPesca}">
				<li class="fieldcontain">
					<span id="itemPesca-label" class="property-label"><g:message code="reserva.itemPesca.label" default="Item Pesca" /></span>
					
						<span class="property-value" aria-labelledby="itemPesca-label"><g:fieldValue bean="${reservaInstance}" field="itemPesca"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.ativa}">
				<li class="fieldcontain">
					<span id="ativa-label" class="property-label"><g:message code="reserva.ativa.label" default="Ativa" /></span>
					
						<span class="property-value" aria-labelledby="ativa-label"><g:formatBoolean boolean="${reservaInstance?.ativa}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:reservaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${reservaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
