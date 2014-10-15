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
                <h1 style="margin-left: 20px;">Ajuda</h1>
                <br>
                <p style="margin-left: 40px;">
                dasdasdasdasd
                dsadasd
                asdsadas
                </p>
            </ul>
        </div>

    </body>
</html>

