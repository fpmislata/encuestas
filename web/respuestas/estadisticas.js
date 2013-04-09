var app = angular.module('app', ["logongas.directives"]);

function EstadisticasController($scope,$http) {
    $scope.estadistica = {
        encuesta:null,
        pregunta:null,
        item:null
    }



    $http.get(getContextPath()+'/api/Encuesta/').success(function(data) {
        $scope.encuestas = data;
    });

    $scope.$watch("estadistica.encuesta",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Pregunta/?encuesta.idEncuesta='+$scope.estadistica.encuesta.idEncuesta).success(function(data) {
                $scope.preguntas = data;
            });
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
                    $scope.resultadosPregunta=resultados;
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
                $scope.resultadosItem=resultados;
            });
        }
    });

    $scope.$watch("resultadosPregunta",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $scope.showChartPregunta();
        }
    });

    $scope.$watch("resultadosItem",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $scope.showChartItem();
        }
    });


    $scope.showChartPregunta=function() {
        $('#estadistica').highcharts({
            chart: {
                type: 'column'
            },
            credits : {
                enabled : false
            },
            title: {
                text: "Encuesta:"+$scope.estadistica.encuesta.nombre
            },
            xAxis: {
                categories: $scope.resultadosPregunta.labels
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
                name: $scope.estadistica.pregunta.pregunta,
                data: $scope.resultadosPregunta.series[0].data
            }]
        });
    }


    $scope.showChartItem=function() {
        $('#estadistica').highcharts({
            chart: {
                type: 'column'
            },
            credits : {
                enabled : false
            },
            title: {
                text: "Encuesta:"+$scope.estadistica.encuesta.nombre
            },
            subtitle: {
                text: "Pregunta:"+$scope.estadistica.pregunta.pregunta
            },
            xAxis: {
                categories: $scope.resultadosItem.labels
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
                name: $scope.estadistica.item.nombre,
                data: $scope.resultadosItem.series[0].data

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


