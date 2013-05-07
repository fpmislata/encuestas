<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>
        <div class="row-fluid" style="margin-top: 3em;">
            <div class="span5" >
                <a href="<%=request.getContextPath()%>/administracion/graficas/graficas.jsp" class="main-button" style="float: right;">
                    <span class="main-text">Gr&aacute;ficas de resultados</span>
                    <br />
                    <img src="<%=request.getContextPath()%>/img/icons/chart4.png" alt="graficas" class="center" >
                </a>
            </div>
            <div class="span2" >
            </div>
            <div class="span5" >
                <a href="<%=request.getContextPath()%>/administracion/encuestas/encuestas.jsp" class="main-button" >
                    <span class="main-text">Configurar las encuestas</span>
                    <br />
                    <img src="<%=request.getContextPath()%>/img/icons/config.png" alt="Administrar" class="center" />
                </a>
            </div>

        </div>

    <%@ include file="/template/bottom.jsp" %>
</body>
</html>
