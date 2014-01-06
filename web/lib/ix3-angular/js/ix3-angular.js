angular.module("es.logongas.ix3", ['restangular']);
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

angular.module("es.logongas.ix3").directive('ix3Date',['$locale',function($locale) {
    //Poner moment con el mismo idioma que angular 
    moment.lang($locale.id);
        
    /**
     * Tranforma un formato de fecha de AngularJS en un formato de fecha de moment.js
     * @param {String} angularjsFormat El formato de fecha de AngularJS
     * @returns {String} Formato de fecha de moment.js
     */
    function getMomentFormatFromAngularJSFormat(angularjsFormat) {
      format=getAngularFormatFromPredefined(angularjsFormat);
      var inLiteral=false;
      var newFormat="";
      var c;
      var newc;
      var prevY;
      var nextY;
      for(var i=0;i<format.length;i++) {
        c=format.charAt(i);
        if ((c==="'") && (inLiteral===false)) {
          newc="[";
          inLiteral=true;
        } else if ((c==="'") && (inLiteral===true)) {
          newc="]";
          inLiteral=false;
        } else if (inLiteral===true) {
          newc=c;
        } else if (c==="d") {
          newc="D";
        } else if (c==="a") {
          newc="A";          
        } else if (c==="y") {
          if (i===0) {
            prevY=false;
          } else {
            prevY=(format.charAt(i-1)==="y");
          }
          
         if (i===(format.length-1)) {
           nextY=false;
         } else {
           nextY=(format.charAt(i+1)==="y");
         }
          
          if ((prevY===false) && (nextY===false)) {
            newc="YYYY";
          } else {
            newc="Y";
          }
          
          
        } else if (c==="E") {
          newc="d";
        } else if (c==="Z") {
          newc="ZZ";
        } else {
          newc=c;
        }
        
        newFormat=newFormat+newc;
      }
      
      return newFormat.replace(/sss/g, "SSS");
      
      
    }    
    
  /**
   * Obtiene el formato de fecha de Angular correspondiente a un "localizable format"
   * @param {String} angularjsFormat Un formato de fecha de AngularJS
   * @returns {String} Si es un "localizable format" retorna es Spring correspondiente , sino retorna el mismo String
   */
  function getAngularFormatFromPredefined(angularjsFormat) {
      var newFormat;
      if (angularjsFormat==="fullDate") {
        newFormat=$locale.DATETIME_FORMATS.fullDate;
      } else if (angularjsFormat==="longDate") {
        newFormat=$locale.DATETIME_FORMATS.longDate;
      } else if (angularjsFormat==="medium") {
        newFormat=$locale.DATETIME_FORMATS.medium;
      } else if (angularjsFormat==="mediumDate") {
        newFormat=$locale.DATETIME_FORMATS.mediumDate;
      } else if (angularjsFormat==="mediumTime") {
        newFormat=$locale.DATETIME_FORMATS.mediumTime;
      } else if (angularjsFormat==="short") {
        newFormat=$locale.DATETIME_FORMATS.short;
      } else if (angularjsFormat==="shortDate") {
        newFormat=$locale.DATETIME_FORMATS.shortDate;
      } else if (angularjsFormat==="shortTime") {
        newFormat=$locale.DATETIME_FORMATS.shortTime;
      } else {
        newFormat=angularjsFormat;
      }
      
      return newFormat;
  }
    
    
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function($scope, element, attributes, ngModelController) {
            var pattern = getMomentFormatFromAngularJSFormat(attributes.ix3Date || "mediumDate");
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
}]);

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


angular.module("es.logongas.ix3").provider("daoFactory", ['RestangularProvider', function(RestangularProvider) {
        this._baseURL;
        this.setBaseURL = function(baseURL) {
            if (!baseURL) {
                throw Error("El argumento baseURL no puede estar vacío");
            }
            if (typeof (baseURL) !== "string") {
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

            if ((typeof (fnOK) === "object") && (typeof (fnError) === "undefined")) {
                var scope = fnOK;
                var realFnOK = function(data) {
                    scope.model = data;
                    scope.businessMessages = [];
                }
                var realFnError = function(data, status, headers, config) {
                    if (status === 400) {
                        scope.businessMessages = data;
                    } else {
                        scope.businessMessages = [{
                                propertyName: null,
                                message: data + ".Estado HTTP:" + status
                            }];
                    }
                };
            } else if ((typeof (fnOK) === "function")) {
                var realFnOK = fnOK;
                var realFnError = fnError;
            } else {
                throw Error("Los parametros deben ser un objeto o una o dos funciones");
            }

            this.Restangular.one(this.entityName, 'create').get().then(realFnOK, realFnError);
        };
        DAO.prototype.get = function(id, fnOK, fnError) {
            if ((typeof (fnOK) === "object") && (typeof (fnError) === "undefined")) {
                var scope = fnOK;
                var realFnOK = function(data) {
                    scope.model = data;
                    scope.businessMessages = [];
                }
                var realFnError = function(data, status, headers, config) {
                    if (status === 400) {
                        scope.businessMessages = data;
                    } else {
                        scope.businessMessages = [{
                                propertyName: null,
                                message: data + ".Estado HTTP:" + status
                            }];
                    }
                };
            } else if ((typeof (fnOK) === "function")) {
                var realFnOK = fnOK;
                var realFnError = fnError;
            } else {
                throw Error("Los parametros deben ser un objeto o una o dos funciones");
            }            
            this.Restangular.one(this.entityName, id).get().then(realFnOK, realFnError);
        };
        DAO.prototype.insert = function(entity, fnOK, fnError) {
            if ((typeof (fnOK) === "object") && (typeof (fnError) === "undefined")) {
                var scope = fnOK;
                var realFnOK = function(data) {
                    scope.model = data;
                    scope.businessMessages = [];
                }
                var realFnError = function(data, status, headers, config) {
                    if (status === 400) {
                        scope.businessMessages = data;
                    } else {
                        scope.businessMessages = [{
                                propertyName: null,
                                message: data + ".Estado HTTP:" + status
                            }];
                    }
                };
            } else if ((typeof (fnOK) === "function")) {
                var realFnOK = fnOK;
                var realFnError = fnError;
            } else {
                throw Error("Los parametros deben ser un objeto o una o dos funciones");
            }            
            this.Restangular.all(this.entityName).customPOST(entity).then(realFnOK, realFnError);
        };
        DAO.prototype.update = function(entity, fnOK, fnError) {
            if ((typeof (fnOK) === "object") && (typeof (fnError) === "undefined")) {
                var scope = fnOK;
                var realFnOK = function(data) {
                    scope.model = data;
                    scope.businessMessages = [];
                }
                var realFnError = function(data, status, headers, config) {
                    if (status === 400) {
                        scope.businessMessages = data;
                    } else {
                        scope.businessMessages = [{
                                propertyName: null,
                                message: data + ".Estado HTTP:" + status
                            }];
                    }
                };
            } else if ((typeof (fnOK) === "function")) {
                var realFnOK = fnOK;
                var realFnError = fnError;
            } else {
                throw Error("Los parametros deben ser un objeto o una o dos funciones");
            }            
            this.Restangular.all(this.entityName).customPUT(entity).then(realFnOK, realFnError);
        };
        DAO.prototype.remove = function(id, fnOK, fnError) {
            if ((typeof (fnOK) === "object") && (typeof (fnError) === "undefined")) {
                var scope = fnOK;
                var realFnOK = function(data) {
                    scope.model = data;
                    scope.businessMessages = [];
                }
                var realFnError = function(data, status, headers, config) {
                    if (status === 400) {
                        scope.businessMessages = data;
                    } else {
                        scope.businessMessages = [{
                                propertyName: null,
                                message: data + ".Estado HTTP:" + status
                            }];
                    }
                };
            } else if ((typeof (fnOK) === "function")) {
                var realFnOK = fnOK;
                var realFnError = fnError;
            } else {
                throw Error("Los parametros deben ser un objeto o una o dos funciones");
            }            
            this.Restangular.all(this.entityName).customDELETE(id).then(realFnOK, realFnError);
        };
        DAO.prototype.search = function(fnOK, fnError) {
            if ((typeof (fnOK) === "object") && (typeof (fnError) === "undefined")) {
                var scope = fnOK;
                var realFnOK = function(data) {
                    scope.model = data;
                    scope.businessMessages = [];
                }
                var realFnError = function(data, status, headers, config) {
                    if (status === 400) {
                        scope.businessMessages = data;
                    } else {
                        scope.businessMessages = [{
                                propertyName: null,
                                message: data + ".Estado HTTP:" + status
                            }];
                    }
                };
            } else if ((typeof (fnOK) === "function")) {
                var realFnOK = fnOK;
                var realFnError = fnError;
            } else {
                throw Error("Los parametros deben ser un objeto o una o dos funciones");
            }            
            this.Restangular.all(this.entityName).getList().then(realFnOK, realFnError);
        };

        this.$get = ['Restangular', function(Restangular) {
                return {
                    cache: {},
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