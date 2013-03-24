app.directive('mostrar', function() {

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
});

app.directive('clear', function() {

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
});