var app = angular.module('app', ["es.logongas.ix3","ui"]);

function GraficasController($scope,$http,$filter) {
    $scope.seleccion = {
        encuesta:null,
        pregunta:null,
        item:null
    }

    $scope.numRespuestas=null;



    $http.get(getContextPath()+'/api/Encuesta/').success(function(encuestas) {
        $scope.encuestas = encuestas;
    });

    $scope.$watch("seleccion.encuesta",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $scope.seleccion.pregunta=null;
            $http.get(getContextPath()+'/api/Pregunta/?orderBy=idx&encuesta.idEncuesta='+$scope.seleccion.encuesta.idEncuesta).success(function(data) {
                $scope.preguntas = data;
            }).error(function(data, status, headers, config) {
                alert("Se ha producido un error al obtener los datos:"+status);
            });
            $http.get(getContextPath()+'/api/Encuesta/namedsearch/getNumRespuestas?encuesta='+$scope.seleccion.encuesta.idEncuesta).success(function(data) {
                $scope.numRespuestas = data;
            }).error(function(data, status, headers, config) {
                alert("Se ha producido un error al obtener los datos:"+status);
            });
        } else {
            $scope.seleccion.pregunta=null;
            $scope.preguntas =[];
            $scope.numRespuestas =null;
            $scope.resultado=null;
        }

    });

    $scope.$watch("seleccion.pregunta",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $scope.seleccion.item=null;
            $http.get(getContextPath()+'/api/Item/?orderBy=idx&pregunta.idPregunta='+$scope.seleccion.pregunta.idPregunta).success(function(data) {
                $scope.items = data;
                //Si solo hay un Item lo seleccionamos por defecto
                if ($scope.items.length==1) {
                    $scope.seleccion.item=$scope.items[0];
                }
            }).error(function(data, status, headers, config) {
                alert("Se ha producido un error al obtener los datos:"+status);
            });

            if ($scope.isPreguntaAllowChart($scope.seleccion.pregunta)==true) {
                $http.get(getContextPath()+'/api/Encuesta/namedsearch/getResultadoPregunta?pregunta='+$scope.seleccion.pregunta.idPregunta).success(function(resultado) {
                    $scope.resultado=resultado;
                }).error(function(data, status, headers, config) {
                    alert("Se ha producido un error al obtener los datos:"+status);
                });
            } else {
                $scope.resultado=null;
            }
        } else {
            $scope.seleccion.item=null;
            $scope.items =[];
            $scope.resultado=null;
        }

    });

    $scope.$watch("seleccion.item",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Encuesta/namedsearch/getResultadoItem?item='+$scope.seleccion.item.idItem).success(function(resultado) {
                $scope.resultado=resultado;
            }).error(function(data, status, headers, config) {
                alert("Se ha producido un error al obtener los datos:"+status);
            });
        } else {
            $scope.resultado=null;
        }
    });

    $scope.$watch("resultado",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }

        showChart($("#grafica"),newValue);

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

    $scope.viewAllGraphics=function() {
        var url="todasgraficas.jsp?idEncuesta=" + $scope.seleccion.encuesta.idEncuesta;
        window.open(url);
    }

    $scope.viewAllData=function() {
        var url="todosdatos.jsp?idEncuesta=" + $scope.seleccion.encuesta.idEncuesta;
        window.open(url);
    }
    //Evento al pinchar en el tab.
    $('a[data-toggle="tab"]').on('shown', function (e) {
        if ($(e.target).attr('name')==="grafica") {
            //Si mostramos la gráfica hay que volver a recalcular todo pq sino el ancho no sale bien.
            if ($scope.resultado!=null) {
                showChart($("#grafica"),$scope.resultado);
            }
        }
    })


}


function showChart(element,resultado) {
    if (element.highcharts()) {
        element.highcharts().destroy();
    }
    if ( (resultado==null) || (resultado.dibujable==false) ) {
        return;
    }

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
