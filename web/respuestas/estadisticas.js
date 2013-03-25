var app = angular.module('app', ["logongas.directive"]);

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
        }

    });

    $scope.$watch("estadistica.item",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
            $http.get(getContextPath()+'/api/Encuesta/namedsearch?name=getEstadisticaItem&parameter0='+$scope.estadistica.item.idItem).success(function(estadistica) {
                $scope.resultados=estadistica;
            });
        }
    });

    $scope.$watch("estadistica.resultados",function( newValue, oldValue ) {

        if ( newValue === oldValue ) {
            return;
        }
        if ( newValue!==null ) {
           $scope.showChart();
        }
    });


    $scope.showChart=function($scope) {
        $('#estadistica').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: "Encuesta:"+$scope.estadistica.encuesta.nombre
            },
            subtitle: {
                text: "Pregunta"+$scope.estadistica.pregunta.pregunta
            },
            xAxis: {
                categories: $scope.resultados.labels
            },
            yAxis: {
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
                data: $scope.resultados.data

            }]
        });
    }

}


