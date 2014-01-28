var app = angular.module('app', ['ngRoute','es.logongas.ix3','ui','es.logongas.ix3.datepicker.jquery']);

app.config(['$routeProvider','daoFactoryProvider',function($routeProvider,daoFactoryProvider) {
    $routeProvider.otherwise({
        redirectTo: '/'
    });
    
    daoFactoryProvider.setBaseURL(getContextPath()+"/api");
        
}]);

app.constant("bootstrap",{
    version:2
});