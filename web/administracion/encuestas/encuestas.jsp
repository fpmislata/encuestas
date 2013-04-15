<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" ng-app="app">
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
        <script type='text/javascript' src='encuestas.js'></script>
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>

        <div ng-view></div>

        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>

