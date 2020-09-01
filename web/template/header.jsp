<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico" />
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/lib/bootstrap/css/bootstrap-2.3.1.css">
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/lib/jquery-ui/css/jquery-ui.css">
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/lib/angular-ui/css/angular-ui.css">
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" media="print" href="<%=request.getContextPath()%>/css/style_print.css">
<script type='text/javascript' src="<%=request.getContextPath()%>/lib/jquery/js/jquery-1.9.0.js"></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/lib/jquery-ui/js/jquery-ui.js"></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/lib/jquery-ui/js/jquery.ui.datepicker-es.js"></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/lib/bootstrap/js/bootstrap-2.3.1.js"></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/lib/moment/js/moment-with-langs.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/angularjs/js/angular.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/angularjs/js/angular-locale_es-es.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/angularjs/js/angular-route.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/angular-ui/js/angular-ui.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/lodash/js/lodash.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/restangular/js/restangular.js'></script>
<!-- build:js js/ix3-angular.min.js -->
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/ix3-modules.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/ix3-config.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/services/crud.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/services/daofactory.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/services/dateFormat.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/services/validator.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/directives/ix3businessmessages.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/directives/ix3clear.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/directives/ix3input.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/directives/ix3date.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/directives/ix3pagination.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/directives/ix3visibility.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/directives/jquery-ui/ix3datepicker.js'></script>
<!-- endbuild -->
<script type='text/javascript' src="<%=request.getContextPath()%>/js/widgets.js"></script>
<script type='text/javascript'>
    function getContextPath() {
        return "<%=request.getContextPath()%>";
    }

    function ajaxWait(parent) {
        $(".ajax-wait").show();
        $('.ajax-wait').position({
            "my": "center center",
            "at": "center center",
            "of": parent
        });
    }

    function ajaxHide() {
        $(".ajax-wait").hide();
    }


    $(function() {
        jQuery("#entrar").click(function(event) {
            event.preventDefault();
            $('#loginModal').on('shown', function () {
                $("#inputLogin").focus();
            })
            $('#loginModal').modal();
        });

        jQuery("#login").click(function(event) {
            event.preventDefault();
            var params={
                login:$("#inputLogin").val(),
                password:$("#inputPassword").val()
            }


            ajaxWait($('#loginModal'));
            jQuery.ajax({
                type: 'POST',
                dataType: "json",
                data:jQuery.param(params),
                url:getContextPath()+"/api/session",
                success: function(data) {
                    ajaxHide();
                    window.location.href=getContextPath()+"/administracion/administracion.jsp";
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    ajaxHide();
                    if (jqXHR.status===400) {
                        var businessMessages=jQuery.parseJSON(jqXHR.responseText);
                        for(var i=0;i<businessMessages.length;i++) {
                            var businessMessage=businessMessages[i];
                            if (businessMessage.propertyName===null) {
                                alert(businessMessage.message);
                            } else {
                                alert(businessMessage.propertyName+":"+businessMessage.message);
                            }
                        }
                    } else {
                        alert("Fall� la petici�n:"+textStatus+"\n"+errorThrown);
                    }
                    $("#inputLogin").focus();
                }
            });

        });

        jQuery("#logout").click(function(event) {
            event.preventDefault();
            jQuery.ajax({
                type: 'DELETE',
                url:getContextPath()+"/api/session",
                success: function(data) {
                    window.location.href=getContextPath()+"/";
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert("Ocurri� un error al cerrar la sesi�n");
                    window.location.href=getContextPath()+"/";
                }
            });
        });
    })
</script>
