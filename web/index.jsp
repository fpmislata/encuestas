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
            <div class="span12" style="text-align: center"><span class="main-text">Enquesta</span><span class="main-text-gray"> del proc&eacute;s de matr&iacute;cula</span></div>
        </div>
        <div class="row-fluid" >
            <div class="span12"><img src="img/icons/pie_chart.png" alt="grafica" class="center" ></div>
        </div>
        <div class="row-fluid" style="margin-top: 5em;">
            <div class="span12 main-text" style="text-align: center;font-size:40px;">Quin tipus d'alumne eres?</div>
        </div>
        <div class="row-fluid" style="margin-top: 3em;">

            <div class="span6" >
                <a href="encuesta.html?idEncuesta=1" class="main-button" style="float: right;">
                    <span class="main-text">Nou en el centre</span>
                    <br />
                    <img src="img/icons/people.png" alt="nuevo" class="center" />
                </a>
            </div>
            <div class="span6" >
                <a href="encuesta.html?idEncuesta=3" class="main-button">
                    <span class="main-text">d'anys anteriors</span>
                    <br />
                    <img src="img/icons/phonebook.png" alt="de años anteriores" class="center" >
                </a>
            </div>
        </div>

    <%@ include file="/template/bottom.jsp" %>
</body>
</html>
