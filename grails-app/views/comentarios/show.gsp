
<%@ page import="luzminhavida.Comentarios" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comentarios.label', default: 'Comentarios')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-comentarios" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-comentarios" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list comentarios">
			
				<g:if test="${comentariosInstance?.comentarios}">
				<li class="fieldcontain">
					<span id="comentarios-label" class="property-label"><g:message code="comentarios.comentarios.label" default="Comentarios" /></span>
					
						<span class="property-value" aria-labelledby="comentarios-label"><g:fieldValue bean="${comentariosInstance}" field="comentarios"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${comentariosInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="comentarios.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${comentariosInstance?.cliente?.id}">${comentariosInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${comentariosInstance?.data}">
				<li class="fieldcontain">
					<span id="data-label" class="property-label"><g:message code="comentarios.data.label" default="Data" /></span>
					
						<span class="property-value" aria-labelledby="data-label"><g:formatDate date="${comentariosInstance?.data}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${comentariosInstance?.estrelas}">
				<li class="fieldcontain">
					<span id="estrelas-label" class="property-label"><g:message code="comentarios.estrelas.label" default="Estrelas" /></span>
					
						<span class="property-value" aria-labelledby="estrelas-label"><g:link controller="aval" action="show" id="${comentariosInstance?.estrelas?.id}">${comentariosInstance?.estrelas?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:comentariosInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${comentariosInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
