
<%@ page import="luzminhavida.RelatorioProdutos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relatorioProdutos.label', default: 'RelatorioProdutos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-relatorioProdutos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-relatorioProdutos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="relatorioProdutos.cliente.label" default="Cliente" /></th>
					
						<g:sortableColumn property="data" title="${message(code: 'relatorioProdutos.data.label', default: 'Data')}" />
					
						<th><g:message code="relatorioProdutos.produto.label" default="Produto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${relatorioProdutosInstanceList}" status="i" var="relatorioProdutosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${relatorioProdutosInstance.id}">${fieldValue(bean: relatorioProdutosInstance, field: "cliente")}</g:link></td>
					
						<td><g:formatDate date="${relatorioProdutosInstance.data}" /></td>
					
						<td>${fieldValue(bean: relatorioProdutosInstance, field: "produto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${relatorioProdutosInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
