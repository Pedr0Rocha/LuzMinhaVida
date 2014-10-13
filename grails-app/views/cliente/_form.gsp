<%@ page import="luzminhavida.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="cliente.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="30" pattern="${clienteInstance.constraints.nome.matches}" required="" value="${clienteInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'CPF', 'error')} required">
	<label for="CPF">
		<g:message code="cliente.CPF.label" default="CPF" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="CPF" maxlength="12" required="" value="${clienteInstance?.CPF}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefone', 'error')} required">
	<label for="telefone">
		<g:message code="cliente.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefone" pattern="${clienteInstance.constraints.telefone.matches}" required="" value="${clienteInstance?.telefone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="cliente.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endereco" required="" value="${clienteInstance?.endereco}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'CEP', 'error')} required">
	<label for="CEP">
		<g:message code="cliente.CEP.label" default="CEP" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="CEP" maxlength="8" required="" value="${clienteInstance?.CEP}"/>

</div>

