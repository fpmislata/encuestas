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
            <p class="simple-text lead">Farcida este q&uuml;estionari per a avaluar la qualitat del proc&eacute;s de matricula.</p>
            <p class="simple-text lead">Les dades aportats seran estrictament confidencials.Esta informaci&oacute; ens ser&agrave; molt &uacute;til per a millorar el proc&eacute;s de matricula del pr&ograve;xim curs.</p>
            <p class="simple-text lead">Gr&agrave;cies per la teua col&#183;laboraci&oacute;</p>
            <p><button class="btn btn-primary"  onclick="window.history.back()">Tornar</button></p>
        </div>

    <%@ include file="/template/bottom.jsp" %>
</body>
</html>
