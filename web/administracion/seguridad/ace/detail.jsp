<div class="row-fluid" >
    <div class="span12" >
        <form name="mainForm" id="mainForm" class="form-horizontal" >
            <legend>Datos del ACE</legend>
            <ix3-input model="aceType" ></ix3-input>
            <ix3-input model="permission" ></ix3-input>
            <ix3-input model="identity" ></ix3-input>
            <ix3-input model="secureResourceRegExp" ></ix3-input>
            <ix3-input model="conditionalScript" ></ix3-input>
            <ix3-input model="priority" ></ix3-input>
        </form>
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

