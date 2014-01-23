"use strict"

angular.module('es.logongas.ix3').provider("crud", ['$routeProvider', function($routeProvider) {

        return {
            addAllRoutes: function(entity, fileExtension) {

                fileExtension = fileExtension || "html";
                var lowerEntityName = entity.toLowerCase();
                var camelEntityName = entity.charAt(0).toLowerCase() + entity.slice(1);
                var upperCamelEntityName = entity.charAt(0).toUpperCase() + entity.slice(1);

                $routeProvider.when('/' + lowerEntityName + '/search', {
                    templateUrl: lowerEntityName + '/search.' + fileExtension,
                    controller: upperCamelEntityName + 'SearchController',
                    resolve: {
                        crudState: ['$route', 'crud', function($route, crud) {
                                return {
                                    extendsScopeController: function(scope, controllerConfig) {
                                        controllerConfig = controllerConfig || {};

                                        controllerConfig.entity = entity;

                                        crud.extendsScopeSearchController(scope, controllerConfig);
                                    }
                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/new/:parentProperty?/:parentId?', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'NewEditController',
                    resolve: {
                        crudState: ['$route', 'crud', function($route, crud) {
                                return {
                                    extendsScopeController: function(scope, controllerConfig) {
                                        controllerConfig = controllerConfig || {};

                                        controllerConfig.entity = entity;
                                        controllerConfig.controllerAction = "NEW";
                                        controllerConfig.id = null;
                                        controllerConfig.parentProperty = $route.current.params.parentProperty;
                                        controllerConfig.parentId = $route.current.params.parentId;

                                        crud.extendsScopeNewEditController(scope, controllerConfig);
                                    }
                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/view/:id/:parentProperty?/:parentId?', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'ViewController',
                    resolve: {
                        crudState: ['$route', 'crud', function($route, crud) {
                                return {
                                    extendsScopeController: function(scope, controllerConfig) {
                                        controllerConfig = controllerConfig || {};

                                        controllerConfig.entity = entity;
                                        controllerConfig.controllerAction = "VIEW";
                                        controllerConfig.id = $route.current.params.id;
                                        controllerConfig.parentProperty = $route.current.params.parentProperty;
                                        controllerConfig.parentId = $route.current.params.parentId;

                                        crud.extendsScopeViewController(scope, controllerConfig);
                                    }
                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/edit/:id/:parentProperty?/:parentId?', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'NewEditController',
                    resolve: {
                        crudState: ['$route', 'crud', function($route, crud) {
                                return {
                                    extendsScopeController: function(scope, controllerConfig) {
                                        controllerConfig = controllerConfig || {};

                                        controllerConfig.entity = entity;
                                        controllerConfig.controllerAction = "EDIT";
                                        controllerConfig.id = $route.current.params.id;
                                        controllerConfig.parentProperty = $route.current.params.parentProperty;
                                        controllerConfig.parentId = $route.current.params.parentId;

                                        crud.extendsScopeNewEditController(scope, controllerConfig);
                                    }
                                };
                            }]
                    }
                });


                $routeProvider.when('/' + lowerEntityName + '/delete/:id/:parentProperty?/:parentId?', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'DeleteController',
                    resolve: {
                        crudState: ['$route', 'crud', function($route, crud) {
                                return {
                                    extendsScopeController: function(scope, controllerConfig) {
                                        controllerConfig = controllerConfig || {};

                                        controllerConfig.entity = entity;
                                        controllerConfig.controllerAction = "DELETE";
                                        controllerConfig.id = $route.current.params.id;
                                        controllerConfig.parentProperty = $route.current.params.parentProperty;
                                        controllerConfig.parentId = $route.current.params.parentId;

                                        crud.extendsScopeDeleteController(scope, controllerConfig);
                                    }
                                };
                            }]
                    }
                });

            },
            $get: ['daoFactory', '$window', 'validator', '$location', function(daoFactory, $window, validator, $location) {

                    function extendDetailController(scope, controllerConfig) {
                        scope.labelButtonOK = "Aceptar";
                        scope.labelButtonCancel = "Cancelar";
                        scope.model = {};
                        scope.models = {};
                        scope.metadata = {};
                        scope.setValue = function(obj, key, newValue) {
                            var keys = key.split('.');
                            for (var i = 0; i < keys.length - 1; i++) {
                                if (!obj[keys[i]]) {
                                    obj[keys[i]] = {};
                                }
                                obj = obj[keys[i]];

                            }
                            obj[keys[keys.length - 1]] = newValue;
                        };

                        scope.getMetadata = function(entity, expand) {
                            daoFactory.getDAO(entity, null).metadata(function(data) {
                                scope.metadata[entity] = data;
                            }, function(error) {
                                if (error.status === 400) {
                                    scope.businessMessages = error.data;
                                } else {
                                    scope.businessMessages = [{
                                            propertyName: null,
                                            message: "Estado HTTP:" + error.status + "\n" + error.data
                                        }];
                                }
                            }, expand);
                        };

                        scope.get = function(fnOK, fnError) {
                            fnOK = fnOK || function() {
                            };
                            fnError = fnError || function() {
                            };

                            scope.dao.get(scope.id, function(data) {
                                scope.model = data;
                                scope.businessMessages =null;
                                fnOK();
                            }, function(error) {
                                if (error.status === 400) {
                                    scope.businessMessages = error.data;
                                } else {
                                    scope.businessMessages = [{
                                            propertyName: null,
                                            message: "Estado HTTP:" + error.status + "\n" + error.data
                                        }];
                                }
                                fnError();
                            }, scope.expand);
                        };
                        scope.create = function(fnOK, fnError) {
                            fnOK = fnOK || function() {
                            };
                            fnError = fnError || function() {
                            };

                            var parent = {};
                            if ((scope.parentProperty) && (scope.parentId)) {
                                parent[scope.parentProperty] = scope.parentId;
                            }

                            scope.dao.create(function(data) {
                                scope.model = data;
                                scope.businessMessages =null;
                                fnOK();
                            }, function(error) {
                                if (error.status === 400) {
                                    scope.businessMessages = error.data;
                                } else {
                                    scope.businessMessages = [{
                                            propertyName: null,
                                            message: "Estado HTTP:" + error.status + "\n" + error.data
                                        }];
                                }
                                fnError();
                            }, scope.expand, parent);
                        };

                        scope.insert = function(fnOK, fnError) {
                            fnOK = fnOK || scope.finishOK || function() {
                            };
                            fnError = fnError || function() {
                            };

                            scope.businessMessages = validator.validateForm(scope.mainForm);
                            if (scope.businessMessages.length === 0) {
                                scope.dao.insert(scope.model, function(data) {
                                    scope.model = data;
                                    scope.businessMessages =null;
                                    scope.controllerAction = "EDIT";
                                    fnOK();
                                }, function(error) {
                                    if (error.status === 400) {
                                        scope.businessMessages = error.data;
                                    } else {
                                        scope.businessMessages = [{
                                                propertyName: null,
                                                message: "Estado HTTP:" + error.status + "\n" + error.data
                                            }];
                                    }
                                    fnError();
                                }, scope.expand);

                            }
                        };
                        scope.update = function(fnOK, fnError) {
                            fnOK = fnOK || scope.finishOK || function() {
                            };
                            fnError = fnError || function() {
                            };

                            scope.businessMessages = validator.validateForm(scope.mainForm);
                            if (scope.businessMessages.length === 0) {
                                scope.dao.update(scope.id, scope.model, function(data) {
                                    scope.model = data;
                                    scope.businessMessages =null;
                                    fnOK();
                                }, function(error) {
                                    if (error.status === 400) {
                                        scope.businessMessages = error.data;
                                    } else {
                                        scope.businessMessages = [{
                                                propertyName: null,
                                                message: "Estado HTTP:" + error.status + "\n" + error.data
                                            }];
                                    }
                                    fnError();
                                }, scope.expand);

                            }
                        };
                        scope.delete = function(fnOK, fnError) {
                            fnOK = fnOK || scope.finishOK || function() {
                            };
                            fnError = fnError || function() {
                            };

                            scope.dao.delete(scope.id, function(data) {
                                scope.businessMessages =null;
                                fnOK();
                            }, function(error) {
                                if (error.status === 400) {
                                    scope.businessMessages = error.data;
                                } else {
                                    scope.businessMessages = [{
                                            propertyName: null,
                                            message: "Estado HTTP:" + error.status + "\n" + error.data
                                        }];
                                }
                                fnError();
                            });
                        };
                        scope.getChild = function(child,fnOK, fnError) {
                            fnOK = fnOK || function() {
                            };
                            fnError = fnError || function() {
                            };        
                            
                            scope.dao.getChild(scope.id, child, function(data) {
                                scope.models[child] = data;
                                scope.businessMessages =null;
                                fnOK();
                            }, function(error) {
                                if (error.status === 400) {
                                    scope.businessMessages = error.data;
                                } else {
                                    scope.businessMessages = [{
                                            propertyName: null,
                                            message: "Estado HTTP:" + error.status + "\n" + error.data
                                        }];
                                }
                                fnError();
                            });
                        };
                        scope.finishOK = function() {
                            $window.history.back();
                        };
                        scope.finishCancel = function() {
                            $window.history.back();
                        };
                        
                        /**
                         * Obtiene el path a navegar para una acción "hija" de un formulario
                         * @param {String} actionName La accion:"new","edit","delete" o "view". Corresponde a las parte del path de las rutas.
                         * @param {String} entity El nombre de la entidad 
                         * @param {Object} pk El valor de la clave primaria
                         * @param {String} parentProperty El nombre de la propiedad padre que se asocia
                         * @param {Object} parentId El valor de la propiedad 'parentProperty'
                         * @returns {String} El Path a navegar. No se incluye la "#".
                         */
                        function getPathChildAction(actionName, entity, pk, parentProperty, parentId) {
                            var path = "/" + entity + "/" + actionName;
                            if (pk) {
                                path = path + "/" + pk;
                            }
                            if ((parentProperty) && (parentId)) {
                                if (typeof(parentId)!=="string") {
                                    throw Error("El tipo del argumento parentId debe ser un String pq es el nombre de una propiedad y no su valor");
                                }
                                
                                path = path + "/" + parentProperty + "/" + scope.$eval(parentId);
                            }
                            return path;
                        }



                        scope.childAction = function(actionName, entity, pk, parentProperty, parentId) {
                            var newPath = getPathChildAction(actionName, entity, pk, parentProperty, parentId);
                            var allow;
                            var businessMessage;

                            switch (scope.controllerAction) {
                                case "NEW":
                                    allow = true;
                                    break;
                                case "EDIT":
                                    allow = true;
                                    break;
                                case "VIEW":
                                    if (actionName === "view") {
                                        allow = true;
                                    } else {
                                        allow = false;
                                        businessMessage = {
                                            propertyName: null,
                                            message: "No es posible modificar datos. Solo se pueden ver"
                                        };
                                    }
                                    break;
                                case "DELETE":
                                    if (actionName === "view") {
                                        allow = true;
                                    } else {
                                        allow = false;
                                        businessMessage = {
                                            propertyName: null,
                                            message: "No es posible modificar datos. Solo se pueden ver en el borrado"
                                        };
                                    }
                                    break;
                                default:
                                    throw Error("scope.controllerAction desconocida:" + scope.controllerAction);
                            }


                            if (allow === true) {
                                switch (scope.controllerAction) {
                                    case "NEW":
                                        scope.insert(function() {
                                            //Tenemos que volver a calcular el valor del path pq al ser un INSERT
                                            //aun no había clave primaria y aqui lo volvemos a calcular
                                            //Por eso la variable 
                                            if (parentProperty) {
                                                if (typeof (parentId) !== "string") {
                                                    throw new Error("El parametro 'parentId' debe ser un string pq tiene el nombre de la PK y no es propio valor");
                                                }
                                            }
                                            newPath = getPathChildAction(actionName, entity, pk, parentProperty, parentId);
                                            $location.path(newPath);
                                        });
                                        break;
                                    case "EDIT":
                                        scope.update(function() {
                                            $location.path(newPath);
                                        });
                                        break;
                                    case "VIEW":
                                        $location.path(newPath);
                                        break;
                                    case "DELETE":
                                        $location.path(newPath);
                                        break;
                                    default:
                                        throw Error("scope.controllerAction desconocida:" + scope.controllerAction);
                                }
                            } else {
                                scope.businessMessages = [businessMessage];
                            }
                        };

                        scope.buttonNewChild = function(entity, pk, parentProperty, parentId) {
                            scope.childAction("new", entity, pk, parentProperty, parentId);
                        };
                        scope.buttonEditChild = function(entity, pk, parentProperty, parentId) {
                            scope.childAction("edit", entity, pk, parentProperty, parentId);
                        };
                        scope.buttonDeleteChild = function(entity, pk, parentProperty, parentId) {
                            scope.childAction("delete", entity, pk, parentProperty, parentId);
                        };
                        scope.buttonViewChild = function(entity, pk, parentProperty, parentId) {
                            scope.childAction("view", entity, pk, parentProperty, parentId);
                        };

                        angular.extend(scope, controllerConfig);
                        scope.dao = daoFactory.getDAO(scope.entity, scope.idName);
                        scope.getMetadata(scope.entity, scope.expand);

                    }


                    return {
                        extendsScopeSearchController: function(scope, controllerConfig) {
                            scope.models = {};
                            scope.filter = {};
                            scope.order = []; //Array con objetos con las propiedades fieldName y orderDirection. La propiedad orderDirection soporta los valores "ASC" y "DESC"
                            scope.pageSize = undefined;
                            scope.pageNumber = 0;
                            scope.totalPages = undefined;
                            scope.idName = undefined; //Por defecto es "id"+entity

                            scope.search = function() {
                                scope.dao.search(scope.filter, scope.order, function(data) {
                                    if (angular.isArray(data)) {
                                        scope.models = data;
                                    } else {
                                        if (scope.pageNumber === data.pageNumber) {
                                            scope.models = data.content;
                                            scope.totalPages = data.totalPages;
                                        }
                                    }
                                }, function(error) {
                                    if (error.status === 400) {
                                        scope.businessMessages = error.data;
                                    } else {
                                        scope.businessMessages = [{
                                                propertyName: null,
                                                message: "Estado HTTP:" + error.status + "\n" + error.data
                                            }];
                                    }
                                }, undefined, scope.pageNumber, scope.pageSize);
                            };
                            scope.buttonSearch = function() {
                                scope.pageNumber = 0;
                                scope.search();
                            };
                            scope.$watch("pageNumber", function() {
                                scope.search();
                            });
                            scope.$watch("pageSize", function() {
                                scope.pageNumber = 0;
                                scope.search();
                            });
                            scope.$watch("order", function() {
                                scope.pageNumber = 0;
                                scope.search();
                            }, true);

                            angular.extend(scope, controllerConfig);
                            scope.dao = daoFactory.getDAO(scope.entity, scope.idName);

                        },
                        extendsScopeNewEditController: function(scope, controllerConfig) {
                            scope.labelButtonOK = "Añadir";
                            scope.labelButtonCancel = "Cancelar";
                            scope.buttonOK = function() {
                                switch (scope.controllerAction) {
                                    case "NEW":
                                        scope.insert();
                                        break;
                                    case "EDIT":
                                        scope.update();
                                        break;
                                    case "VIEW":
                                        throw Error("Este controlador no permite la accion:" + scope.controllerAction);
                                        break;
                                    case "DELETE":
                                        throw Error("Este controlador no permite la accion:" + scope.controllerAction);
                                        break;
                                    default:
                                        throw Error("scope.controllerAction desconocida:" + scope.controllerAction);
                                }

                            };
                            scope.buttonCancel = function() {
                                scope.finishCancel();
                            };
                            extendDetailController(scope, controllerConfig);
                            switch (scope.controllerAction) {
                                case "NEW":
                                    scope.create();
                                    break;
                                case "EDIT":
                                    scope.get();
                                    break;
                                case "VIEW":
                                    throw Error("Este controlador no permite la accion:" + scope.controllerAction);
                                    break;
                                case "DELETE":
                                    throw Error("Este controlador no permite la accion:" + scope.controllerAction);
                                    break;
                                default:
                                    throw Error("scope.controllerAction desconocida:" + scope.controllerAction);
                            }

                        },
                        extendsScopeViewController: function(scope, controllerConfig) {
                            scope.labelButtonOK = "Salir";
                            scope.labelButtonCancel = "";
                            scope.buttonOK = function() {
                                scope.finishOK();
                            };
                            scope.buttonCancel = function() {
                                scope.finishCancel();
                            };
                            extendDetailController(scope, controllerConfig);
                            scope.get();
                        },
                        extendsScopeDeleteController: function(scope, controllerConfig) {
                            scope.labelButtonOK = "Borrar";
                            scope.labelButtonCancel = "Cancelar";
                            scope.buttonOK = function() {
                                scope.delete();
                            };
                            scope.buttonCancel = function() {
                                scope.finishCancel();
                            };
                            extendDetailController(scope, controllerConfig);
                            scope.get();
                        }
                    };
                }]
        };
    }]);

