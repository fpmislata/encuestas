var app = angular.module('app', ['ngRoute',"es.logongas.ix3","ui"]);

function TodosDatosController($scope,$http,$location) {
    var idEncuesta=getParameterByName("idEncuesta");

    $scope.resultados=[];

    $http.get(getContextPath()+'/api/Pregunta/?orderBy=idx&encuesta.idEncuesta='+idEncuesta).success(function(data) {
        var preguntas = data;

        for(var i=0;i<preguntas.length;i++) {
            var pregunta=preguntas[i];
            if ($scope.isPreguntaAllowChart(pregunta)) {

                (function(index) {
                    $http.get(getContextPath()+'/api/Encuesta/namedsearch/getResultadoPregunta?pregunta='+pregunta.idPregunta).success(function(resultado) {
                        resultado.index=index*1000;
                        $scope.resultados.push(resultado);
                    }).error(function(data, status, headers, config) {
                        alert("Se ha producido un error al obtener los datos:"+status);
                    })
                })(i);

            } else {
                (function(index) {
                    $http.get(getContextPath()+'/api/Item/?orderBy=idx&pregunta.idPregunta='+pregunta.idPregunta).success(function(data) {
                        var items=data;

                        for(var j=0;j<items.length;j++) {
                            var item=items[j];
                                (function(subIndex) {
                                    $http.get(getContextPath()+'/api/Encuesta/namedsearch/getResultadoItem?item='+item.idItem).success(function(resultado) {
                                        resultado.index=index*1000+subIndex;
                                        $scope.resultados.push(resultado);
                                    }).error(function(data, status, headers, config) {
                                        alert("Se ha producido un error al obtener los datos:"+status);
                                    })
                                })(j)
                        }

                    }).error(function(data, status, headers, config) {
                        alert("Se ha producido un error al obtener los datos:"+status);
                    });
                })(i);
            }
        }
    }).error(function(data, status, headers, config) {
        alert("Se ha producido un error al obtener los datos:"+status);
    });

    $scope.isPreguntaAllowChart=function (pregunta) {
        if (pregunta) {
            if (pregunta==null) {
                return false;
            } else if (pregunta.tipoPregunta=='Radio' || pregunta.tipoPregunta=='Check') {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

}


function getParameterByName(name) {
    //http://james.padolsey.com/javascript/bujs-1-getparameterbyname/
    var match = RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search);
    return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
}

