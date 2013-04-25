<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" ng-app="app">
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
        <script type='text/javascript' src='<%=request.getContextPath()%>/js/highcharts.js'></script>
        <script type='text/javascript' src='todasgraficas.js'></script>

    </head>
    <body ng-controller="TodasGraficasController" id="body" style="background: #FFFFFF" >
        <div id="container">
        </div>
    </body>
</html>
