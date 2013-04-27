var app = angular.module('app', ["es.logongas.ix3.directives","ui"]);

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

    $scope.showDatos=function() {
        $('#resultadoModal').modal()
    }

    $scope.showEstadistica=function() {
        $('#resultadoEstadisticasModal').modal()
    }

    $scope.$watch("seleccion.encuesta",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Pregunta/?encuesta.idEncuesta='+$scope.seleccion.encuesta.idEncuesta).success(function(data) {
                $scope.preguntas = data;
            }).error(function(data, status, headers, config) {
                alert("Se ha producido un error al obtener los datos:"+status);
            });
            $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getNumRespuestas&parameter0='+$scope.seleccion.encuesta.idEncuesta).success(function(data) {
                $scope.numRespuestas = data;
            }).error(function(data, status, headers, config) {
                alert("Se ha producido un error al obtener los datos:"+status);
            });
        } else {
            $scope.preguntas =[];
            $scope.numRespuestas =null;
        }

    });

    $scope.$watch("seleccion.pregunta",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Item/?pregunta.idPregunta='+$scope.seleccion.pregunta.idPregunta).success(function(data) {
                $scope.items = $filter("filter")(data,$scope.isItemAllowChart);
            }).error(function(data, status, headers, config) {
                alert("Se ha producido un error al obtener los datos:"+status);
            });

            if ($scope.isPreguntaAllowChart($scope.seleccion.pregunta)==true) {
                $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getResultadoPregunta&parameter0='+$scope.seleccion.pregunta.idPregunta).success(function(resultado) {
                    $scope.resultado=resultado;
                }).error(function(data, status, headers, config) {
                    alert("Se ha producido un error al obtener los datos:"+status);
                });
            }
        } else {
            $scope.items =[];
        }

    });

    $scope.$watch("seleccion.item",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getResultadoItem&parameter0='+$scope.seleccion.item.idItem).success(function(resultado) {
                $scope.resultado=resultado;
            }).error(function(data, status, headers, config) {
                alert("Se ha producido un error al obtener los datos:"+status);
            });
        }
    });

    $scope.$watch("resultado",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            showChart($("#grafica"),newValue);
        }
    });


    $scope.isItemAllowChart=function (item) {
        if (item) {
            if (item==null) {
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