<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Luz da Minha Vida</title>
        <style type="text/css" media="screen">
            #status {
            background-color: #eee;
            border: .2em solid #fff;
            margin: 2em 2em 1em;
            padding: 1em;
            width: 12em;
            float: left;
            -moz-box-shadow: 0px 0px 1.25em #ccc;
            -webkit-box-shadow: 0px 0px 1.25em #ccc;
            box-shadow: 0px 0px 1.25em #ccc;
            -moz-border-radius: 0.6em;
            -webkit-border-radius: 0.6em;
            border-radius: 0.6em;
            }

            .ie6 #status {
            display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
            }

            #status ul {
            font-size: 0.9em;
            list-style-type: none;
            margin-bottom: 0.6em;
            padding: 0;
            }

            #status li {
            line-height: 1.3;
            }

            #status h1 {
            text-transform: uppercase;
            font-size: 1.1em;
            margin: 0 0 0.3em;
            }

            #page-body {
            margin: 2em 1em 1.25em 18em;
            }

            h2 {
            margin-top: 1em;
            margin-bottom: 0.3em;
            font-size: 1em;
            }

            p {
            line-height: 1.5;
            margin: 0.25em 0;
            }

            #controller-list ul {
            list-style-position: inside;
            }

            #controller-list li {
            line-height: 1.3;
            list-style-position: inside;
            margin: 0.25em 0;
            }

            @media screen and (max-width: 480px) {
            #status {
            display: none;
            }

            #page-body {
            margin: 0 1em 1em;
            }

            #page-body h1 {
            margin-top: 0;
            }
            }

            #box-login{	
            float:left;
            width:65px;
            color:red;
            }
        </style>
    </head>
    <body>
        <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <!--<div id="status" role="complementary">
                <h1>Application Status</h1>
                <ul>
                        <li>App version: <g:meta name="app.version"/></li>
                        <li>Grails version: <g:meta name="app.grails.version"/></li>
                        <li>Groovy version: ${GroovySystem.getVersion()}</li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                </ul>
                <h1>Installed Plugins</h1>
                <ul>
                        <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                                <li>${plugin.name} - ${plugin.version}</li>
                        </g:each>
                </ul>
        </div>-->

        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" controller = "login" action="logout"><g:message code="Login/Logout" args="[entityName]" /></g:link></li>
                <li><a class="help" href="${createLink(uri: '/ajuda')}"><g:message code="Ajuda" /></a></li>   
            </ul>
        </div>

        <div id="page-body" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <h1>Luz da Minha vida</h1>
            <p>Bem Vindo ao site do restaurante Luz da Minha Vida!</p>

            <div id="controller-list" role="navigation">
                <h2>Menu de Opções:</h2>
                <ul>
                    <li class="controller"><g:link controller="cliente">CADASTRO CLIENTE</g:link></li>
                    <li class="controller"><g:link controller="funcionario">CADASTRO FUNCIONARIO</g:link></li>
                    <li class="controller"><g:link controller="produtos">CADASTRO PRODUTO</g:link></li>
                    <li class="controller"><g:link controller="reserva">CADASTRO RESERVA</g:link></li>
                    <li class="controller"><g:link controller="comentarios" action="listarComentarios">AVALIAR</g:link></li>
                    <li class="controller"><g:link controller="cardapio" action="cardap">CARDAPIO</g:link></li>
                    <li class="controller"><g:link controller="reserva" action="listarHistorico">HISTÓRICO DE RESERVAS</g:link></li>
                    <li class="controller"><g:link controller="produtos" action="filtro">RELATORIO DE PRODUTOS</g:link></li>
                    <li class="controller"><g:link controller="relatorioLogin" action="filtro">RELATORIO DE ACESSOS</g:link></li>
                    <li class="controller"><g:link controller="comentarios" action="filtro">RELATORIO DE AVALIAÇÕES</g:link></li>


                </ul>
            </div>
        </div>
    </body>
</html>
