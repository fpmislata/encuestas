<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>
        <div class="row-fluid" style="margin-top: 5em;">
            <div class="span12 main-text" style="text-align: center;font-size:40px;">¿Que tarea desea realizar?</div>
        </div>
        <div class="row-fluid" style="margin-top: 3em;">
            <div class="span5" >
                <a href="<%=request.getContextPath()%>/administracion/encuestas/nueva_encuesta.jsp" class="main-button" style="float: right;">
                    <span class="main-text">Crear una nueva encuesta</span>
                    <br />
                    <img src="<%=request.getContextPath()%>/img/icons/add_paper_blue.png" alt="nueva" class="center" >
                </a>
            </div>
            <div class="span2" >
            </div>
            <div class="span5" >
                <a href="<%=request.getContextPath()%>/administracion/encuestas/buscar_encuesta.jsp" class="main-button" >
                    <span class="main-text">Modificar una encuesta existente</span>
                    <br />
                    <img src="<%=request.getContextPath()%>/img/icons/application.png" alt="modifcar" class="center" />
                </a>
            </div>

        </div>
    </div>

    <%@ include file="/template/bottom.jsp" %>
</body>
</html>

