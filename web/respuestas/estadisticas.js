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


}

$(function() {
    var ctx = $("#estadistica").get(0).getContext("2d");
    var options={
	scaleOverride : true,

	//Number - The number of steps in a hard coded scale
	scaleSteps : 11,
	//Number - The value jump in the hard coded scale
	scaleStepWidth : 10,
	//Number - The scale starting value
	scaleStartValue : 0
    }
    var data = {
        labels : ["January","February","March","April","May","June","July"],
datasets : [
		{
			fillColor : "rgba(220,220,220,0.5)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
			data : [65,59,90,81,56,55,40]
		},
		{
			fillColor : "rgba(151,187,205,0.5)",
			strokeColor : "rgba(151,187,205,1)",
			pointColor : "rgba(151,187,205,1)",
			pointStrokeColor : "#fff",
			data : [28,48,40,19,96,27,100]
		}
	]
    }
    new Chart(ctx).Bar(data,options);
})
