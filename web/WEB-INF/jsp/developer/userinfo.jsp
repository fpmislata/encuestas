<%@page import="es.logongas.ix3.model.ACE"%>
<%@page import="java.util.List"%>
<%@page import="es.logongas.ix3.model.GroupMember"%>
<%@page import="java.util.Set"%>
<%@page import="es.logongas.ix3.model.Group"%>
<%@page import="es.logongas.ix3.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
User user=(User)request.getAttribute("user");
%>
<html>
    <head>
        <title>Encuestas</title>
        <%@ include file="/template/header.jsp" %>
    </head>
    <body>
        <%@ include file="/template/top.jsp" %>
        <div class="row-fluid" style="margin-top: 3em;">
            <%
                if (user!=null) {
                    out.print("<h4>");
                    out.print(user.getName());
                    out.print("</h4>");
                    Set<GroupMember> memberOf=user.getMemberOf();
                     out.print("<h5>Grupos</h5>");
                    out.print("<ul>");
                    for(GroupMember groupMember:memberOf) {
                        out.print("<li>");
                        out.print(groupMember.getGroup().getName());
                        out.print("</li>");
                    }
                    out.print("</ul>");
                    Set<ACE> acl=user.getAcl();
                     out.print("<h5>ACL</h5>");
                    out.print("<ul>");
                    for(ACE ace:acl) {
                        out.print("<li>");
                        out.print(ace.toString());
                        out.print("</li>");
                    }
                    out.print("</ul>");
                }
            %>
        </div>

    <%@ include file="/template/bottom.jsp" %>
</body>
</html>

