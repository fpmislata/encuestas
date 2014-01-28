"use strict";

angular.module('es.logongas.ix3').directive('ix3BusinessMessages', function() {
    return {
        restrict: 'E',
        template: '<div data-ng-show="businessMessages.length > 0"><br /><div class="alert  alert-error"  ><button type="button" class="close" ng-click="businessMessages=[]">&times;</button><strong>Se han producido los siguientes errores:</strong><ul ><li data-ng-repeat="businessMessage in businessMessages"><strong data-ng-hide="(businessMessage.propertyName == null) && (businessMessage.label == null)">{{businessMessage.label || businessMessage.propertyName}}:&nbsp;&nbsp;</strong>{{businessMessage.message}}</li></ul></div></div>'
    };
});
