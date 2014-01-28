"use strict";

app.config(['crudProvider', function(crudProvider) {
        crudProvider.addAllRoutes("Group", "jsp");
    }]);

app.controller("UserSearchController", ['$scope', 'crudState', function($scope, crudState) {
        $scope.ordersby = [
            {
                orderDirection: '',
                fieldName: '',
                label: 'Sin orden'
            },
            {
                orderDirection: 'ASC',
                fieldName: 'name',
                label: 'Ascendente'
            },
            {
                orderDirection: 'DESC',
                fieldName: 'name',
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
app.controller("UserNewEditController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope,{
            expand:"acl,memberOf,groupMembers",
            idName:'idIdentity'
        });
    }]);

app.controller("UserViewController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope,{
            expand:"acl,memberOf,groupMembers",
            idName:'idIdentity'
        });
        
    }]);
app.controller("UserDeleteController", ['$scope', 'crudState', function($scope, crudState) {
        crudState.extendsScopeController($scope,{
            expand:"acl,memberOf,groupMembers",
            idName:'idIdentity'
        });     
    }]);




