<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'produtos.label', default: 'Filtro')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>


        <h1></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>    

        <h1></h1>
        <div class="nav" role="navigation">

            <ul>
                <div id = 'overall'>
                    <g:form controller="relatorioLogin" action="filtro" target="_blank">

                        <h1>Filtros:</h1>

                        <h5></h5>
                        <h1></h1>
                        <label  for="Date">
                            <g:message code="Date" default="Data Inicial:" />
                            <g:datePicker name="datai" precision="day" value="${new Date()}">
                            </g:datePicker>
                        </label>  
                        <h5></h5>
                        <h1></h1> 
                        <label for="Datef">
                            <g:message code="Datef" default="Data Final:" />
                            <g:datePicker name="dataf" precision="day" value="${new Date()}">
                            </g:datePicker>
                        </label>

                        <h5></h5>
                        <h1></h1>
                        <label for="Tipo de Usuário">
                            <g:message code="Tipo de Usuário" default="Tipo de Usuário:"  />
                            <g:select id="permiss" name="permiss.id" from="${luzminhavida.Permiss.list()}" optionKey="id" optionValue="nome" required="" value="${usuarioInstance?.permissao?.id}" class="many-to-one" noSelection="['-1':'Todos']"/>
                        </label>

                </div>

            </ul>
        </div>
                        <h1></h1>
                        <div class="nav" role="navigation">
                            <ul>
                                <input value="Gerar Relatório de Login" type="submit"/>
                      <!-- <li><a class="list"rocurar href="${createLink(uri: '/produtos/filtro')}" ><g:message code="Relatorio de Produtos"/></a></li> -->

                            </ul>
                        </div>
                    </g:form>
    </body>
</html>