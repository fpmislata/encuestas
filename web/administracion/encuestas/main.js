var app = angular.module('app', ['ngRoute',"es.logongas.ix3","ui"]);

var ix3=ix3 || {};
ix3.ControllerAction= {
    VIEW:0,
    DELETE:1,
    NEW:2,
    EDIT:3,
    EDIT_DELETE:4
};

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



