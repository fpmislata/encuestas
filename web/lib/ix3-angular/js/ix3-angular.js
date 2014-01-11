"use strict"

angular.module("es.logongas.ix3", ['restangular']);

/**
 * configuramos que si viene un String con forma de fecha en una petición http la
 * transformamos en un objeto Date. http://aboutcode.net/2013/07/27/json-date-parsing-angularjs.html
 */
angular.module('es.logongas.ix3').config(["$httpProvider", function($httpProvider) {
        function convertDateStringsToDates(input) {
            if (typeof input !== "object") {
                return;
            }

            for (var key in input) {
                if (!input.hasOwnProperty(key)) {
                    continue;
                }
                var value = input[key];
                if ((typeof value === "string") && (value.length === 28)) {
                    var date = moment(value, "YYYY-MM-DDTHH:mm:ss.SSSZZ", true);
                    if (date.isValid()) {
                        input[key] = date.toDate();
                    }
                } else if (typeof (value) === "object") {
                    convertDateStringsToDates(value);
                }
            }
        }

        $httpProvider.defaults.transformResponse.push(function(responseData) {
            convertDateStringsToDates(responseData);
            return responseData;
        });
    }]);

angular.module('es.logongas.ix3').provider("validator", [function() {
        function ValidatorProvider() {
            this.mensajePatterns = {
                required: "No puede estar vacio.",
                email: "No tiene el formato de EMail",
                maxlength: "Debe tener un tamaño menor o igual a {{maxlength}}",
                minlength: "Debe tener un tamaño mayor o igual a {{minlength}}",
                pattern: "No cumple la expresión regular: '{{pattern}}'",
                min: "Debe ser un valor mayor o igual a {{min}}",
                max: "Debe ser un valor menor o igual a {{max}}",
                url: "No tiene el formato de una URL",
                integer: "El valor '{{value}}' no es un número"
            };
            this.getMensajePatterns = function() {
                return this.mensajePatterns;
            };
            this.$get = ['$interpolate', function($interpolate) {
                    return new Validator($interpolate, this.mensajePatterns);
                }];
        }

        function Validator($interpolate, mensajePatterns) {
            var that = this;
            this.mensajePatterns = mensajePatterns;

            function getNormalizeAttributeName(attributeName) {
                var normalizeAttributeName;
                var separator;

                if (attributeName.indexOf("-") >= 0) {
                    separator = "-";
                } else if (attributeName.indexOf(":") >= 0) {
                    separator = ":";
                } else {
                    separator = undefined;
                }

                var parts = attributeName.split(separator);
                normalizeAttributeName = parts[parts.length - 1];

                return normalizeAttributeName;
            }

            function getMessage(inputElement, errorType) {
                var realInputElement = inputElement[0];
                var messagePattern = that.mensajePatterns[errorType];
                if (typeof (messagePattern) === "undefined") {
                    messagePattern = errorType;
                }

                var messageEvaluator = $interpolate(messagePattern);

                var attributes = {
                    value: inputElement.val()
                };

                for (var attributeIndex in realInputElement.attributes) {
                    var attributeName = realInputElement.attributes[attributeIndex].nodeName;
                    if (attributeName) {
                        var value = realInputElement.attributes[attributeIndex].nodeValue;
                        var normalizeAttributeName = getNormalizeAttributeName(attributeName);
                        attributes[normalizeAttributeName] = value;
                    }
                }

                var message = messageEvaluator(attributes);
                return message;
            }

            /**
             * Dado el nombre de un "input" obtiene el label asociado
             * @param {element} inputElement Elemento del que se busca el label
             * @param {string} defaultLabel El label por defecto si no se encuentra ningún otro label
             */
            function getLabel(inputElement, defaultLabel) {
                var label;

                if (inputElement.attr('id')) {
                    var labelElement = $('label[for="' + inputElement.attr('id') + '"]');
                    if (labelElement.length > 0) {
                        label = $(labelElement[0]).text();
                    } else {
                        label = defaultLabel;
                    }
                } else {
                    label = defaultLabel;
                }

                return label;
            }

            this.validateForm = function(angularForm) {
                var businessMessages = [];

                var formElement = $("form[name='" + angularForm.$name + "']");

                for (var propertyName in angularForm) {
                    if (typeof (propertyName) === "string" && propertyName.charAt(0) !== "$") {
                        if (angularForm[propertyName].$error) {
                            for (var errorType in angularForm[propertyName].$error) {
                                if (angularForm[propertyName].$error[errorType] === true) {
                                    var inputElement = $("[name='" + propertyName + "']", formElement);
                                    businessMessages.push({
                                        propertyName: propertyName,
                                        label: getLabel(inputElement, propertyName),
                                        message: getMessage(inputElement, errorType)
                                    });
                                }

                            }
                        }
                    }
                }

                return businessMessages;
            };

        }

        return new ValidatorProvider();

    }]);

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

                $routeProvider.when('/' + lowerEntityName + '/new/:parentProperty?/:parentId?', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'NewController',
                    resolve: {
                        state: ['$route', function($route) {
                                return {
                                    controllerAction: "NEW",
                                    id: null,
                                    parentProperty: $route.current.params.parentProperty,
                                    parentId: $route.current.params.parentId

                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/view/:id/:parentProperty?/:parentId?', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'ViewController',
                    resolve: {
                        state: ['$route', function($route) {
                                return {
                                    controllerAction: "VIEW",
                                    id: $route.current.params.id,
                                    parentProperty: $route.current.params.parentProperty,
                                    parentId: $route.current.params.parentId
                                };
                            }]
                    }
                });

                $routeProvider.when('/' + lowerEntityName + '/edit/:id/:parentProperty?/:parentId?', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'EditController',
                    resolve: {
                        state: ['$route', function($route) {
                                return {
                                    controllerAction: "EDIT",
                                    id: $route.current.params.id,
                                    parentProperty: $route.current.params.parentProperty,
                                    parentId: $route.current.params.parentId
                                };
                            }]
                    }
                });


                $routeProvider.when('/' + lowerEntityName + '/delete/:id/:parentProperty?/:parentId?', {
                    templateUrl: lowerEntityName + '/detail.' + fileExtension,
                    controller: upperCamelEntityName + 'DeleteController',
                    resolve: {
                        state: ['$route', function($route) {
                                return {
                                    controllerAction: "DELETE",
                                    id: $route.current.params.id,
                                    parentProperty: $route.current.params.parentProperty,
                                    parentId: $route.current.params.parentId
                                };
                            }]
                    }
                });

            },
            $get: ['daoFactory', '$window', 'validator', function(daoFactory, $window, validator) {

                    function extendDetailController(entityName, idName, scope, state) {
                        scope.entityName = entityName;
                        scope.idName = idName;
                        scope.dao = daoFactory.getDAO(entityName, idName);
                        scope.id = state.id;
                        scope.parentProperty = state.parentProperty;
                        scope.parentId = state.parentId;
                        scope.controllerAction = state.controllerAction;
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
                            });
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

                        scope.getMetadata(scope.entityName);

                    }


                    return {
                        extendsScopeSearchController: function(entityName, idName, scope) {
                            scope.entityName = entityName;
                            scope.idName = idName;
                            scope.dao = daoFactory.getDAO(entityName, idName);
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
                        extendsScopeNewController: function(entityName, idName, scope, state) {
                            extendDetailController(entityName, idName, scope, state);
                            scope.create();
                            scope.childAction = "view";
                            scope.labelButtonOK = "Añadir";
                            scope.labelButtonCancel = "Cancelar";
                            scope.buttonOK = function() {
                                scope.insert();
                            };
                            scope.buttonCancel = function() {
                                scope.finishCancel();
                            };
                        },
                        extendsScopeEditController: function(entityName, idName, scope, state) {
                            extendDetailController(entityName, idName, scope, state);
                            scope.get();
                            scope.childAction = "edit";
                            scope.labelButtonOK = "Guardar";
                            scope.labelButtonCancel = "Cancelar";
                            scope.buttonOK = function() {
                                scope.update();
                            };
                            scope.buttonCancel = function() {
                                scope.finishCancel();
                            };
                        },
                        extendsScopeViewController: function(entityName, idName, scope, state) {
                            extendDetailController(entityName, idName, scope, state);
                            scope.get();
                            scope.childAction = "view";
                            scope.labelButtonOK = "Salir";
                            scope.labelButtonCancel = "";
                            scope.buttonOK = function() {
                                scope.finishOK();
                            };
                            scope.buttonCancel = function() {

                            };
                        },
                        extendsScopeDeleteController: function(entityName, idName, scope, state) {
                            extendDetailController(entityName, idName, scope, state);
                            scope.get();
                            scope.childAction = "view";
                            scope.labelButtonOK = "Borrar";
                            scope.labelButtonCancel = "Cancelar";
                            scope.buttonOK = function() {
                                scope.delete();
                            };
                            scope.buttonCancel = function() {
                                scope.finishCancel();
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
         * @param {String} entityName Nombre de la entidad 
         * @param {String} idName El nombre de la clave primaria
         * @param {Restangular} Restangular El servicio que realmente hace las peticiones REST
         */
        function DAO(entityName, idName, Restangular) {
            this.entityName = entityName;
            this.idName = idName;
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
        DAO.prototype.update = function(id, entity, fnOK, fnError) {
            this.Restangular.one(this.entityName, id).customPUT(entity).then(fnOK, fnError);
        };
        DAO.prototype.delete = function(id, fnOK, fnError) {
            this.Restangular.one(this.entityName, id).customDELETE().then(fnOK, fnError);
        };
        DAO.prototype.search = function(filter, orderBy, fnOK, fnError) {
            filter = filter || {};
            orderBy = orderBy || [];

            //El orden es otro parametro mas igual.
            filter.orderBy = orderBy.join(",");

            this.Restangular.all(this.entityName).getList(filter).then(fnOK, fnError);
        };

        DAO.prototype.getChild = function(id, child, fnOK, fnError) {
            this.Restangular.one(this.entityName, id).getList(child).then(fnOK, fnError);
        };

        DAO.prototype.metadata = function(fnOK, fnError, entity) {
            entity = entity || this.entityName;
            this.Restangular.one(entity, 'metadata').get().then(fnOK, fnError);
        };

        this.$get = ['Restangular', function(Restangular) {
                return {
                    getDAO: function(entityName, idName) {
                        if (!idName) {
                            idName = "id" + entityName.charAt(0).toUpperCase() + entityName.slice(1);
                        }
                        var dao = new DAO(entityName, idName, Restangular);
                        return dao;

                    }
                };

            }];

    }]);




angular.module("es.logongas.ix3").directive('ix3Clear', function() {
    return {
        restrict: 'A',
        link: function($scope, element, attributes) {
            function setValue(obj, key, newValue) {
                var keys = key.split('.');
                for (var i = 0; i < keys.length - 1; i++) {
                    if (!obj[keys[i]]) {
                        obj[keys[i]] = {};
                    }
                    obj = obj[keys[i]];

                }
                obj[keys[keys.length - 1]] = newValue;
            }
            ;


            var clear = attributes.ix3Clear;
            var clearValue = attributes.ix3ClearValue;
            var ngModel = attributes.ngModel;
            if (clearValue === undefined) {
                clearValue = "null";//Es un String pq luego se hace un "$eval"
            }

            if ($scope.$eval(clear) === true) {
                setValue($scope, ngModel, $scope.$eval(clearValue));
            }

            $scope.$watch(clear, function(newValue, oldValue) {
                if (newValue === true) {
                    setValue($scope, ngModel, $scope.$eval(clearValue));
                }
            });

        }
    };
});

angular.module("es.logongas.ix3").service("dateFormat", ['$locale', function($locale) {
        return {
            /**
             * Obtiene el formato de fecha de Angular correspondiente a un "localizable format"
             * @param {String} angularjsFormat Un formato de fecha de AngularJS
             * @returns {String} Si es un "localizable format" retorna es Spring correspondiente , sino retorna el mismo String
             */
            getAngularFormatFromPredefined: function(angularjsFormat) {
                var newFormat;
                if (angularjsFormat === "fullDate") {
                    newFormat = $locale.DATETIME_FORMATS.fullDate;
                } else if (angularjsFormat === "longDate") {
                    newFormat = $locale.DATETIME_FORMATS.longDate;
                } else if (angularjsFormat === "medium") {
                    newFormat = $locale.DATETIME_FORMATS.medium;
                } else if (angularjsFormat === "mediumDate") {
                    newFormat = $locale.DATETIME_FORMATS.mediumDate;
                } else if (angularjsFormat === "mediumTime") {
                    newFormat = $locale.DATETIME_FORMATS.mediumTime;
                } else if (angularjsFormat === "short") {
                    newFormat = $locale.DATETIME_FORMATS.short;
                } else if (angularjsFormat === "shortDate") {
                    newFormat = $locale.DATETIME_FORMATS.shortDate;
                } else if (angularjsFormat === "shortTime") {
                    newFormat = $locale.DATETIME_FORMATS.shortTime;
                } else {
                    newFormat = angularjsFormat;
                }

                return newFormat;
            },
            /**
             * Tranforma un formato de fecha de AngularJS en un formato de fecha de moment.js
             * @param {String} angularjsFormat El formato de fecha de AngularJS que NO sea un "localizable format"
             * @returns {String} Formato de fecha de moment.js
             */
            getMomentFormatFromAngularJSFormat: function(angularjsFormat) {
                var format = angularjsFormat;
                var inLiteral = false;
                var newFormat = "";
                var c;
                var newc;
                var prevY;
                var nextY;
                for (var i = 0; i < format.length; i++) {
                    c = format.charAt(i);
                    if ((c === "'") && (inLiteral === false)) {
                        newc = "[";
                        inLiteral = true;
                    } else if ((c === "'") && (inLiteral === true)) {
                        newc = "]";
                        inLiteral = false;
                    } else if (inLiteral === true) {
                        newc = c;
                    } else if (c === "d") {
                        newc = "D";
                    } else if (c === "a") {
                        newc = "A";
                    } else if (c === "y") {
                        if (i === 0) {
                            prevY = false;
                        } else {
                            prevY = (format.charAt(i - 1) === "y");
                        }

                        if (i === (format.length - 1)) {
                            nextY = false;
                        } else {
                            nextY = (format.charAt(i + 1) === "y");
                        }

                        if ((prevY === false) && (nextY === false)) {
                            newc = "YYYY";
                        } else {
                            newc = "Y";
                        }


                    } else if (c === "E") {
                        newc = "d";
                    } else if (c === "Z") {
                        newc = "ZZ";
                    } else {
                        newc = c;
                    }

                    newFormat = newFormat + newc;
                }

                return newFormat.replace(/sss/g, "SSS");


            },
            /**
             * Tranforma un formato de fecha de AngularJS en un formato de fecha de jQuery UI Datepicker
             * @param {String} angularjsFormat El formato de fecha de AngularJS que NO sea un "localizable format"
             * @returns {String} Formato de fecha de jQuery UI Datepicker
             */
            getJQueryDatepickerFormatFromAngularJSFormat: function(angularjsFormat) {
                var newFormat = angularjsFormat;
                newFormat = newFormat.replace(/([^M]|^)(M)([^M]|$)/g, function(match, p1, p2, p3, offset, string) {
                    return p1 + "m" + p3;
                });
                newFormat = newFormat.replace(/([^M]|^)(MM)([^M]|$)/g, function(match, p1, p2, p3, offset, string) {
                    return p1 + "mm" + p3;
                });
                newFormat = newFormat.replace(/([^M]|^)(MMM)([^M]|$)/g, function(match, p1, p2, p3, offset, string) {
                    return p1 + "M" + p3;
                });
                newFormat = newFormat.replace(/([^M]|^)(MMMM)([^M]|$)/g, function(match, p1, p2, p3, offset, string) {
                    return p1 + "MM" + p3;
                });
                newFormat = newFormat.replace(/([^y]|^)(yy)([^y]|$)/g, function(match, p1, p2, p3, offset, string) {
                    return p1 + "@#@#" + p3;
                });
                newFormat = newFormat.replace(/([^y]|^)(yyyy)([^y]|$)/g, function(match, p1, p2, p3, offset, string) {
                    return p1 + "yy" + p3;
                });
                newFormat = newFormat.replace(/([^y]|^)(y)([^y]|$)/g, function(match, p1, p2, p3, offset, string) {
                    return p1 + "yy" + p3;
                });
                newFormat = newFormat.replace(/@#@#/g, "y");

                return newFormat;

            },
            getDefaultDateFormat: function() {
                return "mediumDate";
            }
        };


    }]);

angular.module("es.logongas.ix3").directive('ix3Date', ['$locale', 'dateFormat', function($locale, dateFormat) {
        //Poner moment con el mismo idioma que angular 
        moment.lang($locale.id);

        return {
            restrict: 'A',
            require: 'ngModel',
            link: function($scope, element, attributes, ngModelController) {
                if (!attributes.ix3Date) {
                    attributes.ix3Date = dateFormat.getAngularFormatFromPredefined(dateFormat.getDefaultDateFormat());
                } else {
                    attributes.ix3Date = dateFormat.getAngularFormatFromPredefined(attributes.ix3Date);
                }

                //Esto es para hacer que en los mensajes se pueda usar elformato completo en vez de mostrar el predefinido.
                if (typeof (element.attr("ix3-date")) !== "undefined") {
                    element.attr("ix3-date", attributes.ix3Date);
                }
                if (typeof (element.attr("ix3:date")) !== "undefined") {
                    element.attr("ix3:date", attributes.ix3Date);
                }
                var pattern = dateFormat.getMomentFormatFromAngularJSFormat(attributes.ix3Date);
                var undefined;

                ngModelController.$formatters.push(function(value) {
                    if (angular.isDate(value) === true) {
                        ngModelController.$setValidity('date', true);
                        return moment(value).format(pattern);
                    } else if (value === null) {
                        ngModelController.$setValidity('date', true);
                        return "";
                    } else if (typeof (value) === "undefined") {
                        ngModelController.$setValidity('date', true);
                        return "";
                    } else {
                        ngModelController.$setValidity('date', false);
                        return "";
                    }
                });
                ngModelController.$parsers.push(function(value) {
                    if (value) {
                        var fecha = moment(value, pattern, true).zone("00:00");
                        if (fecha.isValid()) {

                            if (fecha.year() < 100) {
                                //cambiamos de 2 digitos a 1900 o 2000
                                var year;
                                var lowYear = fecha.year() + 1900;
                                var upperYear = fecha.year() + 2000;
                                var currentYear = moment().year();

                                if (Math.abs(currentYear - lowYear) <= (Math.abs(currentYear - upperYear))) {
                                    year = lowYear;
                                } else {
                                    year = upperYear;
                                }
                                fecha.year(year);
                                ngModelController.$setValidity('date', true);
                                return fecha.toDate();
                            } else if ((fecha.year() > 100) && (fecha.year() < 1800)) {
                                //No permitimos fechas menores de 1800 por si se ha colado el usuario
                                ngModelController.$setValidity('date', false);
                                return undefined;
                            } else {
                                //En cualquie otro caso el año es correcto.
                                ngModelController.$setValidity('date', true);
                                return fecha.toDate();
                            }

                            ngModelController.$setValidity('date', true);
                            return fecha.toDate();
                        } else {
                            ngModelController.$setValidity('date', false);
                            return undefined;
                        }
                    }
                });
            }
        };
    }]);
angular.module("es.logongas.ix3").config(['validatorProvider', function(validatorProvider) {
        //Incluir el mensaje de la nueva directiva de validacion
        validatorProvider.getMensajePatterns().date = "El formato de la fecha debe ser '{{date}}'";
    }]);


angular.module("es.logongas.ix3").directive('ix3Datepicker', ['dateFormat', function(dateFormat) {
        return {
            restrict: 'A',
            link: function($scope, element, attributes) {
                var format;

                if (!attributes.ix3Date) {
                    format = dateFormat.getJQueryDatepickerFormatFromAngularJSFormat(dateFormat.getAngularFormatFromPredefined(dateFormat.getDefaultDateFormat()));
                } else {
                    format = dateFormat.getJQueryDatepickerFormatFromAngularJSFormat(dateFormat.getAngularFormatFromPredefined(attributes.ix3Date));
                }

                element.datepicker({
                    dateFormat: format,
                    onSelect: function() {
                        $(this).trigger('input');
                    }
                });
            }
        };
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
});


angular.module('es.logongas.ix3').directive('ix3BusinessMessages', function() {
    return {
        restrict: 'E',
        template: '<div data-ng-show="businessMessages.length > 0"><br /><div class="alert  alert-error"  ><button type="button" class="close" ng-click="businessMessages=[]">&times;</button><strong>Se han producido los siguientes errores:</strong><ul ><li data-ng-repeat="businessMessage in businessMessages"><strong data-ng-hide="(businessMessage.propertyName == null) && (businessMessage.label == null)">{{businessMessage.label || businessMessage.propertyName}}:&nbsp;&nbsp;</strong>{{businessMessage.message}}</li></ul></div></div>'
    };
});
