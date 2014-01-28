<div class="row-fluid" >
    <div class="span12">
        <legend>Listado de encuestas</legend>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12">
        <form class="form-inline">
            <div class="input-append">     
                <input type="text" class="input-large" ng-model="filter.nombre" placeholder="Escribe el nombre de la encuesta" />
                <button type="button" class="btn" ng-click="buttonSearch()">Buscar</button>
            </div>
            &nbsp;&nbsp;
            orden:
            <select ng-model="orderby[0]" class="input-medium" ng-options="order.label for order in ordersby"></select>
            &nbsp;&nbsp;
            <button  class="btn btn-primary"   ng-click="buttonNew()" >Nueva encuesta</button>
        </form>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12" >
        <table class="table table-bordered table-striped table-condensed">
            <thead>
                <tr>
                    <th style="min-width:30px;text-align: right">N&ordm;</th>
                    <th style="width:    100% ;text-align: left">Nombre</th>
                    <th style="min-width:85px;text-align: center">Habilitada</th>
                    <th style="min-width:85px;text-align: center" >Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="encuesta in models">
                    <td style="text-align: right">{{encuesta.idEncuesta}}</td>
                    <td ><a href="javascript:void(0)" ng-click="buttonEdit(encuesta.idEncuesta)">{{encuesta.nombre}}</a></td>
                    <td ng-switch on="encuesta.habilitada" style="text-align: center"><img ng-switch-when="true" src="../../img/icons/check24x24.gif" alt="check"><img ng-switch-default src="../../img/icons/minus24x24.gif" alt="uncheck"></td>
                    <td >
                        <button class="btn btn-danger btn-mini" type="button" ng-click="buttonDelete(encuesta.idEncuesta)">Borrar</button>
                        <button class="btn btn-success btn-mini" type="button" ng-click="buttonView(encuesta.idEncuesta)">Ver</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>        
<div class="row-fluid" >
    <div class="span9" >
        <div>
            <ix3-pagination ></ix3-pagination>
        </div>
    </div>
    <div class="span3" >
        <form class="form-horizontal" role="form" style="text-align: right">
            <div class="form-group">
                <label class="control-label" for="pageSize" style="text-wrap:none;text-align: right">Resultados por p&aacute;gina:</label>
                <div class="controls">
                    <select ng-model="page.pageSize" id="pageSize" class="input-small" ng-options="pageSize for pageSize in pageSizes" ></select>
                </div>
            </div> 
        </form>
    </div>
</div>



<div class="row-fluid" >
    <div class="span12">
        <ix3-business-messages></ix3-business-messages>
    </div>
</div>