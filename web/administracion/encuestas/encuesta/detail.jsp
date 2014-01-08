<div class="row-fluid" >
    <div class="span12">
        <legend>Encuestas</legend>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12" >
        <form name="mainForm" id="mainForm" >
            <label for="nombre">Nombre</label>
            <input type="text" name="nombre" id="nombre" ng-model="model.nombre" required>
            <label class="checkbox">
                <input type="checkbox" name="habilitada" ng-model="model.habilitada"> Habilitada
            </label> 
            <label for="fechaInicio">Fecha inicio</label>
            <input type="text" name="fechaInicio" id="fechaInicio" ng-model="model.fechaInicio" ix3-date ix3-datepicker>        
            <label for="fechaFin">Fecha fin</label>
            <input type="text" name="fechaFin" id="fechaFin" ng-model="model.fechaFin" ix3-date  ix3-datepicker>        
            <label class="checkbox" for="imprimir">
                <input type="checkbox" name="imprimir" id="imprimir" ng-model="model.imprimir"> Imprimir
            </label>
        </form>
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

