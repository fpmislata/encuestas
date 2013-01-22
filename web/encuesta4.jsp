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
            <div class="span12"><img src="img/icons/task_48x48.png" alt="grafica" class="center" ></div>
        </div> 
        <div class="row-fluid" style="margin-top: 2em;">
            <div class="span12 main-text" >Voldries afegir algun suggeriment?:</div>
        </div> 
        <div class="row-fluid">
            <div class="span12" >
                <textarea class="input-xxlarge" rows="8"></textarea>
            </div>
        </div>
    <div class="row-fluid" style="margin-top: 2em;">
        <div class="span11" style="text-align: right" >
            <a href="encuesta3.jsp" class="btn btn-large "><i class="icon-arrow-left" ></i> Anterior</a>
            <a href="imprimir.jsp" class="btn btn-large btn-primary ">Siguiente <i class="icon-arrow-right icon-white" ></i></a>
        </div>
        <div class="span1" >
        </div>                    
    </div>

    <%@ include file="/template/bottom.jsp" %>
</body>
</html>
