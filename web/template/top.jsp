<%
//La redirección no hay que hacerla si ya estamos en la propia página que avisa que está desactivado y lo sabemos por esta variable.
if (!(request.getAttribute("disableCheckNoScript")==Boolean.TRUE)) {
%>
<noscript>
	<meta http-equiv="refresh" content="0; url=<%=request.getContextPath() %>/noscript.jsp"/>
</noscript>
<%
}
%>
        <div class="ajax-wait"></div>
        <div class="row-fluid" style="margin-top: 1em">
            <div class="span1" ></div>
            <div class="span10 marco">

                <div class="cabecera" >
                    <div class="row-fluid no-print">
                        <div class="span12 nav-bar" style="text-align: right;">
                            <a href="<%=request.getContextPath() %>/">Inici</a>&nbsp;&nbsp;|
                            &nbsp;&nbsp;<a href="<%=request.getContextPath() %>/porque.jsp">Perqu&egrave; esta enquesta?</a>&nbsp;&nbsp;|
                            &nbsp;&nbsp;<a href="<%=request.getContextPath() %>/ayuda.jsp">Ajuda</a>&nbsp;&nbsp;|
                            <%
                            if (request.getSession().getAttribute("sid")==null) {
                            %>
                            &nbsp;&nbsp;<a id="entrar" href="#">Entrar</a>
                            <%
                            } else {
                            %>
                            &nbsp;&nbsp;<a id="logout" href="#">Eixir</a>&nbsp;&nbsp;|
                            &nbsp;&nbsp;<a href="<%=request.getContextPath()%>/administracion/administracion.jsp" >Administrar</a>
                            <%
                            }
                            %>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                    <div class="row-fluid" style="margin-top: 2em;">
                        <div class="span12" style="text-align: center;"><a href="http://www.fpmislata.com"><img src="<%=request.getContextPath() %>/img/icons/nombre-instituto.png" alt="instituto" border="0px" ></a></div>
                    </div>
                </div>

                <div class="cuerpo container-fluid">
