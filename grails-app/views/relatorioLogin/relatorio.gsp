<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatorio de Login de Usuarios</title>
    </head>
    <body>
        <h1>Relatorio de Login de Usuarios</h1>
        <h3>De: ${datai} Até: ${dataf}<h3>
                <h3>Total de Acessos: ${totalVisu}</h3>
                <h1></h1>
                <h1></h1>
                <h3>Relatório Estatístico de Acessos de Usuarios</h3>
                <table style="width:50%">
                    <thead>
                        <tr>

                            <th>${message(code: 'cliente.nome.label', default: 'Nome')}</th>

                            <th>${message(code: 'cliente.id.label', default: 'ID-USUARIO')}</th>

                            <th>${message(code: 'cliente.telefone.label', default: 'Telefone')}</th>

                            <th>${message(code: 'cliente.permissao.label', default: 'Tipo Usuario')}</th>

                            <th>${message(code: 'cliente.permissao.label', default: 'Total de Acessos')}</th>


                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${listaTotal}" status="i" var="usuariosInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td>${fieldValue(bean: usuariosInstance.key, field: "nome")}</td>

                                <td>${fieldValue(bean: usuariosInstance.key, field: "id")}</td>

                                <td>${fieldValue(bean: usuariosInstance.key, field: "telefone")}</td>

                                <td>${fieldValue(bean: usuariosInstance.key.permissao, field: "nome")}</td>

                                <td>${fieldValue(bean: usuariosInstance, field: "value")}  (${cadaVisu[i]}%) </td> 
                            </tr>
                        </g:each>
                    </tbody>
                </table>

                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h3>Registro de Acessos por Dia da Semana</h3>
                <table style="width:50%">
                    <thead>
                        <tr>

                            <th>${message(code: 'produtos.dia.label', default: 'Dia')}</th>

                            <th>${message(code: 'cliente.acessp.label', default: 'Total de Acessos')}</th>


                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${semana}" status="i" var="usuariosInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td>${fieldValue(bean: usuariosInstance, field: "key")}</td>

                                <td>${fieldValue(bean: usuariosInstance, field: "value")} (${psemana[i]} %)</td>

                            </tr>
                        </g:each>
                    </tbody>
                </table>
                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h1></h1>
                <h3>Registro de Acessos</h3>
                <table style="width:50%">
                    <thead>
                        <tr>

                            <th>${message(code: 'produtos.date.label', default: 'Data')}</th>

                            <th>${message(code: 'cliente.id.label', default: 'ID-TRANSAÇÃO')}</th>

                            <th>${message(code: 'cliente.nome.label', default: 'Nome')}</th>

                            <th>${message(code: 'cliente.id.label', default: 'ID-USUARIO')}</th>

                            <th>${message(code: 'cliente.permissao.label', default: 'Tipo Usuario')}</th>


                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${listaFinal}" status="i" var="usuariosInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td><g:formatDate date="${usuariosInstance.data}" format="dd/MM/yyyy"/></td>

                                <td>${fieldValue(bean: usuariosInstance, field: "id")}</td>

                                <td>${fieldValue(bean: usuariosInstance?.usuario, field: "nome")}</td>

                                <td>${fieldValue(bean: usuariosInstance?.usuario, field: "id")}</td>

                                <td>${fieldValue(bean: usuariosInstance?.usuario.permissao, field: "nome")}</td>



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

