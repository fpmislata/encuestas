</div>
</div>
<div class="span1"></div>
</div>
<div class="row-fluid" style="margin-top: 1em">
    <div class="span1"  ></div>
    <div class="span2"  ><img src="<%=request.getContextPath()%>/img/icons/europa.png" alt="fse" /></div>
    <div class="span6" style="text-align: center" >&copy; 2013 - Lorenzo González para el CIPFP Mislata</div>
    <div class="span2"  ><img src="<%=request.getContextPath()%>/img/icons/bureauVeritas.png" alt="certificado calidad" align="right"  /></div>
    <div class="span1"  ></div>
</div>

<div id="loginModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="Modal Login" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="loginModalLabel">Identificarse</h3>
    </div>
    <div class="modal-body">
        <form class="form-horizontal">
            <div class="control-group">
                <label class="control-label" for="inputEmail">Usuario:</label>
                <div class="controls">
                    <input type="text" id="inputLogin" >
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputPassword">Contraseña:</label>
                <div class="controls">
                    <input type="password" id="inputPassword" >
                </div>
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
        <button class="btn btn-primary" onclick="login()">Entrar</button>
    </div>
</div>