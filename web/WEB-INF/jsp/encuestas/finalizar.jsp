<%@page import="java.net.URI"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
URI backURI=(URI)request.getAttribute("backURI");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>

        <div class="row-fluid" >
            <div class="span12"><img src="img/icons/check.png" alt="grafica" class="center" ></div>
        </div>
        <div class="row-fluid" style="margin-top: 1em;">
            <div class="offset2 span8 main-text" style="text-align: center">Gr&agrave;cies per ajudar</div>
        </div>
        <div class="row-fluid">
            <div class="offset2 span8 main-text" style="text-align: center">a millorar l'educaci&oacute</div>
        </div>

        <div class="row-fluid" style="margin-top: 2em;">
            <div class="span12" style="text-align: center" >
                <a href="<%=backURI.toASCIIString() %> " class="btn btn-large btn-primary ">Tornar </a>
            </div>
            <div class="span1" >
            </div>
        </div>

        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>