angular.module('logongas.directives', []).directive('mostrar', function() {

    return function($scope, element, attributes) {
        function mostrar(element) {
            $(element).css({
                visibility:"visible"
            })
        }
        function ocultar(element) {
            $(element).css({
                visibility:"hidden"
            })
        }

        var expression = attributes.mostrar;
        if ($scope.$eval( expression )===true ) {
            mostrar(element);
        } else {
            ocultar(element);
        }

        $scope.$watch(expression,function( newValue, oldValue ) {
            if ( newValue === oldValue ) {
                return;
            }

            if ( newValue===true ) {
                mostrar(element);
            } else {
                ocultar(element);
            }

        });
    }
}).directive('clear', function() {

    return function($scope, element, attributes) {
        function setValue(obj,key,newValue) {
            var keys = key.split('.');
            for(var i = 0; i < keys.length - 1; i++) {
                obj = obj[keys[i]];
                if(obj === undefined) {
                    return;
                }
            }
            if(obj[keys[keys.length - 1]] === undefined) {
                return;
            }
            obj[keys[keys.length - 1]] = newValue;
        }


        var clear = attributes.clear;
        var clearValue=attributes.clearValue;
        var ngModel=attributes.ngModel;
        if (clearValue===undefined) {
            clearValue="null";//Es un String pq luego se hace un "$eval"
        }

        if ($scope.$eval(clear)===true ) {
            setValue($scope,ngModel,$scope.$eval(clearValue));
        }

        $scope.$watch(clear,function( newValue, oldValue ) {

            if ( newValue === oldValue ) {
                return;
            }
            if ( newValue===true ) {
                setValue($scope,ngModel,$scope.$eval(clearValue));
            }

        });

    }
}).directive('optionsDisabled', function($parse) {
    var disableOptions = function(scope, attr, element, data, fnDisableIfTrue) {
        // refresh the disabled options in the select element.
        $("option[value!='?']", element).each(function(i, e) {
            var locals = {};
            locals[attr] = data[i];
            $(this).attr("disabled", fnDisableIfTrue(scope, locals));
        });
    };
    return {
        priority: 0,
        require: 'ngModel',
        link: function(scope, iElement, iAttrs, ctrl) {
            // parse expression and build array of disabled options
            var expElements = iAttrs.optionsDisabled.match(/^\s*(.+)\s+for\s+(.+)\s+in\s+(.+)?\s*/);
            var attrToWatch = expElements[3];
            var fnDisableIfTrue = $parse(expElements[1]);
            scope.$watch(attrToWatch, function(newValue, oldValue) {
                if(newValue)
                    disableOptions(scope, expElements[2], iElement, newValue, fnDisableIfTrue);
            }, true);
            // handle model updates properly
            scope.$watch(iAttrs.ngModel, function(newValue, oldValue) {
                var disOptions = $parse(attrToWatch)(scope);
                if(newValue)
                    disableOptions(scope, expElements[2], iElement, disOptions, fnDisableIfTrue);
            });
        }
    };
});
