<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" ng-app="app">
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
        <script type='text/javascript' src='<%=request.getContextPath() %>/js/Chart.js'></script>
        <script type='text/javascript' src='estadisticas.js'></script>
        <script type='text/javascript' src='<%=request.getContextPath() %>/js/angular-directives.js'></script>
    </head>
    <body ng-controller="EstadisticasController" >
        <%@ include file="/template/top.jsp" %>

        <div class="row-fluid" >
            <div class="span4">
                <label>Encuesta:</label><select ng-model="estadistica.encuesta" ng-options="encuesta as encuesta.nombre for encuesta in encuestas" >
                    <option value="">-- Elige Encuesta --</option>
                </select>
            </div>
            <div class="span4">
                <label>Pregunta:</label><select ng-model="estadistica.pregunta" ng-options="pregunta as pregunta.pregunta for pregunta in preguntas" ng-disabled="estadistica.encuesta==null" clear="estadistica.encuesta==null">
                    <option value="">-- Elige Pregunta --</option>
                </select>
            </div>
            <div class="span4">
                <label>Item:</label><select ng-model="estadistica.item" ng-options="item as item.nombre for item in items" ng-disabled="estadistica.pregunta==null || estadistica.pregunta.tipoPregunta=='Radio'" clear="estadistica.pregunta==null || estadistica.pregunta.tipoPregunta=='Radio'">
                    <option value="">-- Elige Item --</option>
                </select>
            </div>
        </div>
        <div class="row-fluid" >
            <div class="span12">
                <canvas id="estadistica"  width="950px" height="600px" ></canvas>
            </div>
        </div>
        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>
