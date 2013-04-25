var app = angular.module('app', ["es.logongas.ix3.directives","ui"]);

function TodasGraficasController($scope,$http,$location) {
    var idEncuesta=getParameterByName("idEncuesta");
    $http.get(getContextPath()+'/api/Pregunta/?encuesta.idEncuesta='+idEncuesta).success(function(data) {
        var preguntas = data;
        for(var i=0;i<preguntas.length;i++) {
            var pregunta=preguntas[i];
            if (isPreguntaAllowChart(pregunta)) {
                $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getResultadoPregunta&parameter0='+pregunta.idPregunta).success(function(resultado) {
                    showChart(createChartElement(),resultado);
                }).error(function(data, status, headers, config) {
                    alert("Se ha producido un error al obtener los datos:"+status);
                });

            } else {

                $http.get(getContextPath()+'/api/Item/?pregunta.idPregunta='+pregunta.idPregunta).success(function(data) {
                    var items=data;
                    for(var j=0;j<items.length;j++) {
                        var item=items[j];
                        if (isItemAllowChart(item)==true) {
                            $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getResultadoItem&parameter0='+item.idItem).success(function(resultado) {
                                showChart(createChartElement(),resultado);
                            }).error(function(data, status, headers, config) {
                               alert("Se ha producido un error al obtener los datos:"+status);
                            });
                        }
                    }

                }).error(function(data, status, headers, config) {
                   alert("Se ha producido un error al obtener los datos:"+status);
                });

            }
        }
    }).error(function(data, status, headers, config) {
        alert("Se ha producido un error al obtener los datos:"+status);
    });

}

var id=0;
function createChartElement() {
    id++;
    var div = $('<div class="row-fluid" ><div class="span12" ><div id="chart' + id + '" style="height: 400px;"></div><br /><br /></div></div>');
    $("#container").append(div);
    var element=$("#chart"+id);
    return element;
}

function getParameterByName(name) {
    //http://james.padolsey.com/javascript/bujs-1-getparameterbyname/
    var match = RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search);
    return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
}

function isItemAllowChart(item) {
    if (item.tipoItem!='AreaTexto') {
        return true;
    } else {
        return false;
    }
}

function isPreguntaAllowChart(pregunta) {
    if (pregunta.tipoPregunta=='Radio' || pregunta.tipoPregunta=='Check') {
        return true;
    } else {
        return false;
    }
}

function showChart(element,resultado) {
    element.highcharts({
        chart: {
            type: 'column'
        },
        credits : {
            enabled : false
        },
        title: {
            text: resultado.title
        },
        subtitle: {
            text: resultado.subtitle
        },
        xAxis: {
            categories: resultado.labels
        },
        yAxis: {
            max:100,
            min: 0,
            title: {
                text: '% de respuestas'
            }
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    color: "#000000",
                    style: {
                        fontWeight: 'bold'
                    },
                    formatter: function() {
                        return this.y +'%';
                    }
                }
            }
        },
        series: [{
            name: resultado.series[0].name,
            data: resultado.series[0].data

        }],
        exporting: {
            enabled: true
        }
    });
}

