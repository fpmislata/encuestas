app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Pregunta", "jsp");
    }]);

app.controller("PreguntaNewEditController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"encuesta,items"
        });
        $scope.finishOK = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
        $scope.finishCancel = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
        $scope.buttonDelete=function() {
            $scope.delete();
        }        
    }]);

app.controller("PreguntaViewController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"encuesta,items"
        });
        $scope.finishOK = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
        $scope.finishCancel = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
         
    }]);
app.controller("PreguntaDeleteController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"encuesta,items"
        });
        $scope.finishOK = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
        $scope.finishCancel = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
 
    }]);


