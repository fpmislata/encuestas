</div>
</div>
<div class="span1"></div>
</div>
<div class="row-fluid no-print" style="margin-top: 1em">
    <div class="span1"  ></div>
    <div class="span2"  ><img src="<%=request.getContextPath()%>/img/icons/europa.png" alt="fse" /></div>
    <div class="span6" style="text-align: center" >&copy; 2013 - Lorenzo González para el CIPFP Mislata</div><!-- codigo fuente en github.com/logongas/encuestas -->
    <div class="span2"  ><img src="<%=request.getContextPath()%>/img/icons/bureauVeritas.png" alt="certificado calidad" align="right"  /></div>
    <div class="span1"  ></div>
</div>

<div id="loginModal" class="modal hide fade no-print" tabindex="-1" role="dialog" aria-labelledby="Modal Login" aria-hidden="true">
<form class="form-horizontal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="loginModalLabel">Identificarse</h3>
    </div>
    <div class="modal-body">

            <div class="control-group">
                <label class="control-label" for="inputEmail">Usuario:</label>
                <div class="controls">
                    <input type="text" id="inputLogin" autofocus="autofocus" >
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputPassword">Contraseña:</label>
                <div class="controls">
                    <input type="password" id="inputPassword" >
                </div>
            </div>

    </div>
    <div class="modal-footer">
        <button class="btn btn-primary" id="login">Entrar</button>
        <button class="btn" type="button" data-dismiss="modal" aria-hidden="true">Cancelar</button>
    </div>
</form>
</div>