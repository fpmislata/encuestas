"use strict"

app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Item", "jsp");
    }]);

app.controller("ItemNewEditController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"pregunta.encuesta"
        });
        $scope.buttonDelete = function() {
            $scope.delete();
        };         
        
    }]);

app.controller("ItemViewController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"pregunta.encuesta"
        });
         
        
    }]);
app.controller("ItemDeleteController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"pregunta.encuesta"
        });
         
        
    }]);