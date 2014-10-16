<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatorio de Login de Usuarios</title>
    </head>
    <body>
        <h1>Relatorio de Avaliações</h1>
        <h3>De: ${datai} Até: ${dataf}<h3>
                <h3>Total de Avaliações: ${totalVisu}</h3>
                <h1></h1>
                <h1></h1>
                <h3>Relatório Estatístico de Avaliações</h3>
                <table style="width:50%">
                    <thead>
                        <tr>

                            <th>${message(code: 'cliente.avaliacao.label', default: 'Avaliação')}</th>

                            <th>${message(code: 'cliente.permissao.label', default: 'Total de Avaliações')}</th>


                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${listaTotal}" status="i" var="comentariosInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td>${fieldValue(bean: comentariosInstance, field: "key")}</td>
                                
                                <td>${fieldValue(bean: comentariosInstance, field: "value")}  (${lstAvalPercent[i]}%) </td> 
                            </tr>
                        </g:each>
                    </tbody>
                </table>

                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h3>Registro de Avaliações por Cliente</h3>
                <table style="width:50%">
                    <thead>
                        <tr>

                            <th>${message(code: 'produtos.dia.label', default: 'Cliente')}</th>

                            <th>${message(code: 'cliente.acessp.label', default: 'Total de Acessos')}</th>


                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${lstCliente}" status="i" var="usuariosInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td>${fieldValue(bean: usuariosInstance.key, field: "nome")}</td>

                                <td>${fieldValue(bean: usuariosInstance, field: "value")} (${lstPercentClient[i]} %)</td>

                            </tr>
                        </g:each>
                    </tbody>
                </table>
                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h3>Registro de Avaliações</h3>
                <table style="width:50%">
                    <thead>
                        <tr>

                            <th>${message(code: 'produtos.date.label', default: 'Data')}</th>

                            <th>${message(code: 'cliente.id.label', default: 'Cliente')}</th>

                            <th>${message(code: 'cliente.id.label', default: 'ID-AVALIACAO')}</th>

                            <th>${message(code: 'cliente.permissao.label', default: 'Comentario')}</th>
                            
                            <th>${message(code: 'cliente.permissao.label', default: 'Avaliação')}</th>


                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${listaFinal}" status="i" var="comentariosInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td><g:formatDate date="${comentariosInstance.data}" format="dd/MM/yyyy"/></td>

                                <td>${fieldValue(bean: comentariosInstance?.cliente, field: "nome")}</td>

                                <td>${fieldValue(bean: comentariosInstance, field: "id")}</td>

                                <td>${fieldValue(bean: comentariosInstance, field: "comentarios")}</td>

                                <td>${fieldValue(bean: comentariosInstance?.estrelas, field: "estrelas")}</td>



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

