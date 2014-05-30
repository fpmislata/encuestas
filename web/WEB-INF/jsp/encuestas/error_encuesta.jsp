<%@page import="es.logongas.encuestas.modelo.encuestas.Encuesta"%>
<%@page import="es.logongas.encuestas.presentacion.widget.TextWidget"%>
<%@page import="es.logongas.encuestas.presentacion.widget.BusinessMessagesWidget"%>
<%@page import="es.logongas.encuestas.presentacion.widget.RespuestaPreguntaWidget"%>
<%@page import="es.logongas.ix3.core.BusinessMessage"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URI"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Encuesta encuesta=(Encuesta) request.getAttribute("encuesta");
    List<BusinessMessage> businessMessages = (List<BusinessMessage>) request.getAttribute("businessMessages");
    BusinessMessagesWidget businessMessagesWidget = new BusinessMessagesWidget(businessMessages);
    businessMessagesWidget.setShowCloseButton(false);

    TextWidget textWidget = new TextWidget();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>
        <div class="row-fluid" style="margin-top: 2em">
            <div class="span12" style="text-align: center"><%=textWidget.toHTML(encuesta.getNombre()) %></div>
        </div>
        <div class="row-fluid" >
            <div class="span12"><img src="img/icons/task_48x48.png" alt="grafica" class="center" ></div>
        </div>
        <div class="row-fluid" style="margin-top: 5em;">
            <div class="span12 main-text" style="text-align: center;">No ha sido posible guardar el resultado de la encuesta.</div>
        </div>
        <%=businessMessagesWidget.toHTML() %>

        <div class="row-fluid" style="margin-top: 2em;">
            <div class="span12" style="text-align: center" >
                <a href="<%=request.getContextPath() %>/encuesta.html?idEncuesta=<%=encuesta.getIdEncuesta() %>" class="btn btn-large btn-primary ">Volver</a>
            </div>
            <div class="span1" >
            </div>
        </div>

        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>