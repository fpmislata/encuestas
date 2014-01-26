"use strict"

app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Pregunta", "jsp");
    }]);

app.controller("PreguntaNewEditController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"encuesta,items"
        });
        $scope.buttonDelete=function() {
            $scope.delete();
        }        
    }]);

app.controller("PreguntaViewController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"encuesta,items"
        });
         
    }]);
app.controller("PreguntaDeleteController", ['$scope', 'crudState','$location', function($scope, crudState,$location) {
        crudState.extendsScopeController($scope,{
            expand:"encuesta,items"
        });
 
    }]);


