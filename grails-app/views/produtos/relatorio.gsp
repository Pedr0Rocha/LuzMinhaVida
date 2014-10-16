<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatorio de Visualizações de Produto</title>
    </head>
    <body>
        <h1>Relatorio de Visualizações de Produto</h1>
        <h3>De: ${datai} Até: ${dataf}<h3>
                <h3>Total de Visualizações: ${visuTotal}</h3>
                <h1></h1>
                <h1></h1>
                <h3>Produtos Visualizados</h3>
                <table style="width:50%">
                    <thead>
                        <tr>

                            <th class="nome-produto">${message(code: 'produtos.nomeProduto.label', default: 'Nome Produto')}</th>                                          

                            <th><g:message code="produtos.categoria.label" default="Categoria" /></th>

                            <th>${message(code: 'produtos.valor.label', default: 'Valor')}</th>

                            <th>${message(code: 'produtos.valor.label', default: 'Numero de Visualizações')}</th>

                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${listaTotal}" status="i" var="produtosInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td class="nome-produto">${fieldValue(bean: produtosInstance.key, field: "nomeProduto")}</td>

                                <td>${fieldValue(bean: produtosInstance.key.categoria, field: "name")}</td>

                                <td>${fieldValue(bean: produtosInstance.key, field: "valor")}</td>

                                <td>${fieldValue(bean: produtosInstance, field: "value")}  (${totalVisu[i]}%) </td> 



                            </tr>
                        </g:each>
                    </tbody>
                </table>

                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h1></h1>

                <h3>Visualizações por Cliente</h3>
                <table style="width:50%">
                    <thead>
                        <tr>

                            <th class="nome-produto">${message(code: 'produtos.nomeProduto.label', default: 'Nome Cliente')}</th> 

                            <th>${message(code: 'produtos.valor.label', default: 'Numero de Visualizações')}</th>


                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${listaCli}" status="i" var="produtosInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td class="nome-produto">${fieldValue(bean: produtosInstance.key, field: "nome")}</td>

                                <td>${fieldValue(bean: produtosInstance, field: "value")}</td> 



                            </tr>
                        </g:each>
                    </tbody>
                </table>

                </body>
                </html>

                <style>
                    td{
                    text-align: center;
                    border: 1px solid black;
                    }
                    th{
                    border: 1px solid black;
                    }
                    .nome-produto{
                    text-align: left;
                    }
                </style>

