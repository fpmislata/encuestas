<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <%@ include file="/template/header.jsp" %>
    </head>
    <body>
<%@ include file="/template/top.jsp" %>

                    <div class="row-fluid" >
                        <div class="span12"><img src="img/icons/printer.png" alt="grafica" class="center" ></div>
                    </div> 
                    <div class="row-fluid" style="margin-top: 1em;">
                        <div class="offset2 span8 main-text" style="text-align: center">Ahora deberás imprimir la encuesta</div>
                    </div>         
                    <div class="row-fluid" >
                        <div class="offset2 span8 main-text" style="text-align: center">y</div>
                    </div>  
                    <div class="row-fluid" >
                        <div class="offset2 span8 main-text" style="text-align: center">entregarla junto con el sobre de matrícula</div>                        
                    </div>  


    <div class="row-fluid" style="margin-top: 2em;">
        <div class="span11" style="text-align: right" >
            <a href="ultima.html" class="btn btn-large "><i class="icon-arrow-left" ></i> Anterior</a>
            <a href="finalizar.html" class="btn btn-large btn-primary ">Finalizar <i class="icon-arrow-right icon-white" ></i></a>
        </div>
        <div class="span1" >
        </div>                    
    </div>

<%@ include file="/template/bottom.jsp" %>
    </body>
</html>
