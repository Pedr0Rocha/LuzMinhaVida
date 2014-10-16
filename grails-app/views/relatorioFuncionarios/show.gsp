
<%@ page import="luzminhavida.RelatorioFuncionarios" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relatorioFuncionarios.label', default: 'RelatorioFuncionarios')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-relatorioFuncionarios" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-relatorioFuncionarios" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list relatorioFuncionarios">
			
				<g:if test="${relatorioFuncionariosInstance?.funcionario}">
				<li class="fieldcontain">
					<span id="funcionario-label" class="property-label"><g:message code="relatorioFuncionarios.funcionario.label" default="Funcionario" /></span>
					
						<span class="property-value" aria-labelledby="funcionario-label"><g:link controller="funcionario" action="show" id="${relatorioFuncionariosInstance?.funcionario?.id}">${relatorioFuncionariosInstance?.funcionario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${relatorioFuncionariosInstance?.data}">
				<li class="fieldcontain">
					<span id="data-label" class="property-label"><g:message code="relatorioFuncionarios.data.label" default="Data" /></span>
					
						<span class="property-value" aria-labelledby="data-label"><g:formatDate date="${relatorioFuncionariosInstance?.data}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${relatorioFuncionariosInstance?.produto}">
				<li class="fieldcontain">
					<span id="cargo-label" class="property-label"><g:message code="relatorioFuncionario.cargo.label" default="Cargo" /></span>
					
						<span class="property-value" aria-labelledby="cargo-label"><g:link controller="cargo" action="show" id="${relatorioFuncionariosInstance?.cargo?.id}">${relatorioFuncionariosInstance?.cargo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			
			</ol>
			<g:form url="[resource:relatorioFuncionariosInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${relatorioFuncionariosInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
