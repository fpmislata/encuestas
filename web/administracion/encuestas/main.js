var app = angular.module('app', ['ngRoute',"es.logongas.ix3","ui"]);

app.config(function($routeProvider,daoFactoryProvider) {
    $routeProvider.when('/', {
        templateUrl: 'main.jsp',
        controller: 'MainController'
    });

    $routeProvider.otherwise({
        redirectTo: '/'
    });
    
    daoFactoryProvider.setBaseURL(getContextPath()+"/api");
    
});

function MainController($scope) {
    
}



