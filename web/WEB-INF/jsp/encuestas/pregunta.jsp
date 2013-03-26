<%@page import="es.logongas.encuestas.presentacion.widget.TextWidget"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="es.logongas.ix3.persistencia.services.dao.BussinessMessage"%>
<%@page import="java.util.List"%>
<%@page import="es.logongas.encuestas.modelo.respuestas.RespuestaPregunta"%>
<%@page import="es.logongas.encuestas.presentacion.widget.RespuestaPreguntaWidget"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RespuestaPregunta respuestaPregunta = (RespuestaPregunta) request.getAttribute("respuestaPregunta");

    RespuestaPreguntaWidget respuestaPreguntaWidget = new RespuestaPreguntaWidget(respuestaPregunta);

    List<BussinessMessage> bussinessMessages = (List<BussinessMessage>) request.getAttribute("bussinessMessages");

    TextWidget textWidget = new TextWidget();
%>
<!doctype html>
<html>
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>
        <div class="row-fluid" style="margin-top: 2em">
            <div class="span12" style="text-align: center"><%=textWidget.toHTML(respuestaPregunta.getPregunta().getEncuesta().getNombre()) %></div>
        </div>
        <div class="row-fluid" >
            <div class="span12"><img src="img/icons/task_48x48.png" alt="grafica" class="center" ></div>
        </div>
        <%=respuestaPreguntaWidget.toHTML()%>
        <%
            if ((bussinessMessages != null) && (bussinessMessages.size() > 0)) {
        %>
        <div class="row-fluid">
            <div class="offset1 span11 main-text">
                <div class="alert">
                    <%
                        for (BussinessMessage bussinessMessage : bussinessMessages) {
                            if (bussinessMessage.getPropertyName() != null) {
                                out.println("<strong>" + HtmlUtils.htmlEscape(bussinessMessage.getPropertyName()) + "</strong>" + HtmlUtils.htmlEscape(bussinessMessage.getMessage()));
                            } else {
                                out.println(HtmlUtils.htmlEscape(bussinessMessage.getMessage()));
                            }
                        }
                    %>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>
