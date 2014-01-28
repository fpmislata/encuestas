"use strict";

app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Encuesta", "jsp");
    }]);

app.controller("EncuestaSearchController", ['$scope', 'crudState', function($scope, crudState) {
        $scope.ordersby = [
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
            page: {
                pageSize: 10
            },
            orderby: [$scope.ordersby[0]]
        });
        
        $scope.search();
        
    }]);
app.controller("EncuestaNewEditController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"preguntas"
        });
        $scope.buttonDelete = function() {
            $scope.delete();
        };
    }]);

app.controller("EncuestaViewController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"preguntas"
        });
        
    }]);
app.controller("EncuestaDeleteController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"preguntas"
        });     
    }]);





