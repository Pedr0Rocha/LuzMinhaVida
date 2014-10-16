<%@ page import="luzminhavida.Comentarios" %>



<div class="fieldcontain ${hasErrors(bean: comentariosInstance, field: 'comentarios', 'error')} required">
	<label for="comentarios">
		<g:message code="comentarios.comentarios.label" default="Comentarios" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="comentarios" cols="40" rows="5" maxlength="300" required="" value="${comentariosInstance?.comentarios}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: comentariosInstance, field: 'estrelas', 'error')} required">
	<label for="estrelas">
		<g:message code="comentarios.estrelas.label" default="Estrelas" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estrelas" name="estrelas.id" from="${luzminhavida.Aval.list()}" optionKey="id" optionValue="estrelas" required="" value="${comentariosInstance?.estrelas?.id}" class="many-to-one"/>

</div>

