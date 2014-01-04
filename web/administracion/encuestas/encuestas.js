var app = angular.module('app', ["es.logongas.ix3","ui"]);

app.config(function($routeProvider) {
    $routeProvider.when('/', {
        templateUrl: 'partials/menu_encuesta.jsp',
        controller: 'MenuEncuestaController'
    });

    $routeProvider.when('/encuesta', {
        templateUrl: 'partials/buscar_encuesta.jsp',
        controller: 'BuscarEncuestaController'
    });

    $routeProvider.when('/encuesta/nueva', {
        templateUrl: 'partials/detalle_encuesta.jsp',
        controller: 'NuevaEncuestaController'
    });

    $routeProvider.when('/encuesta/editar/:idEncuesta', {
        templateUrl: 'partials/detalle_encuesta.jsp',
        controller:  'EditarEncuestaController'
    });

    $routeProvider.otherwise({
        redirectTo: '/'
    });
});


function BuscarEncuestaController($scope,$http) {
    $scope.encuestas=null;
    $http.get(getContextPath()+"/api/Encuesta").success(function(data) {
        $scope.encuestas = data;
        $scope.businessMessages=[];
    }).error(function(data, status, headers, config) {
        if (status===400) {
            $scope.businessMessages=data;
        } else {
            $scope.businessMessages=[{
                propertyName:null,
                message:data + ".Estado HTTP:"+status
            }];
        }
    });

}
function NuevaEncuestaController($scope,$http,$routeParams) {
    $scope.idEncuesta=$routeParams.idEncuesta;
    $scope.encuesta=null;
    $http.get(getContextPath()+"/api/Encuesta/create").success(function(data) {
        $scope.encuesta = data;
        $scope.encuesta.fechaInicio=new Date($scope.encuesta.fechaInicio);
        $scope.businessMessages=[];
    }).error(function(data, status, headers, config) {
        if (status===400) {
            $scope.businessMessages=data;
        } else {
            $scope.businessMessages=[{
                propertyName:null,
                message:data + ".Estado HTTP:"+status
            }];
        }
    });
}
function EditarEncuestaController($scope,$http,$routeParams) {
    $scope.idEncuesta=$routeParams.idEncuesta;
    $scope.encuesta=null;
    $http.get(getContextPath()+"/api/Encuesta/"+$scope.idEncuesta).success(function(data) {
        $scope.encuesta = data;
        $scope.businessMessages=[];
    }).error(function(data, status, headers, config) {
        if (status===400) {
            $scope.businessMessages=data;
        } else {
            $scope.businessMessages=[{
                propertyName:null,
                message:data + ".Estado HTTP:"+status
            }];
        }
    });
}