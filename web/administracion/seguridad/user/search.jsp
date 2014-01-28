<div class="row-fluid" >
    <div class="span12">
        <legend>Listado de usuarios</legend>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12">
        <form class="form-inline">
            <div class="input-append">     
                <input type="text" class="input-large" ng-model="filter.name" placeholder="Escribe el nombre del usuario" />
                <button type="button" class="btn" ng-click="buttonSearch()">Buscar</button>
            </div>
            &nbsp;&nbsp;
            orden:
            <select ng-model="orderby[0]" class="input-medium" ng-options="order.label for order in ordersby"></select>
            &nbsp;&nbsp;
            <button  class="btn btn-primary"   ng-click="buttonNew()" >Nuevo usuario</button>
        </form>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12" >
        <table class="table table-bordered table-striped table-condensed">
            <thead>
                <tr>
                    <th style="min-width:30px ;text-align: right">N&ordm;</th>
                    <th style="width:    100% ;text-align: center">Nombre</th>
                    <th style="min-width:200px;text-align: left">Login</th>
                    <th style="min-width:85px ;text-align: center" >Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="user in models">
                    <td style="text-align: right">{{user.idIdentity}}</td>
                    <td><a href="javascript:void(0)" ng-click="buttonEdit(user.idIdentity)">{{user.name}}</a></td>
                    <td>{{user.login}}</td>
                    <td>
                        <button class="btn btn-danger btn-mini" type="button" ng-click="buttonDelete(user.idIdentity)">Borrar</button>
                        <button class="btn btn-success btn-mini" type="button" ng-click="buttonView(user.idIdentity)">Ver</button>
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