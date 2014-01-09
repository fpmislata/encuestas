app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Encuesta", "jsp");
    }]);

app.controller("EncuestaSearchController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeFromSearchController("Encuesta", "idEncuesta", $scope, state);
        $scope.orderBy = ['nombre ASC'];
        $scope.search();
    }]);

app.controller("EncuestaDetailController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeFromDetailController("Encuesta", "idEncuesta", $scope, state);
        $scope.getMetadata("Pregunta");
        $scope.get();
        $scope.getChild("preguntas");
        
    }]);



