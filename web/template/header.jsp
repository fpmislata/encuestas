<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico" />
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/css/lib/bootstrap/bootstrap-2.3.1.css">
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/css/lib/jquery/default/jquery-ui-1.9.2.css">
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/css/lib/angular/angular-ui-0.4.0.css">
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/css/style.css">
<script type='text/javascript' src="<%=request.getContextPath()%>/js/lib/jquery/jquery-1.9.0.js"></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/js/lib/jquery/jquery-ui-1.9.2.js"></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/js/lib/bootstrap/bootstrap-2.3.1.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/lib/angular/angular-1.0.5.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/lib/angular/angular-locale_es-es-1.0.5.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/lib/angular/angular-ui-0.4.0.js'></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/js/widgets.js"></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/js/angular-directives.js"></script>
<script type='text/javascript'>
    function getContextPath() {
        return "<%=request.getContextPath()%>";
    }

    function showLoginWindow() {
        $('#loginModal').modal()
    }

    function login() {
        var params={
            login:$("#inputLogin").val(),
            password:$("#inputPassword").val()
        }

        jQuery.ajax({
            type: 'POST',
            contentType: 'application/json',
            dataType: "json",
            url:getContextPath()+"/api/session?" + jQuery.param(params) ,
            success: function(data) {
                window.location.href=getContextPath()+"/administracion/administracion.jsp";
            },
            error: function(jqXHR, textStatus, errorThrown) {
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
            }
        });

    }

    function logout() {
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
    }

</script>

