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
            <div class="span12 main-text" >En matricular-te en aquest centre les teues expectatives son:</div>
        </div> 
        <div class="row-fluid">
            <div class="span12" >
                <ul class="items_encuesta">

                    <li style="text-align: left">
                        <div class=".radiobutton">
                            <input type="radio" value="1" id="op1" name="option1" checked="checked" />
                            <label class="checkedd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Obtindre&nbsp;un&nbsp;titol</label>
                        </div>  
                    </li>
                    <li style="text-align: left">
                        <div class=".radiobutton">
                            <input type="radio" value="2" id="op2"  name="option1" />
                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tindre&nbsp;una&nbsp;bona&nbsp;formació</label>
                        </div>  
                    </li>
                    <li style="text-align: left">
                        <div class=".radiobutton">
                            <input type="radio" value="3" id="op3"  name="option1"  />
                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trobar&nbsp;treball&nbsp;relacionat&nbsp;ams&nbsp;els&nbsp;estudis&nbsp;cursats</label>
                        </div>  
                    </li>
                    <li style="text-align: left">
                        <div class=".radiobutton">
                            <input type="radio" value="4" id="op4"  name="option1"  />
                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Continuar&nbsp;estudis&nbsp;per&nbsp;completar&nbsp;la&nbsp;meua&nbsp;formació</label>
                        </div>  
                    </li>
                    <li style="text-align: left">
                        <div class=".radiobutton">
                            <input type="radio" value="5"  id="op5" name="option1"  />
                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Altres&nbsp;(indicar&nbsp;quines):</label>
                            <input class="input-xxlarge" type="text" placeholder="Altres expectatives" style="visibility:hidden">
                        </div>  
                    </li>                     
                </ul>
            </div>
        </div>
    <div class="row-fluid" style="margin-top: 2em;">
        <div class="span11" style="text-align: right" >
            <a href="encuesta2.jsp" class="btn btn-large "><i class="icon-arrow-left" ></i> Anterior</a>
            <a href="encuesta4.jsp" class="btn btn-large btn-primary ">Siguiente <i class="icon-arrow-right icon-white" ></i></a>
        </div>
        <div class="span1" >
        </div>                    
    </div>

    <%@ include file="/template/bottom.jsp" %>
</body>
</html>
