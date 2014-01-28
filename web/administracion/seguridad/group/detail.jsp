<div class="row-fluid" >
    <div class="span12" >
        <form name="mainForm" id="mainForm" class="form-horizontal" >
            <legend>Datos del usuario</legend>
            <ix3-input model="login" ></ix3-input>
            <ix3-input model="name" ></ix3-input>
        </form>
    </div>
</div>
<div class="row-fluid">
    <div class="span12">
        <button class="btn" ng-click="buttonNewChild('ace', null, 'identity.idIdentity', 'model.idIdentity')" >Nuevo ACE</button>
        <br />
        <br />
        <table class="table table-bordered table-striped table-condensed">
            <thead>
                <tr>
                    <th colspan="3">Lista de control de acceso (ACL)</th>
                </tr>                
                <tr>
                    <th style="text-align: center">Tipo</th>
                    <th style="text-align: center">Permiso</th>
                    <th style="text-align: center">Recurso</th>
                    <th ng-show="allowChildAction('delete') || allowChildAction('view')" style="min-width:85px;text-align: center" >Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="ace in model.acl">
                    <td>{{ace.aceType}}</td>
                    <td>{{ace.permission}}</td>
                    <td>{{ace.secureResourceRegExp}}</td>

                    <td ng-show="allowChildAction('delete') || allowChildAction('view')">
                        <button ng-show="allowChildAction('delete')" class="btn btn-danger btn-mini" type="button" ng-click="buttonDeleteChild('ace', ace.idACE, 'identity.idIdentity', 'model.idIdentity')">Borrar</button>
                        <button ng-show="allowChildAction('view')" class="btn btn-success btn-mini" type="button" ng-click="buttonViewChild('ace', ace.idACE, 'identity.idIdentity', 'model.idIdentity')">Ver</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div> 
<div class="row-fluid" >
    <div class="span12">
        <button class="btn btn-primary" ng-click="buttonOK()">{{labelButtonOK}}</button>
        <button class="btn" ng-click="buttonCancel()" ng-show="controllerAction !== 'VIEW'">{{labelButtonCancel}}</button>
        <button class="btn btn-danger" ng-click="buttonDelete()" ng-show="controllerAction === 'EDIT'" style="float: right;">Borrar</button>
    </div>
</div>
<div class="row-fluid">
    <div class="span12">
        <ix3-business-messages></ix3-business-messages>
    </div>
</div>      
