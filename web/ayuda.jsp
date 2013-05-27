<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>
        <div class="row-fluid" style="margin-top: 2em">
            <div class="span12" style="text-align: center"><span class="main-text">Enquesta</span><span class="main-text-gray"> d'inici de curs</span></div>
        </div>
        <div class="row-fluid" >
            <div class="span12"><img src="img/icons/pie_chart.png" alt="grafica" class="center" ></div>
        </div>
        <div class="row-fluid" style="margin-top: 0em;">
            <p class="simple-text lead">Farcida tots els apartats de l'enquesta.</p>
            <p class="simple-text lead">Si en algun apartat no tens informaci&oacute; per a donar el teu criteri, llavors has d'indicar "NS/NC" o "Altres"</p>
            <p class="simple-text lead">En els valors en què cal respondre de 0 a 10.</p>
            <p class="simple-text lead">
                <ul>
                    <li class="simple-text lead">0 vol dir totalment en desacord.</li>
                    <li class="simple-text lead">10 vol dir totalment d'acord.</li>
                </ul>
            </p>
            <p class="simple-text lead">Gr&agrave;cies per la teua col·laboraci&oacute;</p>
            <p><button class="btn btn-primary"  onclick="window.history.back()">Tornar</a></p>
    </div>
</div>

<%@ include file="/template/bottom.jsp" %>
</body>
</html>
