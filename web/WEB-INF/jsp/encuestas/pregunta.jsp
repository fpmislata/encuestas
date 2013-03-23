<%@page import="es.logongas.encuestas.presentacion.widget.PreguntaWidget"%>
<%@page import="es.logongas.encuestas.modelo.encuestas.Pregunta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Pregunta pregunta=(Pregunta)request.getAttribute("pregunta");

PreguntaWidget preguntaWidget=new PreguntaWidget(pregunta);

%>
<!doctype html>
<html>
    <head>
        <title>JSP Page</title>
        <%@ include file="/template/header.jsp" %>
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>

        <div class="row-fluid" >
            <div class="span12"><img src="img/icons/task_48x48.png" alt="grafica" class="center" ></div>
        </div> 
        <%=preguntaWidget.toHTML() %> 

        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>
