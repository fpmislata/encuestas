<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="row-fluid" style="margin-top: 2em;">
            <div class="span12 main-text" >En matricular-te en aquest centre les teues expectatives son:</div>
        </div> 
        <div class="row-fluid">
            <div class="span12" >
                <ul class="items_encuesta">

                    <li style="text-align: left">
                        <div class=".checkbox">
                            <input type="checkbox" value="1" id="option1"  name="option1" />
                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Obtindre&nbsp;un&nbsp;titol</label>
                        </div>  
                    </li>
                    <li style="text-align: left">
                        <div class=".checkbox">
                            <input type="checkbox" value="1" id="option2"  name="option2" />
                            <label  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tindre&nbsp;una&nbsp;bona&nbsp;formació</label>
                        </div>  
                    </li>
                    <li style="text-align: left">
                        <div class=".checkbox">
                            <input type="checkbox" value="1" id="option3"  name="option3" />
                            <label >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trobar&nbsp;treball&nbsp;relacionat&nbsp;ams&nbsp;els&nbsp;estudis&nbsp;cursats</label>
                        </div>  
                    </li>
                    <li style="text-align: left">
                        <div class=".checkbox">
                            <input type="checkbox" value="1" id="option4"  name="option4" />
                            <label >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Continuar&nbsp;estudis&nbsp;per&nbsp;completar&nbsp;la&nbsp;meua&nbsp;formació</label>
                        </div>  
                    </li>
                    <li style="text-align: left">
                        <div class=".checkbox">
                            <input type="checkbox" value="1" id="option5"  name="option5" />
                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Altres&nbsp;(indicar&nbsp;quines):</label>
                            <input class="input-xxlarge" type="text" placeholder="Altres expectatives">
                        </div>  
                    </li>                     
                </ul>
            </div>
        </div>
        <div class="row-fluid" style="margin-top: 2em;">
            <div class="span11" style="text-align: right" >
                <a href="usuario1.jsp" class="btn btn-large "><i class="icon-arrow-left" ></i> Anterior</a>
                <a href="encuesta2.jsp" class="btn btn-large btn-primary ">Siguiente <i class="icon-arrow-right icon-white" ></i></a>
            </div>
            <div class="span1" >
            </div>                    
        </div>

        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>
