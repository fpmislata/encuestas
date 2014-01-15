app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Encuesta", "jsp");
    }]);

app.controller("EncuestaSearchController", ['$scope', 'crudState', function($scope, crudState) {
         $scope.directions = [
            {
                orderDirection: 'ASC',
                label: 'Ascendente'
            },
            {
                orderDirection: 'DESC',
                label: 'Descendente'
            }
        ];
        
        $scope.pageSizes=[
           5,
           10,
           20
        ];

        
        crudState.extendsScopeController($scope,{
            pageSize:10,
            order:[{fieldName: 'nombre', orderDirection: $scope.directions[0].orderDirection}]
        });

    }]);
app.controller("EncuestaNewController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.getMetadata("Pregunta");

    }]);
app.controller("EncuestaEditController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope);
        $scope.getMetadata("Pregunta");
        $scope.getChild("preguntas");
        $scope.buttonDelete = function() {
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





