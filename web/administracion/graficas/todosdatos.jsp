<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" ng-app="app">
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
        <script type='text/javascript' src='todosdatos.js'></script>
        <style>
            .tablaforprint {
                page-break-inside: avoid;
            }
        </style>
    </head>
    <body ng-controller="TodosDatosController" id="body" style="background: #FFFFFF;padding:15px;" >
        <h2 style="text-align: center">Encuesta</h2>
        <h3 style="text-align: center">{{resultados[0].title}}</h3>
        <div ng-repeat="resultado in resultados | orderBy:'index'" class="tablaforprint">
                <h5 ng-show="resultado.subtitle!=null">Pregunta:{{resultado.subtitle}}</h5>
                <h5>{{resultado.series[0].name}}</h5>
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
                            <td style="text-align: right">{{$parent.resultado.series[0].rawData[$index]}}</td>
                            <td style="text-align: right">{{$parent.resultado.series[0].data[$index] | number:2}}</td>
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
                    </tbody>
                </table>

        </div>
    </body>
</html>
