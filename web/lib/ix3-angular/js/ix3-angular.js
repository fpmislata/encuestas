angular.module("es.logongas.ix3",['restangular']);
angular.module("es.logongas.ix3").directive('clear', function() {
    return {
        restrict: 'A',
        link: function($scope, element, attributes) {
            function setValue(obj, key, newValue) {
                var keys = key.split('.');
                for (var i = 0; i < keys.length - 1; i++) {
                    obj = obj[keys[i]];
                    if (obj === undefined) {
                        return;
                    }
                }
                if (obj[keys[keys.length - 1]] === undefined) {
                    return;
                }
                obj[keys[keys.length - 1]] = newValue;
            }


            var clear = attributes.clear;
            var clearValue = attributes.clearValue;
            var ngModel = attributes.ngModel;
            if (clearValue === undefined) {
                clearValue = "null";//Es un String pq luego se hace un "$eval"
            }

            if ($scope.$eval(clear) === true) {
                setValue($scope, ngModel, $scope.$eval(clearValue));
            }

            $scope.$watch(clear, function(newValue, oldValue) {

                if (newValue === oldValue) {
                    return;
                }
                if (newValue === true) {
                    setValue($scope, ngModel, $scope.$eval(clearValue));
                }

            });

        }
    };
});

angular.module("es.logongas.ix3").directive('date', function() {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function($scope, element, attributes, ngModelController) {
            var pattern = attributes.fecha;
            var undefined;

            ngModelController.$formatters.push(function(value) {
                if (value) {
                    ngModelController.$setValidity('date', true);
                    return moment(value).format(pattern);
                } else {
                    ngModelController.$setValidity('date', false);
                    return value;
                }
            });
            ngModelController.$parsers.push(function(value) {
                if (value) {
                    var fecha = moment(value, pattern);
                    if (fecha.isValid()) {
                        ngModelController.$setValidity('date', true);
                        return fecha.toDate();
                    } else {
                        ngModelController.$setValidity('date', false);
                        return undefined;
                    }
                }
            });
        }
    }
});

angular.module('es.logongas.ix3').directive('visible', function() {
    return {
        restrict: 'A',
        link: function($scope, element, attributes) {
            function mostrar(element) {
                element.css({visibility: "visible"});
            }
            function ocultar(element) {
                element.css({visibility: "hidden"});
            }

            var expression = attributes.visible;
            if ($scope.$eval(expression) === true) {
                mostrar(element);
            } else {
                ocultar(element);
            }

            $scope.$watch(expression, function(newValue, oldValue) {
                if (newValue === oldValue) {
                    return;
                }

                if (newValue === true) {
                    mostrar(element);
                } else {
                    ocultar(element);
                }

            });
        }
    };
})


angular.module("es.logongas.ix3").provider("daoFactory",['RestangularProvider',function(RestangularProvider) {
    this._baseURL;
    this.setBaseURL = function(baseURL) {
        if (!baseURL) {
            throw Error("El argumento baseURL no puede estar vacío");
        }
        if (typeof(baseURL) !== "string") {
            throw Error("El argumento baseURL debe ser un String");
        }

        this._baseURL = baseURL;
        RestangularProvider.setBaseUrl(this._baseURL);  
    };

    /**
     * Esta es la clase DAO verdaderaque genera el Factory
     * @param {type} entityName Nombre de la entidad 
     * @param {type} idName El nombre de la clave primaria
     * @param {type} cacheable Si se cachean las peticiones.
     * @param {type} Restangular El servicio que realmente hace las peticiones REST
     */
    function DAO(entityName, idName, cacheable, Restangular) {
        this.entityName = entityName;
        this.idName = idName;
        this.cacheable = cacheable;
        this.Restangular = Restangular;
    }

    DAO.prototype.create = function(fnOK, fnError) {
        this.Restangular.one(this.entityName, 'create').get().then(fnOK, fnError);
    };
    DAO.prototype.get = function(id, fnOK, fnError) {
        this.Restangular.one(this.entityName, id).get().then(fnOK, fnError);
    };
    DAO.prototype.insert = function(entity, fnOK, fnError) {
        this.Restangular.all(this.entityName).customPOST(entity).then(fnOK, fnError);
    };
    DAO.prototype.update = function(entity, fnOK, fnError) {
         this.Restangular.all(this.entityName).customPUT(entity).then(fnOK, fnError);
    };
    DAO.prototype.remove = function(id, fnOK, fnError) {
        this.Restangular.all(this.entityName).customDELETE(id).then(fnOK, fnError);
    };
    DAO.prototype.findAll = function(fnOK, fnError) {
        this.Restangular.all(this.entityName).getList().then(fnOK, fnError);
    };

    this.$get = ['Restangular', function(Restangular) {
            return {
                cache:{},
                getDAO: function(entityName, idName, cacheable) {
                    
                    var dao = this.cache[entityName];
                    if (!dao) {
                        if (!idName) {
                            idName = "id" + entityName.charAt(0).toUpperCase() + entityName.slice(1);
                        }
                        if (!cacheable) {
                            cacheable = false;
                        }

                        dao = new DAO(entityName, idName, cacheable, Restangular);
                        this.cache[entityName] = dao;
                    }

                    return dao;

                }
            };

        }];

}]);