app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Encuesta", "jsp");
    }]);

app.controller("EncuestaSearchController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeSearchController("Encuesta", "idEncuesta", $scope, state);
        $scope.orderBy = ['nombre ASC'];
        $scope.search();
    }]);

app.controller("EncuestaNewController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeNewController("Encuesta", "idEncuesta", $scope, state);
        $scope.getMetadata("Pregunta");
        
    }]);
app.controller("EncuestaEditController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeEditController("Encuesta", "idEncuesta", $scope, state);
        $scope.getMetadata("Pregunta");
        $scope.getChild("preguntas");
        $scope.buttonDelete=function() {
            $scope.delete();
        }        
        
    }]);
app.controller("EncuestaViewController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeViewController("Encuesta", "idEncuesta", $scope, state);
        $scope.getMetadata("Pregunta");
        $scope.getChild("preguntas");
        
    }]);
app.controller("EncuestaDeleteController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeDeleteController("Encuesta", "idEncuesta", $scope, state);
        $scope.getMetadata("Pregunta");
        $scope.getChild("preguntas");
    }]);





