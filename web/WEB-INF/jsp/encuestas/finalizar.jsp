<%@page import="es.logongas.util.seguridad.CodigoVerificacionSeguro"%>
<%@page import="java.net.URI"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CodigoVerificacionSeguro codigoVerificacionSeguro=(CodigoVerificacionSeguro)request.getAttribute("codigoVerificacionSeguro");
    URI backURI = (URI) request.getAttribute("backURI");
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
            <div class="span12"><img src="<%=request.getContextPath()%>/img/icons/printer.png" alt="grafica" class="center noPrint" ></div>
        </div>
        <div class="row-fluid" style="margin-top: 1em;">
            <div class="offset2 span8 main-text lead" style="text-align: center">Ara has d'imprimir esta p&agrave;gina</div>
        </div>
        <div class="row-fluid" >
            <div class="offset2 span8 main-text" lead style="text-align: center">i</div>
        </div>
        <div class="row-fluid" >
            <div class="offset2 span8 main-text lead" style="text-align: center">entregar-la junt amb el sobre de matrícula</div>
        </div>
        <div class="row-fluid" >
            <div class="span12" ><img src="<%=request.getContextPath()%>/api/cvc/respuestaencuesta/qrcode.png?cvc=<%=codigoVerificacionSeguro.getValor() %>&tamanyo=250" alt="grafica" class="center" ></div>
        </div>
        <div class="row-fluid" >
            <div class="span12 "  style="text-align: center" ><h4><%=codigoVerificacionSeguro.getValor() %></h4></div>
        </div>

        <div class="row-fluid" style="margin-top: 2em;">
            <div class="span12" style="text-align: center" >
                <a href="<%=backURI.toASCIIString()%> " class="btn btn-large btn-primary ">Tornar </a>
            </div>
        </div>

        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>