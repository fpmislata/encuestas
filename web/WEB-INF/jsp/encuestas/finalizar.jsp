<%@page import="es.logongas.util.seguridad.CodigoVerificacionSeguro"%>
<%@page import="java.net.URI"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CodigoVerificacionSeguro codigoVerificacionSeguro=(CodigoVerificacionSeguro)request.getAttribute("codigoVerificacionSeguro");
    URI backURI = (URI) request.getAttribute("backURI");
    boolean imprimir = (Boolean) request.getAttribute("imprimir");
    boolean confirmado;
    if (imprimir) {
        confirmado=false;
    } else {
        confirmado=true;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
        <script>
            $(function() {
                var confirmado=<%=confirmado %>;


                jQuery("#imprimir_verificacion").click(function(event) {
                    window.print();
                });
                jQuery("#volver").click(function(event) {
                    if (confirmado===true) {
                        volver();
                    } else if (confirm('Has imprés esta pàgina?')) {
                        confirmado=true;
                        volver();
                    }
                });

                function volver() {
                   window.location.href="<%=backURI.toASCIIString()%>";
                }

            })
        </script>

    </head>
    <body>
        <%@ include file="/template/top.jsp" %>

        <%
            if (imprimir==true) {
        %>
            <div class="row-fluid no-print" >
                <div class="span12" style="text-align: center;"><img src="<%=request.getContextPath()%>/img/icons/printer.png" alt="impresora"  ></div>
            </div>
            <div class="row-fluid" style="margin-top: 1em;">
                <div class="offset2 span8 main-text lead" style="text-align: center">Has d'imprimir esta p&agrave;gina</div>
            </div>
            <div class="row-fluid" >
                <div class="offset2 span8 main-text" lead style="text-align: center">i</div>
            </div>
            <div class="row-fluid" >
                <div class="offset2 span8 main-text lead" style="text-align: center">entregar-la dins del sobre de matrícula</div>
            </div>
            <div class="row-fluid" style="margin-top: 2em;">
                <div class="span12" style="text-align: center" >
                    <button id="imprimir_verificacion" class="btn btn-large btn-success no-print">Imprimir</button>
                </div>
            </div>
            <div class="row-fluid" >
                <div class="span12" style="text-align: center;"><img src="<%=request.getContextPath()%>/images/secure_qrcode.png?cvc=<%=codigoVerificacionSeguro.getValor() %>&tamanyo=250" alt="<%=codigoVerificacionSeguro.getValor() %>"  border="0" /></div>
            </div>
            <div class="row-fluid" >
                <div class="span12 "  style="text-align: center" ><h4>Codi de verificaci&oacute; d'enquesta realitzada</h4></div>
            </div>
            <div class="row-fluid" >
                <div class="span12 "  style="text-align: center" ><h3><%=codigoVerificacionSeguro.getValor() %>-<%=codigoVerificacionSeguro.getKey() %></h3></div>
            </div>
            <div class="row-fluid" style="margin-top: 2em;">
                <div class="span12" style="text-align: center" >
                    <button id="volver" class="btn btn-primary no-print">Tornar</button>
                </div>
            </div>        
        <%
            } else {
        %>
            
            <div class="row-fluid no-print" >
                <div class="span12" style="text-align: center;"><img src="<%=request.getContextPath()%>/img/icons/check.png" alt="task"  ></div>
            </div>
            <div class="row-fluid" style="margin-top: 2em;">
                <div class="offset2 span8 main-text lead" style="text-align: center">Felicitats!</div>
            </div>
            <div class="row-fluid" style="margin-top: 2em;">
                <div class="offset2 span8 main-text lead" style="text-align: center">Has acabat l'enquesta</div>
            </div>                
            <div class="row-fluid" style="margin-top: 2em;">
                <div class="span12" style="text-align: center" >
                    <button id="volver" class="btn btn-large btn-primary no-print">Tornar</button>
                </div>
            </div>
        
         <%
            }
        %>        
        


        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>