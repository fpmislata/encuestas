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
<script type='text/javascript' src='<%=request.getContextPath()%>/lib/ix3-angular/js/ix3-angular.js'></script>
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
                contentType: 'application/json',
                dataType: "json",
                url:getContextPath()+"/api/session?" + jQuery.param(params) ,
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
                        alert("Falló la petición:"+textStatus+"\n"+errorThrown);
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
                    window.location.href=getContextPath();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert("Ocurrió un error al cerrar la sesión");
                    window.location.href=getContextPath();
                }
            });
        });
    })
</script>
<script>
if (window.location.host.indexOf("localhost",0)!==0) {
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-41754268-1', 'fpmislata.com');
  ga('send', 'pageview');
}
</script>
