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
            <div class="span12 main-text" >Valora del 1 al 5 els següents aspectes:</div>
        </div> 
        <div class="row-fluid">
            <div class="span10 simple-text" style="padding-left: 20px;padding-top: 0.5em;" ><img src="img/icons/bullet.png" /> El procés de matricula:</div>
            <div class="span2" >
                <div class="btn-group">
                    <button class="btn dropdown-toggle" data-toggle="dropdown">
                        5&nbsp;&nbsp;<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                    </ul>
                </div>                
            </div>
        </div>
        <div class="row-fluid">
            <div class="span10 simple-text" style="padding-left: 20px;padding-top: 0.5em;" >
                <img src="img/icons/bullet.png" /> El tracte rebut pel personal del centre:</div>
            <div class="span2" >
                <div class="btn-group">
                    <button class="btn dropdown-toggle" data-toggle="dropdown">
                        5&nbsp;&nbsp;<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                    </ul>
                </div>                
            </div>
        </div>        
        
    </div>
    <div class="row-fluid" style="margin-top: 2em;">
        <div class="span11" style="text-align: right" >
            <a href="encuesta1.jsp" class="btn btn-large "><i class="icon-arrow-left" ></i> Anterior</a>
            <a href="encuesta3.jsp" class="btn btn-large btn-primary ">Siguiente <i class="icon-arrow-right icon-white" ></i></a>
        </div>
        <div class="span1" >
        </div>                    
    </div>

    <%@ include file="/template/bottom.jsp" %>
</body>
</html>
