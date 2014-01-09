app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Pregunta", "jsp");
    }]);

app.controller("PreguntaDetailController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeFromDetailController("Pregunta", "idPregunta", $scope, state);
        $scope.get();
        $scope.getChild("items");
    }]);
