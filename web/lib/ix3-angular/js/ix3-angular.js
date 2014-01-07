angular.module("es.logongas.ix3", ['restangular']);
angular.module("es.logongas.ix3").directive('ix3Clear', function() {
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

angular.module('es.logongas.ix3').directive('ix3Visibility', function() {
    return {
        restrict: 'A',
        link: function($scope, element, attributes) {
            function mostrar(element) {
                element.css({visibility: "visible"});
            }
            function ocultar(element) {
                element.css({visibility: "hidden"});
            }

            var expression = attributes.ix3Visibility;
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


angular.module('es.logongas.ix3').directive('ix3BusinessMessages', function() {
    return {
        restrict: 'E',
        template:'<div data-ng-show="businessMessages.length > 0"><br /><div class="alert  alert-error"  ><button type="button" class="close" ng-click="businessMessages=[]">&times;</button><strong>Se han producido los siguientes errores:</strong><ul ><li data-ng-repeat="businessMessage in businessMessages"><strong data-ng-hide="businessMessage.propertyName == null">{{businessMessage.propertyName}}:&nbsp;&nbsp;</strong>{{businessMessage.message}}</li></ul></div></div>'
    }
});

angular.module('es.logongas.ix3').provider("crud", ['$routeProvider', function($routeProvider) {

        return {
            addAllRoutes: function(entityName, fileExtension) {

                fileExtension = fileExtension || "html";
                var lowerEntityName = entityName.toLowerCase();
                var camelEntityName = entityName.charAt(0).toLowerCase() + entityName.slice(1);
                var upperCamelEntityName = entityName.charAt(0).toUpperCase() + entityName.slice(1);

                $routeProvider.when('/' + lowerEntityName + '/search', {
                    templateUrl: lowerEntityName + '/search.' + fileExtension,
                    controller: upperCamelEntityName + 'SearchController',
                    resolve: {
                        state: [function() {
                                return {
                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/new', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'DetailController',
                    resolve: {
                        state: [function() {
                                return {
                                    controllerAction: "NEW",
                                    id: null
                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/view/:id', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'DetailController',
                    resolve: {
                        state: ['$route', function($route) {
                                return {
                                    controllerAction: "VIEW",
                                    id: $route.current.params.id
                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/edit/:id', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'DetailController',
                    resolve: {
                        state: ['$route', function($route) {
                                return {
                                    controllerAction: "EDIT",
                                    id: $route.current.params.id
                                };
                            }]
                    }
                });


                $routeProvider.when('/' + lowerEntityName + '/delete/:id', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'DetailController',
                    resolve: {
                        state: ['$route', function($route) {
                                return {
                                    controllerAction: "DELETE",
                                    id: $route.current.params.id
                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/editdelete/:id', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'DetailController',
                    resolve: {
                        state: ['$route', function($route) {
                                return {
                                    controllerAction: "EDIT_DELETE",
                                    id: $route.current.params.id
                                };
                            }]
                    }
                });
            },
            $get: ['daoFactory', '$window', function(daoFactory, $window) {
                    return {
                        extendsScopeFromSearchController: function(entityName, idName, scope) {
                            scope.entityName = entityName;
                            scope.idName = idName;
                            scope.dao = daoFactory.getDAO(entityName, idName);
                            scope.model = {};
                            scope.filter = {};
                            scope.orderBy = [];
                            scope.search = function() {
                                scope.dao.search(scope.filter, scope.orderBy, function(data) {
                                    scope.model = data;
                                }, function(error) {
                                    if (error.status === 400) {
                                        scope.businessMessages = error.data;
                                    } else {
                                        scope.businessMessages = [{
                                                fieldName: null,
                                                message: "Estado HTTP:" + error.status + "\n" + error.data
                                            }];
                                    }
                                });
                            };
                        },
                        extendsScopeFromDetailController: function(entityName, idName, scope, state) {
                            scope.entityName = entityName;
                            scope.idName = idName;
                            scope.dao = daoFactory.getDAO(entityName, idName);
                            scope.id = state.id;
                            scope.controllerAction = state.controllerAction;
                            scope.model = {};
                            scope.get = function() {

                                if (scope.controllerAction === "NEW") {
                                    scope.dao.create(function(data) {
                                        scope.model = data;
                                    }, function(error) {
                                        if (error.status === 400) {
                                            scope.businessMessages = error.data;
                                        } else {
                                            scope.businessMessages = [{
                                                    fieldName: null,
                                                    message: "Estado HTTP:" + error.status + "\n" + error.data
                                                }];
                                        }
                                    });
                                } else {

                                    scope.dao.get(scope.id, function(data) {
                                        scope.model = data;
                                    }, function(error) {
                                        if (error.status === 400) {
                                            scope.businessMessages = error.data;
                                        } else {
                                            scope.businessMessages = [{
                                                    fieldName: null,
                                                    message: "Estado HTTP:" + error.status + "\n" + error.data
                                                }];
                                        }
                                    });
                                }
                            };
                            scope.save = function() {
                                if (scope.controllerAction === "NEW") {
                                    scope.dao.insert(scope.model, function(data) {
                                        $window.history.back();
                                    }, function(error) {
                                        if (error.status === 400) {
                                            scope.businessMessages = error.data;
                                        } else {
                                            scope.businessMessages = [{
                                                    fieldName: null,
                                                    message: "Estado HTTP:" + error.status + "\n" + error.data
                                                }];
                                        }
                                    });
                                } else {

                                    scope.dao.update(scope.id, scope.model, function(data) {
                                        $window.history.back();
                                    }, function(error) {
                                        if (error.status === 400) {
                                            scope.businessMessages = error.data;
                                        } else {
                                            scope.businessMessages = [{
                                                    fieldName: null,
                                                    message: "Estado HTTP:" + error.status + "\n" + error.data
                                                }];
                                        }
                                    });
                                }
                            };
                            scope.delete = function() {
                                scope.dao.delete(scope.id, function(data) {
                                    $window.history.back();
                                }, function(error) {
                                    if (error.status === 400) {
                                        scope.businessMessages = error.data;
                                    } else {
                                        scope.businessMessages = [{
                                                fieldName: null,
                                                message: "Estado HTTP:" + error.status + "\n" + error.data
                                            }];
                                    }
                                });
                            };
                            scope.exit = function() {
                                $window.history.back();
                            };
                        }
                    };
                }]
        };
    }]);


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
            this.Restangular.one(this.entityName, 'create').get().then(fnOK, fnError);
        };
        DAO.prototype.get = function(id, fnOK, fnError) {           
            this.Restangular.one(this.entityName, id).get().then(fnOK, fnError);
        };
        DAO.prototype.insert = function(entity, fnOK, fnError) {            
            this.Restangular.one(this.entityName).customPOST(entity).then(fnOK, fnError);
        };
        DAO.prototype.update = function(id,entity, fnOK, fnError) {            
            this.Restangular.one(this.entityName,id).customPUT(entity).then(fnOK, fnError);
        };
        DAO.prototype.delete = function(id, fnOK, fnError) {            
            this.Restangular.one(this.entityName, id).customDELETE().then(fnOK, fnError);
        };
        DAO.prototype.search = function(filter,orderBy,fnOK, fnError) {
            filter=filter || {};
            orderBy=orderBy || [];
            
            //El orden es otro parametro mas igual.
            filter.orderBy=orderBy.join(",");
            
            this.Restangular.all(this.entityName).getList(filter).then(fnOK, fnError);
        };

        DAO.prototype.metadata = function(fnOK, fnError) {           
            this.Restangular.one(this.entityName, 'metadata').get().then(fnOK, fnError);
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