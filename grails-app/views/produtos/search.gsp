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
        	<li><g:link class="list" action="index"><g:message code="Voltar para Lista de Produtos" /></g:link></li>

            </ul>
        </div>    

        <h1></h1>
        <div class="nav" role="navigation">

            <ul>
                <div id = 'overall'>
                    <g:form controller="Produtos" action="search"   >

                        <h1>Procurar:</h1>

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
                    </div>

                </ul>
            </div>
            <h1></h1>
            <div class="nav" role="navigation">
                <ul>
                    <input class="list" value="Procurar" type="submit"/>
          <!-- <li><a class="list" href="${createLink(uri: '/produtos/filtro')}" ><g:message code="Relatorio de Produtos"/></a></li> -->

                </ul>
            </div>
        </g:form>

    </body>
</html>