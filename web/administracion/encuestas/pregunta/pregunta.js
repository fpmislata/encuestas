app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Pregunta", "jsp");
    }]);

app.controller("PreguntaNewController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeNewController("Pregunta", "idPregunta", $scope, state);
        $scope.getMetadata("Item");
        
    }]);
app.controller("PreguntaEditController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeEditController("Pregunta", "idPregunta", $scope, state);
        $scope.getMetadata("Item");
        $scope.getChild("items");
        $scope.buttonDelete=function() {
            $scope.delete();
        }
    }]);
app.controller("PreguntaViewController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeViewController("Pregunta", "idPregunta", $scope, state);
        $scope.getMetadata("Item");
        $scope.getChild("items");
        
    }]);
app.controller("PreguntaDeleteController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeDeleteController("Pregunta", "idPregunta", $scope, state);
        $scope.getMetadata("Item");
        $scope.getChild("items");

    }]);


