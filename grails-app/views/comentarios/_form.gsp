<%@ page import="luzminhavida.Comentarios" %>



<div class="fieldcontain ${hasErrors(bean: comentariosInstance, field: 'comentarios', 'error')} required">
	<label for="comentarios">
		<g:message code="comentarios.comentarios.label" default="Comentarios" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="comentarios" cols="40" rows="5" maxlength="300" required="" value="${comentariosInstance?.comentarios}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: comentariosInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="comentarios.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${luzminhavida.Cliente.list()}" optionKey="id" required="" value="${comentariosInstance?.cliente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: comentariosInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="comentarios.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data" precision="day"  value="${comentariosInstance?.data}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: comentariosInstance, field: 'estrelas', 'error')} required">
	<label for="estrelas">
		<g:message code="comentarios.estrelas.label" default="Estrelas" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estrelas" name="estrelas.id" from="${luzminhavida.Aval.list()}" optionKey="id" required="" value="${comentariosInstance?.estrelas?.id}" class="many-to-one"/>

</div>

