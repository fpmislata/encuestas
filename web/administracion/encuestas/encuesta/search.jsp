<div class="row-fluid" >
    <div class="span12">
        <legend>Listado de encuestas</legend>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12">
        <form class="form-inline">
            <div class="input-append">     
                <input type="text" class="input-large" ng-model="filter.nombre" placeholder="Escribe el nombre de la encuesta" /><button type="button" class="btn btn-primary" ng-click="buttonSearch()">Filtrar</button>
            </div>
            &nbsp;&nbsp;
            orden:
            <select ng-model="order[0]" class="input-medium" ng-options="order.label for order in orders"></select>
            &nbsp;&nbsp;
            <a href="#/encuesta/new"  class="btn" >Nueva encuesta</a>
        </form>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12" >
        <table class="table table-bordered table-striped table-condensed">
            <thead>
                <tr>
                    <th style="text-align: right">N&ordm;</th>
                    <th width="100%">Nombre</th>
                    <th style="text-align: center">Habilitada</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="encuesta in models">
                    <td style="text-align: right">{{encuesta.idEncuesta}}</td>
                    <td ><a href="#/encuesta/edit/{{encuesta.idEncuesta}}">{{encuesta.nombre}}</a></td>
                    <td ng-switch on="encuesta.habilitada" style="text-align: center"><img ng-switch-when="true" src="../../img/icons/check24x24.gif" alt="check"><img ng-switch-default src="../../img/icons/minus24x24.gif" alt="uncheck"></td>
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
                    <select ng-model="pageSize" id="pageSize" class="input-small" ng-options="pageSize for pageSize in pageSizes" ></select>
                </div>
            </div> 
        </form>
    </div>
</div>



<div class="row-fluid" >
    <div class="span12">
        <ix3-business-messages />
    </div>
</div>