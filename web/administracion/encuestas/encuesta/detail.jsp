<div class="row-fluid" >
    <div class="span12">
        <legend>Encuesta</legend>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12" >
        <form name="mainForm" id="mainForm" >
            <div class="row-fluid" >
                <div class="span12" >
                    <label for="nombre">Nombre</label>
                    <input type="text" class="input-block-level" name="nombre" id="nombre" ng-model="model.nombre" required>
                </div>
            </div>
            <div class="row-fluid" >
                <div class="span3" >
                    <label for="fechaInicio">Fecha inicio</label>
                    <input type="text" class="input-small" name="fechaInicio" id="fechaInicio" ng-model="model.fechaInicio" ix3-date ix3-datepicker>   
                </div>
                <div class="span3" >
                    <label for="fechaFin">Fecha fin</label>
                    <input type="text" class="input-small" name="fechaFin" id="fechaFin" ng-model="model.fechaFin" ix3-date  ix3-datepicker>  
                </div>  
                <div class="span2" >
                    <label >&nbsp;</label>
                    <label class="checkbox">
                        <input type="checkbox" name="habilitada" ng-model="model.habilitada"> Habilitada
                    </label>   
                </div>
                <div class="span2" >
                    <label>&nbsp;</label>
                    <label class="checkbox" for="imprimir">
                        <input type="checkbox" name="imprimir" id="imprimir" ng-model="model.imprimir"> Imprimir
                    </label> 
                </div>  
                <div class="span2" ></div>                
            </div>





        </form>
    </div>
</div>
<div class="row-fluid">
    <div class="span12">
        <legend>Preguntas</legend>
        <a class="btn btn-primary" href="#/pregunta/new" >Nueva Pregunta</a>
        <br />
        <br />
        <table class="table table-bordered table-striped table-condensed">
            <thead>
                <tr>
                    <th style="text-align: right">N&ordm;</th>
                    <th width="100%">Pregunta</th>
                    <th style="text-align: center">Tipo&nbsp;Pregunta</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="pregunta in models['preguntas']">
                    <td style="text-align: right">{{pregunta.idPregunta}}</td>
                    <td ><a href="#/pregunta/editdelete/{{pregunta.idPregunta}}/pregunta.idPregunta/{{model.idPregunta}}">{{pregunta.pregunta}}</a></td>
                    <td style="white-space:nowrap;">{{metadata['Pregunta'].properties['tipoPregunta'].values[pregunta.tipoPregunta]}}</td>
                </tr>
            </tbody>
        </table>
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

