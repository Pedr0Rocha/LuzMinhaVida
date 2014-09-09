<%@ page import="luzminhavida.Funcionario" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="Login" />
        <title><g:message code="Login" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="logout"><g:message code="Logout" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create" class="content scaffold-create" role="main">
            <h1><g:message code="Login" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${funcionarioInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${funcionarioInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="authenticate" >
                <fieldset class="form">
                    <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'login', 'error')} ">
                        <label for="login">
                            <g:message code="funcionario.login.label" default="Login" />
                            
                        </label>
                        <g:textField name="login" value="${funcionarioInstance?.login}"/>
                    </div>
                    
                    <div class="fieldcontain ${hasErrors(bean: funcionarioInstance, field: 'password', 'error')} ">
                        <label for="password">
                            <g:message code="funcionario.password.label" default="Password" />
                            
                        </label>
                        <g:field type="password" name="password" value="${funcionarioInstance?.password}"/>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="Logar" class="save" value="logar" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>