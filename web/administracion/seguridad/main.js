
app.config(['$routeProvider',function($routeProvider) {
    $routeProvider.when('/', {
        templateUrl: 'main.jsp',
        controller: 'MainController'
    });
}]);

app.controller('MainController', ['$scope',function($scope) {
    
}]);

