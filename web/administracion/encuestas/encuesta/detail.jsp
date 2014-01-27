<div class="row-fluid" >
    <div class="span12">
        <ol class="breadcrumb">
            <li class="active">Encuesta</li>
        </ol>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12" >
        <form name="mainForm" id="mainForm" class="form-horizontal" >
            <legend>Encuesta</legend>
            <ix3-input model="nombre" ></ix3-input>
            <ix3-input model="fechaInicio" ></ix3-input>
            <ix3-input model="fechaFin" ></ix3-input>
            <ix3-input model="habilitada" ></ix3-input>
            <ix3-input model="imprimir" ></ix3-input>
        </form>
    </div>
</div>
<div class="row-fluid">
    <div class="span12">
        <button class="btn" ng-click="buttonNewChild('pregunta', null, 'encuesta.idEncuesta', 'model.idEncuesta')" >Nueva Pregunta</button>
        <br />
        <br />
        <table class="table table-bordered table-striped table-condensed">
            <thead>
                <tr>
                    <th colspan="3">Preguntas de la encuesta</th>
                </tr>                
                <tr>
                    <th style="text-align: right">N&ordm;</th>
                    <th width="100%">Pregunta</th>
                    <th style="text-align: center">Tipo&nbsp;Pregunta</th>
                    <th ng-show="allowChildAction('delete') || allowChildAction('view')" style="min-width:85px;text-align: center" >Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="pregunta in model.preguntas">
                    <td style="text-align: right">{{pregunta.idPregunta}}</td>
                    <td ><a href="javascript:void(0)" ng-click="buttonDefaultChild('pregunta', pregunta.idPregunta, 'encuesta.idEncuesta', 'model.idEncuesta')" >{{pregunta.pregunta}}</a></td>
                    <td style="white-space:nowrap;">{{metadata['Encuesta'].properties['preguntas'].properties['tipoPregunta'].values[pregunta.tipoPregunta]}}</td>
                    <td ng-show="allowChildAction('delete') || allowChildAction('view')">
                        <button ng-show="allowChildAction('delete')" class="btn btn-danger btn-mini" type="button" ng-click="buttonDeleteChild('pregunta', pregunta.idPregunta, 'encuesta.idEncuesta', 'model.idEncuesta')">Borrar</button>
                        <button ng-show="allowChildAction('view')" class="btn btn-success btn-mini" type="button" ng-click="buttonViewChild('pregunta', pregunta.idPregunta, 'encuesta.idEncuesta', 'model.idEncuesta')">Ver</button>
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
        <ix3-business-messages />
    </div>
</div>      

