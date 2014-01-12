app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Encuesta", "jsp");
    }]);

app.controller("EncuestaSearchController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.orderBy = ['nombre ASC'];
        $scope.search();
    }]);
app.controller("EncuestaSearchController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        
        $scope.orderBy = ['nombre ASC'];
        $scope.search();
    }]);
app.controller("EncuestaNewController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.getMetadata("Pregunta");
        
    }]);
app.controller("EncuestaEditController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.getMetadata("Pregunta");
        $scope.getChild("preguntas");
        $scope.buttonDelete=function() {
            $scope.delete();
        }        
        
    }]);
app.controller("EncuestaViewController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.getMetadata("Pregunta");
        $scope.getChild("preguntas");
        
    }]);
app.controller("EncuestaDeleteController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.getMetadata("Pregunta");
        $scope.getChild("preguntas");
    }]);





