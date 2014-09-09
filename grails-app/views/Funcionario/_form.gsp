<%@ page import="luzminhavida.Funcionario" %>



<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="funcionario.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="30" pattern="${funcionarioInstance.constraints.nome.matches}" required="" value="${funcionarioInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'cargo', 'error')} required">
	<label for="cargo">
		<g:message code="funcionario.cargo.label" default="Cargo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cargo" required="" value="${funcionarioInstance?.cargo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'CPF', 'error')} required">
	<label for="CPF">
		<g:message code="funcionario.CPF.label" default="CPF" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="CPF" maxlength="12" required="" value="${funcionarioInstance?.CPF}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'telefone', 'error')} required">
	<label for="telefone">
		<g:message code="funcionario.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefone" pattern="${funcionarioInstance.constraints.telefone.matches}" required="" value="${funcionarioInstance?.telefone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="funcionario.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endereco" required="" value="${funcionarioInstance?.endereco}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'CEP', 'error')} required">
	<label for="CEP">
		<g:message code="funcionario.CEP.label" default="CEP" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="CEP" maxlength="8" required="" value="${funcionarioInstance?.CEP}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="funcionario.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" required="" value="${funcionarioInstance?.login}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="funcionario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${funcionarioInstance?.password}"/>

</div>

