<%@ page import="luzminhavida.Reserva" %>



<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="reserva.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${reservaInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'cliente', 'error')} ">
	<label for="cliente">
		<g:message code="reserva.cliente.label" default="Cliente" />
		
	</label>
	<g:select id="cliente" name="cliente.id" from="${luzminhavida.Cliente.list()}" optionKey="id" value="${reservaInstance?.cliente?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'numeroPessoas', 'error')} required">
	<label for="numeroPessoas">
		<g:message code="reserva.numeroPessoas.label" default="Numero Pessoas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeroPessoas" type="number" min="1" value="${reservaInstance.numeroPessoas}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'ativa', 'error')} ">
	<label for="ativa">
		<g:message code="reserva.ativa.label" default="Ativa" />
		
	</label>
	<g:checkBox name="ativa" value="${reservaInstance?.ativa}" />

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'itemPesca', 'error')} ">
	<label for="itemPesca">
		<g:message code="reserva.itemPesca.label" default="Item Pesca" />
		
	</label>
	<g:checkBox name="itemPesca" value="${reservaInstance?.itemPesca}" />

</div>

