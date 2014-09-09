
<%@ page import="luzminhavida.Funcionario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-funcionario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-funcionario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list funcionario">
			
				<g:if test="${funcionarioInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="funcionario.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${funcionarioInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.cargo}">
				<li class="fieldcontain">
					<span id="cargo-label" class="property-label"><g:message code="funcionario.cargo.label" default="Cargo" /></span>
					
						<span class="property-value" aria-labelledby="cargo-label"><g:fieldValue bean="${funcionarioInstance}" field="cargo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.CPF}">
				<li class="fieldcontain">
					<span id="CPF-label" class="property-label"><g:message code="funcionario.CPF.label" default="CPF" /></span>
					
						<span class="property-value" aria-labelledby="CPF-label"><g:fieldValue bean="${funcionarioInstance}" field="CPF"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.telefone}">
				<li class="fieldcontain">
					<span id="telefone-label" class="property-label"><g:message code="funcionario.telefone.label" default="Telefone" /></span>
					
						<span class="property-value" aria-labelledby="telefone-label"><g:fieldValue bean="${funcionarioInstance}" field="telefone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="funcionario.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${funcionarioInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.CEP}">
				<li class="fieldcontain">
					<span id="CEP-label" class="property-label"><g:message code="funcionario.CEP.label" default="CEP" /></span>
					
						<span class="property-value" aria-labelledby="CEP-label"><g:fieldValue bean="${funcionarioInstance}" field="CEP"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="funcionario.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${funcionarioInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionarioInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="funcionario.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${funcionarioInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:funcionarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${funcionarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
