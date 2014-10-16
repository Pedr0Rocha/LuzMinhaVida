<%@ page import="luzminhavida.RelatorioFuncionarios" %>



<div class="fieldcontain ${hasErrors(bean: relatorioFuncionariosInstance, field: 'funcionario', 'error')} required">
	<label for="funcionario">
		<g:message code="relatorioFuncionarios.funcionario.label" default="Funcionario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="funcionario" name="funcionario.id" from="${luzminhavida.Funcionario.list()}" optionKey="id" required="" value="${relatorioFuncionariosInstance?.funcionario?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: relatorioFuncionariosInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="relatorioFuncionarios.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data" precision="day"  value="${relatorioFuncionariosInstance?.data}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: relatorioFuncionariosInstance, field: 'cargo', 'error')} required">
	<label for="cargo">
		<g:message code="relatorioFuncionarios.cargo.label" default="Cargo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cargo" name="cargo.id" from="${luzminhavida.Funcionario.list()}" optionKey="id" required="" value="${relatorioFuncionarioInstance?.cargo?.id}" class="many-to-one"/>

</div>

