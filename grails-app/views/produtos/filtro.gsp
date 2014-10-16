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
                    <g:form controller="Produtos" action="filtro">

                        <h1>Filtros:</h1>

                        <h5></h5>
                        <h1></h1>
                        <label for="Produto">
                            <g:message code="Produto" default="Produto:" />
                            <g:textField name="nomeProduto"
                                maxlength="30" style="margin-left: 13px">
                            </g:textField>
                        </label>	

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
                        <label for="Valor">
                            <g:message code="Valor" default="Valor:" />
                            <g:textField name="valor"
                                maxlength="30" style="margin-left: 32px">
                            </g:textField> 
                        </label>

                        <h5></h5>
                        <h1></h1>
                        <label for="Categoria">
                            <g:message code="Categoria" default="Categoria:" />
                            <g:select id="categoria" name="categoria.id" from="${luzminhavida.CategoriaProdutos.list()}" optionKey="id" optionValue="name" required="" value="${produtosInstance?.categoria?.id}" class="many-to-one" noSelection="['-1':'Todos']"/>
                        </label>
                        <input value="Procurar" type="submit"/>
                    </g:form>

                </div>

            </ul>
        </div>
        <h1></h1>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="list" href="${createLink(uri: '/relatorioProdutos')}" target="_blank"><g:message code="Relatorio de Produtos"/></a></li> 
              <!-- <li><a class="list" href="${createLink(uri: '/produtos/filtro')}" ><g:message code="Relatorio de Produtos"/></a></li> -->

            </ul>
        </div>
    </body>
</html>