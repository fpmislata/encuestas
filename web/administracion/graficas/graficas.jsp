<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" ng-app="app">
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
        <script type='text/javascript' src='<%=request.getContextPath()%>/js/highcharts.js'></script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/js/exporting.js'></script>
        <script type='text/javascript' src='graficas.js'></script>

    </head>
    <body ng-controller="GraficasController" >
        <%@ include file="/template/top.jsp" %>

        <div class="row-fluid" >
            <div class="span4" >
                <label>Encuesta:</label>
                <select ng-model="seleccion.encuesta" ng-options="encuesta as encuesta.nombre for encuesta in encuestas" >
                    <option value="">-- Elige Encuesta --</option>
                </select>
                <span ng-hide="seleccion.encuesta==null || numRespuestas==null" class="badge">{{numRespuestas}}</span>
            </div>
            <div class="span4">
                <label>Pregunta:</label><select ng-model="seleccion.pregunta" ng-options="pregunta as pregunta.pregunta for pregunta in preguntas" ng-disabled="seleccion.encuesta==null" clear="seleccion.encuesta==null">
                    <option value="">-- Elige Pregunta --</option>
                </select>
            </div>
            <div class="span4">
                <label>Item:</label><select ng-model="seleccion.item" ng-options="item as item.nombre for item in items" optionsDisabled="item.tipoItem='AreaTexto' for item in items"  ng-disabled="seleccion.pregunta==null || seleccion.pregunta.tipoPregunta=='Radio' || seleccion.pregunta.tipoPregunta=='Check'" clear="seleccion.pregunta==null || seleccion.pregunta.tipoPregunta=='Radio' || seleccion.pregunta.tipoPregunta=='Check'">
                    <option value="">-- Elige Item --</option>
                </select>
            </div>
        </div>
        <div class="row-fluid" >
            <div class="span11">
                <div id="grafica" class="span12" style="height: 400px;"></div>
            </div>
            <div class="span1">
            </div>
        </div>
        <div class="row-fluid" >
            <div class="span3">
                <button class="btn btn-primary" ng-click="showDatos()" ng-disabled="resultado==null">Ver los datos</button>
            </div>
            <div class="span3">
                <button class="btn" ng-click="showEstadistica()" ng-disabled="resultado==null || resultado.series[0].estadisticaDescriptiva==null">Ver estadísticas</button>
            </div>
            <div class="span3">
                <a class="btn" href="todasgraficas.jsp?idEncuesta={{seleccion.encuesta.idEncuesta}}" target=”_blank” ng-disabled="seleccion.encuesta==null">Ver todas las gr&aacute;ficas</a>
            </div>
            <div class="span3">

            </div>
        </div>
        <div id="resultadoModal" class="modal hide fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4>Resultados</h4>
            </div>
            <div class="modal-body">
                <h4>Encuesta:{{resultado.title}}</h4>
                <h5 ng-show="resultado.subtitle!=null">Pregunta:{{resultado.subtitle}}</h5>
                <table class="table table-bordered table-striped table-condensed">
                    <thead>
                        <tr>
                            <th colspan="3">{{resultado.series[0].name}}</th>
                        </tr>
                        <tr>
                            <th>Valor</th>
                            <th>Nº&nbsp;respuestas</th>
                            <th>%&nbsp;Respuestas</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="label in resultado.labels">
                            <td >{{label}}</td>
                            <td style="text-align: right">{{$parent.resultado.series[0].rawData[$index]}}</td>
                            <td style="text-align: right">{{$parent.resultado.series[0].data[$index] | number:2}}</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="font-weight:bold;text-align: right">Total respuestas:&nbsp;&nbsp;{{resultado.series[0].numRespuestas}}&nbsp;&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Cerrar</button>
            </div>
        </div>
        <div id="resultadoEstadisticasModal" class="modal hide fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4>Estadisticas</h4>
            </div>
            <div class="modal-body">
                <h4>Encuesta:{{resultado.title}}</h4>
                <h5 ng-show="resultado.subtitle!=null">Pregunta:{{resultado.subtitle}}</h5>
                <table class="table table-bordered  table-condensed">
                    <thead>
                        <tr>
                            <th colspan="3">{{resultado.series[0].name}}</th>
                        </tr>
                        <tr>
                            <th>Par&aacute;metro</th>
                            <th>Valor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr >
                            <td >Media</td><td style="text-align: right">{{resultado.series[0].estadisticaDescriptiva.media}}</td>
                        </tr>
                        <tr >
                            <td >Desviaci&oacute;n est&aacute;ndar</td><td style="text-align: right">{{resultado.series[0].estadisticaDescriptiva.desviacionEstandar}}</td>
                        </tr>
                        <tr >
                            <td >M&iacute;nimo</td><td style="text-align: right">{{resultado.series[0].estadisticaDescriptiva.minimo}}</td>
                        </tr>
                        <tr >
                            <td >M&aacute;ximo</td><td style="text-align: right">{{resultado.series[0].estadisticaDescriptiva.maximo}}</td>
                        </tr>
                        <tr >
                            <td >N&uacute;mero muestras</td><td style="text-align: right">{{resultado.series[0].estadisticaDescriptiva.numMuestras}}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="alert alert-info">
                    El intervalo de confianza de la media poblacional es <strong>[&nbsp;{{resultado.series[0].inferenciaEstadistica.intervaloConfianzaMedia.inferior}}&nbsp;-&nbsp;{{resultado.series[0].inferenciaEstadistica.intervaloConfianzaMedia.superior}}&nbsp;]</strong> con un nivel de confianza del  {{resultado.series[0].inferenciaEstadistica.intervaloConfianzaMedia.nivelConfianza*100}}%
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Cerrar</button>
            </div>
        </div>
        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>
