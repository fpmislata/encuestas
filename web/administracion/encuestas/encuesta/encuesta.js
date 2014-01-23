app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Encuesta", "jsp");
    }]);

app.controller("EncuestaSearchController", ['$scope', 'crudState', function($scope, crudState) {
        $scope.orders = [
            {
                orderDirection: '',
                fieldName: '',
                label: 'Sin orden'
            },
            {
                orderDirection: 'ASC',
                fieldName: 'nombre',
                label: 'Ascendente'
            },
            {
                orderDirection: 'DESC',
                fieldName: 'nombre',
                label: 'Descendente'
            }
        ];

        $scope.pageSizes = [
            5,
            10,
            20
        ];


        crudState.extendsScopeController($scope, {
            pageSize: 10,
            order: [$scope.orders[0]]
        });

    }]);
app.controller("EncuestaNewEditController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"preguntas"
        });
        $scope.finishOK = function() {
            $location.path("/encuesta/search");
        };
        $scope.finishCancel = function() {
            $location.path("/encuesta/search");
        };
        $scope.buttonDelete = function() {
            $scope.delete();
        }
    }]);

app.controller("EncuestaViewController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"preguntas"
        });
        $scope.finishOK = function() {
            $location.path("/encuesta/search");
        };
        $scope.finishCancel = function() {
            $location.path("/encuesta/search");
        };
        
    }]);
app.controller("EncuestaDeleteController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"preguntas"
        });
        $scope.finishOK = function() {
            $location.path("/encuesta/search");
        };
        $scope.finishCancel = function() {
            $location.path("/encuesta/search");
        };        
    }]);





