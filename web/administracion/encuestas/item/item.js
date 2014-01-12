app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Item", "jsp");
    }]);

app.controller("ItemNewController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope,{
            expand:"pregunta"
        });
    }]);
app.controller("ItemEditController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope,{
            expand:"pregunta"
        });
        $scope.buttonDelete = function() {
            $scope.delete();
        }
    }]);
app.controller("ItemViewController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope,{
            expand:"pregunta"
        });
    }]);
app.controller("ItemDeleteController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope,{
            expand:"pregunta"
        });
    }]);