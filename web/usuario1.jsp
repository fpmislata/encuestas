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
            <div class="span12"><img src="img/icons/task_48x48.png" alt="grafica" class="center" ></div>
        </div> 
        <div class="row-fluid" style="margin-top: 2em;margin-bottom: 2em;">
            <div class="span12 main-text" >Dades Académiques:</div>
        </div> 
        <div class="row-fluid">
            <div class="span5 simple-text" style="padding-left: 20px" >
                <img src="img/icons/bullet.png"  /> Modalitat d'accés:
            </div >
            <div class="span7">                 
                <input type="text" class="input-xxlarge" style="margin-top: 0px;" />
            </div>
        </div> 
        <div class="row-fluid">
            <div class="span5 simple-text" style="padding-left: 20px" >
                <img src="img/icons/bullet.png"  /> Últims estudis cursats:
            </div >
            <div class="span7">                 
                <input type="text" class="input-xxlarge" style="margin-top: 0px;" />
            </div>
        </div>  
        <div class="row-fluid">
            <div class="span5 simple-text" style="padding-left: 20px" >
                <img src="img/icons/bullet.png"  /> Últim centre académic:
            </div >
            <div class="span7">                
                <input type="text" class="input-xxlarge" style="margin-top: 0px;" />
            </div>
        </div>    
        <div class="row-fluid">
            <div class="span5 simple-text" style="padding-left: 20px" >
                <img src="img/icons/bullet.png"  /> Població:
            </div >
            <div class="span7">                 
                <input type="text" class="input-large" style="margin-top: 0px;" />
            </div>
        </div>     
        <div class="row-fluid">
            <div class="span5 simple-text" style="padding-left: 20px" >
                <img src="img/icons/bullet.png"  /> Codi postal:
            </div >
            <div class="span7">                 
                <input type="text" class="input-small" style="margin-top: 0px;" />
            </div>
        </div>        
        <div class="row-fluid">
            <div class="span5 simple-text" style="padding-left: 20px" >
                <img src="img/icons/bullet.png"  /> Provincia:
            </div >
            <div class="span7">
                <div class="btn-group">
                    <button class="btn dropdown-toggle" data-toggle="dropdown">
                        Valencia&nbsp;&nbsp;<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">Álava</a></li>
                        <li><a href="#">Albacete</a></li>
                        <li><a href="#">Alicante</a></li>
                        <li><a href="#">Almería</a></li>
                        <li><a href="#">Asturias</a></li>
                        <li><a href="#">Ávila</a></li>
                        <li><a href="#">Badajoz</a></li>
                        <li><a href="#">Balears, Illes</a></li>
                        <li><a href="#">Barcelona</a></li>
                        <li><a href="#">Bizkaia</a></li>
                        <li><a href="#">Burgos</a></li>
                        <li><a href="#">Cáceres</a></li>
                        <li><a href="#">Cádiz</a></li>
                        <li><a href="#">Cantabria</a></li>
                        <li><a href="#">Castellón</a></li>
                        <li><a href="#">Ciudad Real</a></li>
                        <li><a href="#">Córdoba</a></li>
                        <li><a href="#">Coruña, A</a></li>
                        <li><a href="#">Cuenca</a></li>
                        <li><a href="#">Gipuzkoa</a></li>
                        <li><a href="#">Girona</a></li>
                        <li><a href="#">Granada</a></li>
                        <li><a href="#">Guadalajara</a></li>
                        <li><a href="#">Huelva</a></li>
                        <li><a href="#">Huesca</a></li>
                        <li><a href="#">Jaén</a></li>
                        <li><a href="#">León</a></li>
                        <li><a href="#">Lleida</a></li>
                        <li><a href="#">Lugo</a></li>
                        <li><a href="#">Madrid</a></li>
                        <li><a href="#">Málaga</a></li>
                        <li><a href="#">Murcia</a></li>
                        <li><a href="#">Navarra</a></li>
                        <li><a href="#">Ourense</a></li>
                        <li><a href="#">Palencia</a></li>
                        <li><a href="#">Palmas, Las</a></li>
                        <li><a href="#">Pontevedra</a></li>
                        <li><a href="#">Rioja, La</a></li>
                        <li><a href="#">Salamanca</a></li>
                        <li><a href="#">Santa Cruz de Tenerife</a></li>
                        <li><a href="#">Segovia</a></li>
                        <li><a href="#">Sevilla</a></li>
                        <li><a href="#">Soria</a></li>
                        <li><a href="#">Tarragona</a></li>
                        <li><a href="#">Teruel</a></li>
                        <li><a href="#">Toledo</a></li>
                        <li><a href="#">Valencia</a></li>
                        <li><a href="#">Valladolid</a></li>
                        <li><a href="#">Zamora</a></li>
                        <li><a href="#">Zaragoza</a></li>
                        <li><a href="#">Ceuta</a></li>
                        <li><a href="#">Melilla</a></li>
                    </ul>
                </div> 
            </div>
        </div>          
        
        <div class="row-fluid" style="margin-top: 2em;">
            <div class="span11" style="text-align: right" >
                <a href="index.jsp" class="btn btn-large "><i class="icon-arrow-left" ></i> Anterior</a>
                <a href="encuesta1.jsp" class="btn btn-large btn-primary ">Siguiente <i class="icon-arrow-right icon-white" ></i></a>
            </div>
            <div class="span1" >
            </div>                    
        </div>

        <%@ include file="/template/bottom.jsp" %>
    </body>
</html>
