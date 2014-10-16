<%@ page import="luzminhavida.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="cliente.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" required="" value="${clienteInstance?.login}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="cliente.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${clienteInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'permissao', 'error')} ">
	<label for="permissao">
		<g:message code="cliente.permissao.label" default="Permissao" />
		
	</label>
	<g:select id="permissao" name="permissao.id" from="${luzminhavida.Permiss.list()}" optionKey="id" value="${clienteInstance?.permissao?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="cliente.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="30" pattern="${clienteInstance.constraints.nome.matches}" required="" value="${clienteInstance?.nome}"/>

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

