var app = angular.module('app', ["es.logongas.ix3.directives","ui"]);

function GraficasController($scope,$http) {
    $scope.seleccion = {
        encuesta:null,
        pregunta:null,
        item:null
    }

    $scope.numRespuestas=null;



    $http.get(getContextPath()+'/api/Encuesta/').success(function(data) {
        $scope.encuestas = data;
    });

    $scope.showDatos=function() {
        $('#resultadoModal').modal()
    }

    $scope.$watch("seleccion.encuesta",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Pregunta/?encuesta.idEncuesta='+$scope.seleccion.encuesta.idEncuesta).success(function(data) {
                $scope.preguntas = data;
            });
            $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getNumRespuestas&parameter0='+$scope.seleccion.encuesta.idEncuesta).success(function(data) {
                $scope.numRespuestas = data;
            });
        } else {
            $scope.numRespuestas =null;
        }

    });

    $scope.$watch("seleccion.pregunta",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Item/?pregunta.idPregunta='+$scope.seleccion.pregunta.idPregunta).success(function(data) {
                $scope.items = data;
            });

            if ($scope.seleccion.pregunta.tipoPregunta=='Radio' || $scope.seleccion.pregunta.tipoPregunta=='Check') {
                $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getResultadoPregunta&parameter0='+$scope.seleccion.pregunta.idPregunta).success(function(resultado) {
                    $scope.resultado=resultado;
                });
            }
        }

    });

    $scope.$watch("seleccion.item",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getResultadoItem&parameter0='+$scope.seleccion.item.idItem).success(function(resultado) {
                $scope.resultado=resultado;
            });
        }
    });

    $scope.$watch("resultado",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $scope.showChart();
        }
    });




    $scope.showChart=function() {
        $('#grafica').highcharts({
            chart: {
                type: 'column'
            },
            credits : {
                enabled : false
            },
            title: {
                text: $scope.resultado.title
            },
            subtitle: {
                text: $scope.resultado.subtitle
            },
            xAxis: {
                categories: $scope.resultado.labels
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
                    borderWidth: 0
                }
            },
            series: [{
                name: $scope.resultado.series[0].name,
                data: $scope.resultado.series[0].data

            }],
            exporting: {
                enabled: true
            }
        });
    }

    $scope.isItemAllowRespuesta=function(item) {
        if ((item.tipoItem=="AreaTexto") || ((item.tipoItem=="Texto"))) {
            return false;
        } else {
            return true;
        }
    }

}


