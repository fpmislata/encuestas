"use strict";

app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Encuesta", "jsp");
    }]);

app.controller("EncuestaSearchController", ['$scope', 'crudState','$http', function($scope, crudState, $http) {
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


        $scope.buttonDeleteDatos=function() {
            
            var mensaje;
            var fechaBorrado;


            if (($scope.model) && ($scope.model.fechaBorrado) ){
                fechaBorrado=$scope.model.fechaBorrado.toISOString();
                mensaje="¿Estas seguro de que deseas borrar todos los datos de las encuestas  hasta la fecha '" + $scope.model.fechaBorrado.toLocaleDateString() + "'?\nNo podrás deshacer esta acción";
            } else {
                mensaje="¿Estas seguro de que deseas borrar todos los datos de las encuestas?\nNo podrás deshacer esta acción";
                fechaBorrado="";
            }
            
            var response = confirm(mensaje);
            if (response === true) {
                $http({
                  method: 'DELETE', 
                  url: getContextPath()+"/api/Encuesta?fechaBorrado=" + fechaBorrado
                }).success(function(data, status, headers, config) {
                    alert("Se han borrado correctamente todos los datos de las encuestas")
                }).error(function(data, status, headers, config) {
                    alert("Ha fallado la petición. Estado HTTP:"+status);
                });
            }
            
        }


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





