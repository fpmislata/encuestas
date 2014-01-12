app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Pregunta", "jsp");
    }]);

app.controller("PreguntaNewController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.getMetadata("Item");
        
    }]);
app.controller("PreguntaEditController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.getMetadata("Item");
        $scope.getChild("items");
        $scope.buttonDelete=function() {
            $scope.delete();
        }
    }]);
app.controller("PreguntaViewController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.getMetadata("Item");
        $scope.getChild("items");
        
    }]);
app.controller("PreguntaDeleteController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.getMetadata("Item");
        $scope.getChild("items");

    }]);


