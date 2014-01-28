"use strict";

app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("ACE", "jsp");
    }]);


app.controller("ACENewEditController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
    }]);

app.controller("ACEViewController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);

    }]);
app.controller("ACEDeleteController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
    }]);
