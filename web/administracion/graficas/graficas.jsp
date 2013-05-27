<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" ng-app="app">
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
        <script type='text/javascript' src='<%=request.getContextPath()%>/js/lib/highcharts/highcharts-3.0.1.js'></script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/js/lib/highcharts/exporting-3.0.1.js'></script>
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
                <label>Pregunta:</label><select ng-model="seleccion.pregunta" ng-options="pregunta as pregunta.pregunta for pregunta in preguntas" ng-disabled="seleccion.encuesta==null" >
                    <option value="">-- Elige Pregunta --</option>
                </select>
            </div>
            <div class="span4">
                <label>Item:</label><select ng-model="seleccion.item" ng-options="item as item.nombre for item in items"  ng-disabled="isPreguntaAllowChart(seleccion.pregunta) || seleccion.pregunta==null" >
                    <option value="">-- Elige Item --</option>
                </select>
            </div>
        </div>
        <div class="row-fluid" >
            <div class="span11">

                <ul class="nav nav-tabs" >
                    <li class="active" ><a data-toggle="tab" name="grafica" href="#tab_grafica">Gr&aacute;fica</a></li>
                    <li                ><a data-toggle="tab" name="datos" href="#tab_datos">Datos</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="tab_grafica" style="height: 400px;overflow: hidden"  >
                        <div id="grafica" style="height: 400px;position: relative;top:0px;left:0px;"  mostrar="resultado!=null" >
                        </div>
                        <div class="alert alert-info" ng-show="(resultado!=null) && (resultado.dibujable==false)" style="position: relative;top:-300px;left:0px;">
                            <h4>{{resultado.series[0].name}}</h4>
                            <p>No se muestra la gr&aacute;fica al ser una pregunta que puede contener gran cantidad de posibles respuestas.</p>
                            <p>Pinche en la pesta&ntilde;a de <strong>Datos</strong> para ver todas las respuestas.</p>
                        </div>

                    </div>
                    <div class="tab-pane" id="tab_datos">
                        <div style="height: 400px;width: 100%;max-width: 800px;" mostrar="resultado!=null" >
                            <table class="table table-bordered table-striped table-condensed">
                                <thead>
                                    <tr>
                                        <th>Valor</th>
                                        <th>N&ordm;&nbsp;respuestas</th>
                                        <th>%&nbsp;Respuestas</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="label in resultado.labels">
                                        <td >{{label}}</td>
                                        <td style="text-align: right">{{resultado.series[0].rawData[$index]}}</td>
                                        <td style="text-align: right">{{resultado.series[0].data[$index] | number:2}}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="font-weight:bold;text-align: right">Total respuestas:&nbsp;&nbsp;{{resultado.series[0].numRespuestas}}&nbsp;&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-bordered  table-condensed" ng-hide="resultado==null || resultado.series[0].estadisticaDescriptiva==null">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">Media muestral</th>
                                        <th style="text-align: center">Desviaci&oacute;n t&iacute;pica muestral</th>
                                        <th style="text-align: center">Media poblacional</th>
                                        <th style="text-align: center">Nivel de confianza</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr >
                                        <td style="text-align: center">{{resultado.series[0].estadisticaDescriptiva.media}}</td>
                                        <td style="text-align: center">{{resultado.series[0].estadisticaDescriptiva.desviacionEstandar}}</td>
                                        <td style="text-align: center">[&nbsp;{{resultado.series[0].inferenciaEstadistica.intervaloConfianzaMedia.inferior}}&nbsp;-&nbsp;{{resultado.series[0].inferenciaEstadistica.intervaloConfianzaMedia.superior}}&nbsp;]</td>
                                        <td style="text-align: center">{{resultado.series[0].inferenciaEstadistica.intervaloConfianzaMedia.nivelConfianza*100}}%</td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table table-bordered table-striped table-condensed"  ng-hide="resultado==null || resultado.series[0].otros==null">
                                <thead>
                                    <tr>
                                        <th colspan="3">Respuestas de Otros</th>
                                    </tr>
                                    <tr>
                                        <th>Valor</th>
                                        <th>N&ordm;&nbsp;respuestas</th>
                                        <th>%&nbsp;Respuestas</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="label in resultado.series[0].otros.labels">
                                        <td >{{label}}</td>
                                        <td style="text-align: right">{{resultado.series[0].otros.series[0].rawData[$index]}}</td>
                                        <td style="text-align: right">{{resultado.series[0].otros.series[0].data[$index] | number:2}}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="font-weight:bold;text-align: right">Total respuestas:&nbsp;&nbsp;{{resultado.series[0].otros.series[0].numRespuestas}}&nbsp;&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span1">
            </div>
        </div>
        <div class="row-fluid" style="padding-top: 10px;">
            <div class="span12">
                <a class="btn" href="todasgraficas.jsp?idEncuesta={{seleccion.encuesta.idEncuesta}}" target="_blank" ng-disabled="seleccion.encuesta==null">Todas las gr&aacute;ficas</a>
                <a class="btn" href="todosdatos.jsp?idEncuesta={{seleccion.encuesta.idEncuesta}}" target="_blank" ng-disabled="seleccion.encuesta==null">Todos los datos</a>
            </div>
        </div>
        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>
