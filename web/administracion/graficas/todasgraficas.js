var app = angular.module('app', ['ngRoute',"es.logongas.ix3","ui"]);

function TodasGraficasController($scope,$http,$location) {
    var idEncuesta=getParameterByName("idEncuesta");
    $http.get(getContextPath()+'/api/Encuesta/'+idEncuesta).success(function(data) {
        $scope.encuesta=data;
    });

    $http.get(getContextPath()+'/api/Pregunta/?orderBy=idx&encuesta.idEncuesta='+idEncuesta).success(function(data) {
        var preguntas = data;
        for(var i=0;i<preguntas.length;i++) {
            var pregunta=preguntas[i];

            createRowElement("idPregunta"+pregunta.idPregunta);
        }


        for(var i=0;i<preguntas.length;i++) {
            var pregunta=preguntas[i];
            if ($scope.isPreguntaAllowChart(pregunta)) {

                (function(idPregunta) {
                    $http.get(getContextPath()+'/api/Encuesta/namedsearch/getResultadoPregunta?pregunta='+pregunta.idPregunta).success(function(resultado) {
                        var chartElement=createChartElement("idPregunta"+idPregunta);
                        showChart(chartElement,resultado);
                    }).error(function(data, status, headers, config) {
                        alert("Se ha producido un error al obtener los datos:"+status);
                    })
                })(pregunta.idPregunta);

            } else {
                (function(idPregunta) {
                    $http.get(getContextPath()+'/api/Item/?orderBy=idx&pregunta.idPregunta='+pregunta.idPregunta).success(function(data) {
                        var items=data;
                        for(var j=0;j<items.length;j++) {
                            var item=items[j];
                            if ($scope.isItemAllowChart(item)==true) {
                                createRowElement("idItem"+item.idItem,"idPregunta"+idPregunta);
                            }
                        }

                        for(var j=0;j<items.length;j++) {
                            var item=items[j];
                            if ($scope.isItemAllowChart(item)==true) {

                                (function(idItem) {
                                    $http.get(getContextPath()+'/api/Encuesta/namedsearch/getResultadoItem?item='+item.idItem).success(function(resultado) {
                                        var chartElement=createChartElement("idItem"+idItem);
                                        showChart(chartElement,resultado);
                                    }).error(function(data, status, headers, config) {
                                        alert("Se ha producido un error al obtener los datos:"+status);
                                    })
                                })(item.idItem)
                            }
                        }

                    }).error(function(data, status, headers, config) {
                        alert("Se ha producido un error al obtener los datos:"+status);
                    });
                })(pregunta.idPregunta);
            }
        }
    }).error(function(data, status, headers, config) {
        alert("Se ha producido un error al obtener los datos:"+status);
    });


    $scope.isItemAllowChart=function (item) {
        if (item) {
            if (item==null) {
                return false;
            } else if (item.tipoItem=="Texto") {
                return false;
            } else if (item.tipoItem=="Fecha") {
                return false;
            } else if (item.tipoItem=="AreaTexto") {
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    $scope.isPreguntaAllowChart=function (pregunta) {
        if (pregunta) {
            if (pregunta==null) {
                return false;
            } else if (pregunta.tipoPregunta=='Radio' || pregunta.tipoPregunta=='Check') {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

}

function createRowElement(id,parentId) {
    if (typeof(parentId)==="undefined"){
        parentId="container";
    }

    var div = $('<div class="row-fluid" ><div class="span12" id="' + id + '" ></div></div>');
    $("#"+parentId).append(div);

    var element=$("div",div);
    return element;
}
function createChartElement(parentId) {
    var div = $('<div style="height: 400px;"></div><br /><br />');
    $("#"+parentId).append(div);

    var element=div;
    return element;
}

function getParameterByName(name) {
    //http://james.padolsey.com/javascript/bujs-1-getparameterbyname/
    var match = RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search);
    return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
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

