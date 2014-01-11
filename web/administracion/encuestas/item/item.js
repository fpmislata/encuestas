app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Item", "jsp");
    }]);

app.controller("ItemNewController", ['$scope', 'crud', 'state', 'daoFactory', function($scope, crud, state, daoFactory) {
        $scope.$watch("model.pregunta", function(newValue, oldValue) {
            if (newValue === oldValue) {
                return;
            }

            $scope.daoPregunta.get($scope.model.pregunta.idPregunta, function(data) {
                $scope.model.pregunta = data;
            }, function(error) {
                if (error.status === 400) {
                    $scope.businessMessages = error.data;
                } else {
                    $scope.businessMessages = [{
                            propertyName: null,
                            message: "Estado HTTP:" + error.status + "\n" + error.data
                        }];
                }
            });

        });

        crud.extendsScopeNewController("Item", "idItem", $scope, state);
        $scope.daoPregunta = daoFactory.getDAO("Pregunta", "idPregunta");



    }]);
app.controller("ItemEditController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeEditController("Item", "idItem", $scope, state);
        $scope.buttonDelete = function() {
            $scope.delete();
        }
    }]);
app.controller("ItemViewController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeViewController("Item", "idItem", $scope, state);

    }]);
app.controller("ItemDeleteController", ['$scope', 'crud', 'state', function($scope, crud, state) {
        crud.extendsScopeDeleteController("Item", "idItem", $scope, state);

    }]);