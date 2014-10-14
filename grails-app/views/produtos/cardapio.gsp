<%@ page import="luzminhavida.Produtos" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'produtos.label', default: 'Produtos')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-produtos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <h1>CARDAPIO</h1>
            </ul>
        </div>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="list-produtos" class="content scaffold-list" role="main">

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <h1>
            </h1>

            <g:each in="${aMatrizCategoria}" status="j" var="categoriaInstance">
                <div class="nav" role="navigation">
                    <ul>
                        <h1>${categoriaInstance[0]?.categoria?.name}</h1>
                    </ul>
                </div>

              
                <table>
                    <thead>
                        <tr>

                            <th>${message(code: 'produtos.nomeProduto.label', default: 'Nome Produto')}</th>



                            <th>${message(code: 'produtos.valor.label', default: 'Valor')}</th>


                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${categoriaInstance}" status="i" var="produtosInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td><g:link action="show" id="${produtosInstance.id}">${fieldValue(bean: produtosInstance, field: "nomeProduto")}</g:link></td>


                                <td>${fieldValue(bean: produtosInstance, field: "valor")}</td>


                            </tr>
                        </g:each>
                    </tbody>
                </table>
                <h1></h1>
            </g:each>

            <div class="pagination">
                <g:paginate total="${produtosInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
