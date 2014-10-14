<html>

    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>

    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>

        <h1></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div id = 'overall'>
            <g:form controller="Cliente" action="search">

                Nome do Cliente:
                <g:textField name="nome"
                    maxlength="30">
                </g:textField>	


                <input value="Procurar" type="submit"/>
            </g:form>



        </div>

    </body>
</html>