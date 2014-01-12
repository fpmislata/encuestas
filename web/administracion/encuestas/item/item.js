app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Item", "jsp");
    }]);

app.controller("ItemNewController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeNewController("Item", "idItem", $scope, state,"pregunta");
    }]);
app.controller("ItemEditController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeEditController("Item", "idItem", $scope, state,"pregunta");
        $scope.buttonDelete = function() {
            $scope.delete();
        }
    }]);
app.controller("ItemViewController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeViewController("Item", "idItem", $scope, state,"pregunta");
    }]);
app.controller("ItemDeleteController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeDeleteController("Item", "idItem", $scope, state,"pregunta");
    }]);