<%@ page import="luzminhavida.Reserva" %>



<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="reserva.date.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${reservaInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'numeroPessoas', 'error')} required">
	<label for="numeroPessoas">
		<g:message code="reserva.numeroPessoas.label" default="Numero Pessoas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeroPessoas" type="number" min="1" value="${reservaInstance.numeroPessoas}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'itemPesca', 'error')} required">
	<label for="itemPesca">
		<g:message code="reserva.itemPesca.label" default="Item Pesca" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="itemPesca" type="number" min="0" value="${reservaInstance.itemPesca}" required=""/>

</div>


