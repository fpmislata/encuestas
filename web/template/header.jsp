<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/css/default/jquery-ui.css">
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/css/style.css">
<script type='text/javascript' src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/angular.js'></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/js/widgets.js"></script>
<script type='text/javascript'>
    function getContextPath() {
        return "<%=request.getContextPath()%>";
    }

    function showLoginWindow() {
        $('#loginModal').modal()
    }

    function login() {
        alert("El usuario/contraseña no son válidos");
    }

</script>

