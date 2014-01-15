
app.config(['$routeProvider',function($routeProvider) {
    $routeProvider.when('/', {
        templateUrl: 'main.jsp',
        controller: 'MainController'
    });
}]);

function MainController($scope) {
    
}



