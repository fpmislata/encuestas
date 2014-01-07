<div class="row-fluid" >
    <div class="span12">
        <legend>Encuestas</legend>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12" >
        <label>Nombre</label>
        <input type="text" ng-model="model.nombre">
        <label class="checkbox">
            <input type="checkbox"  ng-model="model.habilitada"> Habilitada
        </label> 
        <label>Fecha inicio</label>
        <input type="text" ng-model="model.fechaInicio" ix3-date ix3-datepicker>        
        <label>Fecha fin</label>
        <input type="text" ng-model="model.fechaFin" ix3-date  ix3-datepicker>        
        <label class="checkbox">
            <input type="checkbox"  ng-model="model.imprimir"> Imprimir
        </label>

    </div>
</div>

<div class="row-fluid" >
    <div class="span12">
        <button class="btn btn-primary" ng-click="save()" ng-show="controllerAction !== 'VIEW'">Guardar</button>
        <button class="btn" ng-click="exit()" >Volver</button>
        <button class="btn btn-danger" ng-click="delete()" ng-show="(controllerAction === 'DELETE') || (controllerAction === 'EDIT_DELETE')" style="float: right;">Borrar</button>
    </div>
</div>
<div class="row-fluid">
    <div class="span12">
        <ix3-business-messages />
    </div>
</div>      

