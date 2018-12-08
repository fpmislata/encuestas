<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="app">
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %> 
        <script type='text/javascript' src="index.js"></script>
        <script type='text/javascript' src="main.js"></script>
        <script type='text/javascript' src="user/user.js"></script>
        <script type='text/javascript' src="ace/ace.js"></script>       
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>
        <div class="row-fluid" >
            <div class="span2" >
                <div class="well sidebar-nav">
                    <ul class="nav nav-list">
                        <li><a href="#/user/search">Usuarios</a></li>
                        <li><a href="#/group/search">Grupos</a></li>
                        <li><a href="#/secureresourcetype/search">Tipos</a></li>
                        <li><a href="<%=request.getContextPath()%>/monitoring">Monitor Rendimiento</a></li>
                    </ul>
                </div>                
            </div>
            <div class="span10" ng-view>
                
            </div>
        </div>
        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>
