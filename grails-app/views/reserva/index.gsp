
<%@ page import="luzminhavida.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reserva" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="date" title="${message(code: 'reserva.date.label', default: 'Date')}" />
					
						<th><g:message code="reserva.cliente.label" default="Cliente" /></th>
					
						<g:sortableColumn property="numeroPessoas" title="${message(code: 'reserva.numeroPessoas.label', default: 'Numero Pessoas')}" />
					
						<g:sortableColumn property="itemPesca" title="${message(code: 'reserva.itemPesca.label', default: 'Item Pesca')}" />
					
						<g:sortableColumn property="ativa" title="${message(code: 'reserva.ativa.label', default: 'Ativa')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservaInstanceList}" status="i" var="reservaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reservaInstance.id}">${fieldValue(bean: reservaInstance, field: "date")}</g:link></td>
					
						<td>${fieldValue(bean: reservaInstance, field: "cliente")}</td>
					
						<td>${fieldValue(bean: reservaInstance, field: "numeroPessoas")}</td>
					
						<td>${fieldValue(bean: reservaInstance, field: "itemPesca")}</td>
					
						<td><g:formatBoolean boolean="${reservaInstance.ativa}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reservaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
