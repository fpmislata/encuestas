<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" ng-app="app">
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
        <script type='text/javascript' src='<%=request.getContextPath()%>/lib/highcharts/js/highcharts-3.0.1.js'></script>
        <script type='text/javascript' src='todasgraficas.js'></script>

    </head>
    <body ng-controller="TodasGraficasController" id="body" style="background: #FFFFFF" >
        <h2 style="text-align: center">Encuesta</h2>
        <h3 style="text-align: center">{{encuesta.nombre}}</h3>
        <div id="container">
        </div>
    </body>
</html>
