app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Pregunta", "jsp");
    }]);

app.controller("PreguntaNewController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"encuesta"
        });
        $scope.getMetadata("Item");
        $scope.finishOK = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
        $scope.finishCancel = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
        
    }]);
app.controller("PreguntaEditController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"encuesta"
        });
        $scope.getMetadata("Item");
        $scope.getChild("items");
        $scope.buttonDelete=function() {
            $scope.delete();
        }
        $scope.finishOK = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
        $scope.finishCancel = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
         
    }]);
app.controller("PreguntaViewController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"encuesta"
        });
        $scope.getMetadata("Item");
        $scope.getChild("items");
        $scope.finishOK = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
        $scope.finishCancel = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
         
    }]);
app.controller("PreguntaDeleteController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"encuesta"
        });
        $scope.getMetadata("Item");
        $scope.getChild("items");
        $scope.finishOK = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
        $scope.finishCancel = function() {
            $location.path("/encuesta/edit/"+$scope.model.encuesta.idEncuesta);
        };
 
    }]);


