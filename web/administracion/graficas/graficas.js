var app = angular.module('app', ["es.logongas.ix3.directives","ui"]);

function EstadisticasController($scope,$http) {
    $scope.estadistica = {
        encuesta:null,
        pregunta:null,
        item:null
    }

    $scope.numRespuestas=null;



    $http.get(getContextPath()+'/api/Encuesta/').success(function(data) {
        $scope.encuestas = data;
    });

    $scope.showDatos=function() {
        $('#estadisticasModal').modal()
    }

    $scope.$watch("estadistica.encuesta",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Pregunta/?encuesta.idEncuesta='+$scope.estadistica.encuesta.idEncuesta).success(function(data) {
                $scope.preguntas = data;
            });
            $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getNumRespuestas&parameter0='+$scope.estadistica.encuesta.idEncuesta).success(function(data) {
                $scope.numRespuestas = data;
            });
        } else {
            $scope.numRespuestas =null;
        }

    });

    $scope.$watch("estadistica.pregunta",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Item/?pregunta.idPregunta='+$scope.estadistica.pregunta.idPregunta).success(function(data) {
                $scope.items = data;
            });

            if ($scope.estadistica.pregunta.tipoPregunta=='Radio' || $scope.estadistica.pregunta.tipoPregunta=='Check') {
                $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getEstadisticaPregunta&parameter0='+$scope.estadistica.pregunta.idPregunta).success(function(resultados) {
                    $scope.resultados=resultados;
                });
            }
        }

    });

    $scope.$watch("estadistica.item",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getEstadisticaItem&parameter0='+$scope.estadistica.item.idItem).success(function(resultados) {
                $scope.resultados=resultados;
            });
        }
    });

    $scope.$watch("resultados",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $scope.showChart();
        }
    });




    $scope.showChart=function() {
        $('#estadistica').highcharts({
            chart: {
                type: 'column'
            },
            credits : {
                enabled : false
            },
            title: {
                text: $scope.resultados.title
            },
            subtitle: {
                text: $scope.resultados.subtitle
            },
            xAxis: {
                categories: $scope.resultados.labels
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
                name: $scope.resultados.series[0].name,
                data: $scope.resultados.series[0].data

            }]
        });
    }

    $scope.isItemAllowEstadistica=function(item) {
        if ((item.tipoItem=="AreaTexto") || ((item.tipoItem=="Texto"))) {
            return false;
        } else {
            return true;
        }
    }

}


