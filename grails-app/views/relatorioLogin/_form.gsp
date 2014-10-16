<%@ page import="luzminhavida.RelatorioLogin" %>



<div class="fieldcontain ${hasErrors(bean: relatorioLoginInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="relatorioLogin.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data" precision="day"  value="${relatorioLoginInstance?.data}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: relatorioLoginInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="relatorioLogin.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${luzminhavida.Usuario.list()}" optionKey="id" required="" value="${relatorioLoginInstance?.usuario?.id}" class="many-to-one"/>

</div>

