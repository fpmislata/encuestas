app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Item", "jsp");
    }]);

app.controller("ItemNewEditController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"pregunta.encuesta"
        });
        $scope.finishOK = function() {
            $location.path("/pregunta/edit/"+$scope.model.pregunta.idPregunta+"/encuesta.idEncuesta/"+$scope.model.pregunta.encuesta.idEncuesta);
        };
        $scope.finishCancel = function() {
            $location.path("/pregunta/edit/"+$scope.model.pregunta.idPregunta+"/encuesta.idEncuesta/"+$scope.model.pregunta.encuesta.idEncuesta);
        };
        $scope.buttonDelete = function() {
            $scope.delete();
        };         
        
    }]);

app.controller("ItemViewController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"pregunta.encuesta"
        });
        $scope.finishOK = function() {
            $location.path("/pregunta/edit/"+$scope.model.pregunta.idPregunta+"/encuesta.idEncuesta/"+$scope.model.pregunta.encuesta.idEncuesta);
        };
        $scope.finishCancel = function() {
            $location.path("/pregunta/edit/"+$scope.model.pregunta.idPregunta+"/encuesta.idEncuesta/"+$scope.model.pregunta.encuesta.idEncuesta);
        };
         
        
    }]);
app.controller("ItemDeleteController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"pregunta.encuesta"
        });
        $scope.finishOK = function() {
            $location.path("/pregunta/edit/"+$scope.model.pregunta.idPregunta+"/encuesta.idEncuesta/"+$scope.model.pregunta.encuesta.idEncuesta);
        };
        $scope.finishCancel = function() {
            $location.path("/pregunta/edit/"+$scope.model.pregunta.idPregunta+"/encuesta.idEncuesta/"+$scope.model.pregunta.encuesta.idEncuesta);
        };
         
        
    }]);