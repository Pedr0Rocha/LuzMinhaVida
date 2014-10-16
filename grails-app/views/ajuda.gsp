<html>

    <head>
        <meta name="layout" content="main">        
        <g:set var="entityName" value="${message(code: 'ajuda', default: 'Ajuda')}" />
        <title><g:message code="Ajuda" args="[entityName]" /></title>
    </head>

    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>

        <h1></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div id = 'overall'>            
        </div>
        <div>
            <ul>
                <h1 style="margin-left: 20px;">Ajuda</h1><br>
                <h4 style="margin-left: 40px;">
                    Seja bem vindo à página do Restaurante Luz da Minha Vida!
                </h4><br>
                <h5 style="margin-left: 40px;">                
                    <p>Para utilizar nosso site em sua totalidade é necessário estar cadastrado.</p><br>
                    <p>Você pode fazer seu cadastro clicando <a class="controller"><g:link controller="cliente" action="create">aqui</g:link></a>. É rapidinho!</p><br>
                    <p>Sendo um cliente cadastrado, você poderá fazer a reserva de mesas e de equipamentos de pesca, economizando tempo e aproveitando
                        sua visita ao máximo!</p><br>
                    <p>Para reservar uma mesa, acesse o menu <i><a class="controller"><g:link controller="reserva">reservas</g:link></a></i> e clique em <i>Nova Reserva</i>.</p><br>
                    <p>Escolha a data que deseja reservar e o número de pessoas. Escolha também quantos equipamentos deseja reservar para sua pescaria.</p><br>
                    <p>Após preencher todos os campos, clique em <i>Criar</i>. Pronto, sua reserva foi efetuada! </p><br>
                    <p>Você pode verificar suas reservas pressionando em <i>Lista de Reservas</i>.</p><br>
                    <p>Nós do Restaurante Luz da Minha Vida, estamos esperando a sua visita!</p>

                </h5>

            </ul>
        </div>

    </body>
</html>

