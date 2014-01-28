"use strict";

angular.module('es.logongas.ix3').directive('ix3Input', ['bootstrap', '$compile', function(bootstrap, $compile) {

        /**
         * Obtiene si el objeto values tiene algun valor
         * @param {type} obj El objeto del que se averigua si tiene "values"
         * @returns {Boolean} Retorna 'true' si tiene values
         */
        function hasValues(obj) {
            var has = false;
            for (var property in obj) {
                if (obj.hasOwnProperty(property)) {
                    has = true;
                    break;
                }
            }

            return has;
        }

        function getValidationAttributes(metadata) {
            var validationAttributes;
            
            if (metadata.required===true) {
                validationAttributes=validationAttributes + ' ng-required="true" ';
            }
            if ((metadata.pattern) && (metadata.type==="STRING")) {
                validationAttributes=validationAttributes + ' ng-pattern="' + metadata.pattern + '" ';
            }  
            if ((metadata.minimum) && (metadata.type==="INTEGER")) {
                validationAttributes=validationAttributes + ' min="' + metadata.minimum + '" ';
            }          
            if ((metadata.maximum) && (metadata.type==="INTEGER")) {
                validationAttributes=validationAttributes + ' max="' + metadata.maximum + '" ';
            }          
            if ((metadata.minLength) && (metadata.type==="STRING")) {
                validationAttributes=validationAttributes + ' ng-minlength="' + metadata.minLength + '" ';
            }          
            if ((metadata.maxlength) && (metadata.type==="STRING")) {
                validationAttributes=validationAttributes + ' ng-maxlength="' + metadata.maxLength + '" ';
            }          
         

            return validationAttributes;
        }


        function getHTMLSelect(name, metadata) {
            var cssClassLabelCol;
            var cssClassControlLabel;
            var cssClassDivInputCol;
            if (bootstrap.version >= 3) {
                cssClassLabelCol = "col-sm-2";
                cssClassControlLabel = "control-label";
                cssClassDivInputCol = "col-sm-10";
            } else {
                cssClassLabelCol = "";
                cssClassControlLabel = "control-label";
                cssClassDivInputCol = "controls";
            }

            var attributes=getValidationAttributes(metadata);

            var label=metadata.label.charAt(0).toUpperCase() + metadata.label.slice(1);

            var id = "field." + name + "." + (new Date()).getTime();

            var html = '    <label for="' + id + '" class="' + cssClassLabelCol + '  ' + cssClassControlLabel + '">' + label + '</label>\n' +
                    '    <div class="' + cssClassDivInputCol + '">\n' +
                    '        <select id="' + id + '" ng-model="model.' + name + '" name="' + name + '" ' + attributes + ' ng-options="key as value for (key , value) in metadata.values" >\n' + 
                    '           <option>--- Elige opci&oacute;n ---' +
                    '        </select>\n' +
                    '    </div>\n';
            return html;
        }

        function getHTMLScalar(name, metadata) {
            var cssClassLabelCol;
            var cssClassControlLabel;
            var cssClassDivInputCol;
            if (bootstrap.version >= 3) {
                cssClassLabelCol = "col-sm-2";
                cssClassControlLabel = "control-label";
                cssClassDivInputCol = "col-sm-10";
            } else {
                cssClassLabelCol = "control-label";
                cssClassControlLabel = "";
                cssClassDivInputCol = "controls";
            }

            var attributes;
            switch (metadata.type) {
                case "STRING":
                    attributes = '';
                    break;
                case "INTEGER":
                    attributes = ' ix3-integer ';
                    break;
                case "NUMBER":
                    attributes = ' ix3-number ';
                    break;
                case "DATE":
                    attributes = ' ix3-date ix3-datepicker ';
                    break;
                default:
                    throw Error("El tipo de datos no es valido para un escalar:" + metadata.type);
            }

            attributes=attributes+getValidationAttributes(metadata);

            var id = "field." + name + "." + (new Date()).getTime();
            var label=metadata.label.charAt(0).toUpperCase() + metadata.label.slice(1);
            
            var html = '<label for="' + id + '" class="' + cssClassLabelCol + '  ' + cssClassControlLabel + '">' + label + '</label>\n' +
                    '    <div class="' + cssClassDivInputCol + '">\n' +
                    '        <input type="text" id="' + id + '" ng-model="model.' + name + '" name="' + name + '" ' + attributes + ' ></input>\n' +
                    '    </div>\n';
            return html;
        }

        function getHTMLBoolean(name, metadata) {
            var cssClassDiv;
            if (bootstrap.version >= 3) {
                cssClassDiv = "col-sm-offset-2 col-sm-10";

            } else {
                cssClassDiv = "controls";
            }

            var attributes=getValidationAttributes(metadata);

            var id = "field." + name + "." + (new Date()).getTime();
            var label=metadata.label.charAt(0).toUpperCase() + metadata.label.slice(1);
            
            var html = '<div class="' + cssClassDiv + '">' +
                    '<div class="checkbox">' +
                    '<label style="white-space:nowrap;height:30px"><input type="checkbox" id="' + id + '" ng-model="model.' + name + '" name="' + name + '" ' + attributes + ' >' + label + '</label>' +
                    '</div>' +
                    '</div>';


            return html;
        }

        function getHTMLSearch(name, metadata) {
            var html;



            return html;
        }



        function getHTML(name, metadata) {
            var html;

            if ((hasValues(metadata.values) === true) || (metadata.dependProperties.length > 0) || (metadata.urlValues !== null)) {
                html = getHTMLSelect(name, metadata);
            } else {
                switch (metadata.type) {
                    case "OBJECT":
                        html = getHTMLSearch(name, metadata);
                        break;
                    case "STRING":
                        html = getHTMLScalar(name, metadata);
                        break;
                    case "INTEGER":
                        html = getHTMLScalar(name, metadata);
                        break;
                    case "NUMBER":
                        html = getHTMLScalar(name, metadata);
                        break;
                    case "BOOLEAN":
                        html = getHTMLBoolean(name, metadata);
                        break;
                    case "DATE":
                        html = getHTMLScalar(name, metadata);
                        break;
                    default:
                        throw Error("El tipo de datos no es valido:" + metadata.type);
                }
            }

            return html;
        }

        return {
            restrict: 'E',
            template: '<div  ng-class="{\'form-group\':bootstrap.version===3,\'control-group\':bootstrap.version===2}"></div>',
            replace: true,
            scope: {
                name:"@model"
            },
            link: function($scope, element, attributes) {
                $scope.bootstrap = bootstrap;
                $scope.entity = $scope.$parent.entity;
                $scope.model = {};
                $scope.model[$scope.name] = null;
                var watchProperty = "$parent.metadata." + $scope.entity + ".properties." + $scope.name;
                
                $scope.$watch(watchProperty, function(newValue, oldValue) {
                    if (newValue === oldValue) {
                        return;
                    }
                    if (typeof(newValue)!=="object") {
                        return;
                    }
                    $scope.metadata = newValue;

                    element.html(getHTML($scope.name, $scope.metadata));
                    $compile(element)($scope);
                });

                $scope.$watch("$parent.model." + $scope.name, function(newValue, oldValue) {
                    if (newValue === oldValue) {
                        return;
                    }

                    $scope.model[$scope.name] = newValue;
                });
                $scope.$watch("model." + $scope.name, function(newValue, oldValue) {
                    if (newValue === oldValue) {
                        return;
                    }

                    $scope.$parent.model[$scope.name] = newValue;
                });
                
            }
        };
    }]);
