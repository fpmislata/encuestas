<%@page import="es.logongas.ix3.core.BusinessMessage"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="es.logongas.ix3.core.BusinessException"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<%
    String msg;
    String icon;

    if (exception instanceof BusinessException) {
        msg = "La petición no ha podido ser atendida debido a que:";
        icon = "alert";
    } else {
        msg = "La petición no ha podido ser atendida debido al siguiente error:";
        icon = "error";
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>

        <div class="row-fluid" style="padding: 20px;">
            <div class="span12" style="text-align: center">
                <span class="main-text" >Ups. Ha habido un problema</span>
            </div>
        </div>
        <div class="row-fluid" style="padding: 20px;">
            <div class="span12">
                <img src="<%=request.getContextPath()%>/img/icons/<%=icon%>.png" alt="alert" class="center" >
            </div>
        </div>
        <div class="row-fluid" style="padding-top: 20px;">
            <div class="span12"  >
                <p class="main-text-gray text-center"><%=HtmlUtils.htmlEscape(msg)%></p>
            </div>
        </div>
        <%
            if (exception instanceof BusinessException) {
        %>
        <div class="row-fluid" >
            <div class="span11 text-error">
                <div id="alert" class="alert alert-error">
                    <%
                        try {
                            for (BusinessMessage businessMessage : ((BusinessException) exception).getBusinessMessages()) {
                                if (businessMessage.getPropertyName() != null) {
                                    out.println("<strong>" + HtmlUtils.htmlEscape(businessMessage.getPropertyName()) + "</strong>" + HtmlUtils.htmlEscape(businessMessage.getMessage()));
                                } else {
                                    out.println(HtmlUtils.htmlEscape(businessMessage.getMessage()));
                                }
                            }
                        } catch (Exception ex) {
                        }
                    %>
                </div>
            </div>
        </div>

        <%        } else {%>

        <div class="row-fluid" style="padding-top: 10px;">
            <div class="span12"  >
                <p class="text-error text-center"><%=exception.getLocalizedMessage()%>.</p>
            </div>
        </div>
        <div class="row-fluid" style="padding: 20px;">
            <div class="span12"  style="text-align: center">
                <button class="btn btn-primary" onclick="$('#stackTrace').toggle()" >Ver detalles</button>
            </div>
        </div>
        <div id="stackTrace" class="row-fluid" style="display:none">
            <div class="span12">
                <pre><%
                    exception.printStackTrace(new java.io.PrintWriter(out));
                    %></pre>
            </div>
        </div>
        <%
            }
        %>

        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>