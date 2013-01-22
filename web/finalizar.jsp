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
                        <div class="span12"><img src="img/icons/check.png" alt="grafica" class="center" ></div>
                    </div> 
                    <div class="row-fluid" style="margin-top: 1em;">
                        <div class="offset2 span8 main-text" style="text-align: center">Gracias por ayudar a</div>
                    </div>  
                    <div class="row-fluid">
                        <div class="offset2 span8 main-text" style="text-align: center">mejorar la educación</div>
                    </div>

    <div class="row-fluid" style="margin-top: 2em;">
        <div class="span12" style="text-align: center" >
            <a href="index.jsp" class="btn btn-large btn-primary ">Volver</a>
        </div>
        <div class="span1" >
        </div>                    
    </div>

<%@ include file="/template/bottom.jsp" %>
    </body>
</html>