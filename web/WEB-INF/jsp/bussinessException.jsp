<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="java.util.List"%>
<%@page import="es.logongas.ix3.persistencia.services.dao.BussinessMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
List<BussinessMessage> bussinessMessages=(List<BussinessMessage>)request.getAttribute("bussinessMessages");
%>
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
            <div class="offset2 span8 main-text" style="text-align: center">Ups. Se ha producido algún problema</div>
        </div>  
        <div class="row-fluid">
            <div class="offset2 span8 main-text" style="text-align: center">
                <div class="alert">
                    <%
                        for(BussinessMessage bussinessMessage:bussinessMessages) {
                            if (bussinessMessage.getPropertyName()!=null) {
                              out.println("<strong>" + HtmlUtils.htmlEscape(bussinessMessage.getPropertyName()) + "</strong>"+HtmlUtils.htmlEscape(bussinessMessage.getMessage()));  
                            } else {
                              out.println(HtmlUtils.htmlEscape(bussinessMessage.getMessage()));  
                            }
                        }
                    %>
                </div>
            </div>
        </div>

        <div class="row-fluid" style="margin-top: 2em;">
            <div class="span12" style="text-align: center" >
                <a href="/encuestas" class="btn btn-large btn-primary ">Volver</a>
            </div>
            <div class="span1" >
            </div>                    
        </div>

        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>