<%@page import="es.logongas.ix3.security.model.Identity"%>
<%@page import="es.logongas.ix3.security.model.ACE"%>
<%@page import="java.util.List"%>
<%@page import="es.logongas.ix3.security.model.GroupMember"%>
<%@page import="java.util.Set"%>
<%@page import="es.logongas.ix3.security.model.Group"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Identity identity=(Identity)request.getAttribute("principal");
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
                if (identity!=null) {
                    out.print("<h4>");
                    out.print(identity.getName());
                    out.print("</h4>");
                    Set<GroupMember> memberOf=identity.getMemberOf();
                     out.print("<h5>Grupos</h5>");
                    out.print("<ul>");
                    for(GroupMember groupMember:memberOf) {
                        out.print("<li>");
                        out.print(groupMember.getGroup().getName());
                        out.print("</li>");
                    }
                    out.print("</ul>");
                    Set<ACE> acl=identity.getAcl();
                     out.print("<h5>ACL</h5>");
                    out.print("<ul>");
                    for(ACE ace:acl) {
                        out.print("<li>");
                        out.print(ace.toString());
                        out.print("</li>");
                    }
                    out.print("</ul>");
                } else {
                    out.print("<h4>");
                    out.print("No hay ningún usuario");
                    out.print("</h4>");
                }
            %>
        </div>

    <%@ include file="/template/bottom.jsp" %>
</body>
</html>

