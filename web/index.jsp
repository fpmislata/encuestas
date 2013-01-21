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
                        <div class="span12"><img src="img/icons/pie_chart.png" alt="grafica" class="center" ></div>
                    </div> 
                    <div class="row-fluid" style="margin-top: 5em;">
                        <div class="span12 main-text" style="text-align: center">¿Que tipo de alumno eres?</div>
                    </div>         
                    <div class="row-fluid" style="margin-top: 3em;">

                        <div class="span6" >
                            <a href="encuesta1.jsp" class="main-button" style="float: right;">
                                <span class="main-text">nuevo en el centro</span>
                                <br />
                                <img src="img/icons/people.png" alt="nuevo" class="center" />
                            </a>
                        </div>
                        <div class="span6" >
                            <a href="#" class="main-button">
                                <span class="main-text">de años anteriores</span>
                                <br />
                                <img src="img/icons/phonebook.png" alt="de años anteriores" class="center" >
                            </a>
                        </div>
                    </div>    
                </div>

<%@ include file="/template/bottom.jsp" %>
    </body>
</html>
