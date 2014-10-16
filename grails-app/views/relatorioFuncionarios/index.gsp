
<%@ page import="luzminhavida.RelatorioFuncionarios" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relatorioFuncionarios.label', default: 'RelatorioFuncionarios')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-relatorioFuncionarios" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-relatorioFuncionarios" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
                                            	<th><g:message code="relatorioFuncionarios.funcionario.label" default="Funcionario" /></th>
					
						<g:sortableColumn property="data" title="${message(code: 'relatorioFuncionarios.data.label', default: 'Data')}" />
					
						<th><g:message code="relatorioFunconarios.cargo.label" default="PCargo" /></th>
                                            
					</tr>
				</thead>
				<tbody>
				<g:each in="${relatorioFuncionariosInstanceList}" status="i" var="relatorioFuncionariosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${relatorioFuncionariosInstance.id}">${fieldValue(bean: relatorioFuncionariosInstance, field: "funcionario")}</g:link></td>
					
						<td><g:formatDate date="${relatorioFuncionariosInstance.data}" /></td>
					
						<td>${fieldValue(bean: relatorioFuncionariosInstance, field: "cargo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${relatorioFuncionariosInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
