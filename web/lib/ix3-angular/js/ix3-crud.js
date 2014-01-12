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
                                        controllerConfig=controllerConfig || {};
                                        
                                        controllerConfig.entity=entity;
                                        
                                        crud.extendsScopeSearchController(scope,controllerConfig);
                                    }                                   
                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/new/:parentProperty?/:parentId?', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'NewController',
                    resolve: {
                        crudState: ['$route', 'crud', function($route, crud) {
                                return {
                                    extendsScopeController: function(scope, controllerConfig) {
                                        controllerConfig=controllerConfig || {};
                                        
                                        controllerConfig.entity=entity;
                                        controllerConfig.controllerAction = "NEW";
                                        controllerConfig.id = null;
                                        controllerConfig.parentProperty = $route.current.params.parentProperty;
                                        controllerConfig.parentId = $route.current.params.parentId;
                                        
                                        crud.extendsScopeNewController(scope,controllerConfig);
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
                                        controllerConfig=controllerConfig || {};
                                        
                                        controllerConfig.entity=entity;
                                        controllerConfig.controllerAction = "VIEW";
                                        controllerConfig.id = $route.current.params.id;
                                        controllerConfig.parentProperty = $route.current.params.parentProperty;
                                        controllerConfig.parentId = $route.current.params.parentId;
                                        
                                        crud.extendsScopeViewController(scope,controllerConfig);
                                    }
                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/edit/:id/:parentProperty?/:parentId?', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'EditController',
                    resolve: {
                        crudState: ['$route', 'crud', function($route, crud) {
                                return {
                                    extendsScopeController: function(scope, controllerConfig) {
                                        controllerConfig=controllerConfig || {};
                                        
                                        controllerConfig.entity=entity;
                                        controllerConfig.controllerAction = "EDIT";
                                        controllerConfig.id = $route.current.params.id;
                                        controllerConfig.parentProperty = $route.current.params.parentProperty;
                                        controllerConfig.parentId = $route.current.params.parentId;
                                        
                                        crud.extendsScopeEditController(scope,controllerConfig);
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
                                        controllerConfig=controllerConfig || {};
                                        
                                        controllerConfig.entity=entity;
                                        controllerConfig.controllerAction = "DELETE";
                                        controllerConfig.id = $route.current.params.id;
                                        controllerConfig.parentProperty = $route.current.params.parentProperty;
                                        controllerConfig.parentId = $route.current.params.parentId;
                                        
                                        crud.extendsScopeDeleteController(scope,controllerConfig);
                                    }
                                };
                            }]
                    }
                });

            },
            $get: ['daoFactory', '$window', 'validator', function(daoFactory, $window, validator) {

                    function extendDetailController(scope,controllerConfig) {
                        angular.extend(scope,controllerConfig)
                        scope.dao = daoFactory.getDAO(scope.entity, scope.idName);
                        scope.labelButtonOK = "Aceptar";
                        scope.labelButtonCancel = "Cancelar";
                        scope.childAction = "edit";
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

                        scope.getMetadata = function(entity) {
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
                            }, entity);
                        };

                        scope.get = function() {
                            scope.dao.get(scope.id, function(data) {
                                scope.model = data;
                                if (scope.parentProperty) {
                                    scope.setValue(scope.model, scope.parentProperty, scope.parentId);
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
                            }, scope.expand);
                        };
                        scope.create = function() {

                            scope.dao.create(function(data) {
                                scope.model = data;
                                if (scope.parentProperty) {
                                    scope.setValue(scope.model, scope.parentProperty, scope.parentId);
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
                            });
                        };
                        scope.insert = function() {
                            scope.businessMessages = validator.validateForm(scope.mainForm);
                            if (scope.businessMessages.length === 0) {
                                scope.dao.insert(scope.model, function(data) {
                                    scope.finishOK();
                                }, function(error) {
                                    if (error.status === 400) {
                                        scope.businessMessages = error.data;
                                    } else {
                                        scope.businessMessages = [{
                                                propertyName: null,
                                                message: "Estado HTTP:" + error.status + "\n" + error.data
                                            }];
                                    }
                                });

                            }
                        };
                        scope.update = function() {
                            scope.businessMessages = validator.validateForm(scope.mainForm);
                            if (scope.businessMessages.length === 0) {
                                scope.dao.update(scope.id, scope.model, function(data) {
                                    scope.finishOK();
                                }, function(error) {
                                    if (error.status === 400) {
                                        scope.businessMessages = error.data;
                                    } else {
                                        scope.businessMessages = [{
                                                propertyName: null,
                                                message: "Estado HTTP:" + error.status + "\n" + error.data
                                            }];
                                    }
                                });

                            }
                        };
                        scope.delete = function() {
                            scope.dao.delete(scope.id, function(data) {
                                scope.finishOK();
                            }, function(error) {
                                if (error.status === 400) {
                                    scope.businessMessages = error.data;
                                } else {
                                    scope.businessMessages = [{
                                            propertyName: null,
                                            message: "Estado HTTP:" + error.status + "\n" + error.data
                                        }];
                                }
                            });
                        };
                        scope.finishOK = function() {
                            $window.history.back();
                        };
                        scope.finishCancel = function() {
                            $window.history.back();
                        };
                        scope.getChild = function(child) {
                            scope.dao.getChild(scope.id, child, function(data) {
                                scope.models[child] = data;
                            }, function(error) {
                                if (error.status === 400) {
                                    scope.businessMessages = error.data;
                                } else {
                                    scope.businessMessages = [{
                                            propertyName: null,
                                            message: "Estado HTTP:" + error.status + "\n" + error.data
                                        }];
                                }
                            });
                        };

                        scope.getMetadata(scope.entity);

                    }


                    return {
                        extendsScopeSearchController: function(scope,controllerConfig) {
                            angular.extend(scope,controllerConfig);
                            scope.dao = daoFactory.getDAO(scope.entity,scope.idName);
                            scope.models = {};
                            scope.filter = {};
                            scope.orderBy = [];
                            scope.search = function() {
                                scope.dao.search(scope.filter, scope.orderBy, function(data) {
                                    scope.models = data;
                                }, function(error) {
                                    if (error.status === 400) {
                                        scope.businessMessages = error.data;
                                    } else {
                                        scope.businessMessages = [{
                                                propertyName: null,
                                                message: "Estado HTTP:" + error.status + "\n" + error.data
                                            }];
                                    }
                                });
                            };
                        },
                        extendsScopeNewController: function(scope,controllerConfig) {
                            extendDetailController(scope,controllerConfig);
                            scope.childAction = "view";
                            scope.labelButtonOK = "Añadir";
                            scope.labelButtonCancel = "Cancelar";
                            scope.buttonOK = function() {
                                scope.insert();
                            };
                            scope.buttonCancel = function() {
                                scope.finishCancel();
                            };
                            scope.create();
                        },
                        extendsScopeEditController: function(scope,controllerConfig) {
                            extendDetailController(scope,controllerConfig);
                            scope.childAction = "edit";
                            scope.labelButtonOK = "Guardar";
                            scope.labelButtonCancel = "Cancelar";
                            scope.buttonOK = function() {
                                scope.update();
                            };
                            scope.buttonCancel = function() {
                                scope.finishCancel();
                            };
                            scope.get();
                        },
                        extendsScopeViewController: function(scope,controllerConfig) {
                            extendDetailController(scope,controllerConfig);
                            scope.childAction = "view";
                            scope.labelButtonOK = "Salir";
                            scope.labelButtonCancel = "";
                            scope.buttonOK = function() {
                                scope.finishOK();
                            };
                            scope.buttonCancel = function() {

                            };
                            scope.get();
                        },
                        extendsScopeDeleteController: function(scope,controllerConfig) {
                            extendDetailController(scope,controllerConfig);
                            scope.childAction = "view";
                            scope.labelButtonOK = "Borrar";
                            scope.labelButtonCancel = "Cancelar";
                            scope.buttonOK = function() {
                                scope.delete();
                            };
                            scope.buttonCancel = function() {
                                scope.finishCancel();
                            };
                            scope.get();
                        }
                    };
                }]
        };
    }]);

