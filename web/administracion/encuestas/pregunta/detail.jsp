<div class="row-fluid" >
    <div class="span12">
        <ol class="breadcrumb">
            <li><a href="#/encuesta/edit/{{model.encuesta.idEncuesta}}">Encuesta ({{model.encuesta.nombre| limitTo: 25}})</a> <span class="divider">/</span></li>
            <li class="active">Pregunta</li>
        </ol>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12" >
        <form class="form-horizontal" name="mainForm" id="mainForm">
                <legend>Pregunta</legend>
                <ix3-input model="tipoPregunta" ></ix3-input>
                <ix3-input model="pregunta" ></ix3-input>
                <ix3-input model="pie" ></ix3-input>
                <ix3-input model="ultimoItemIncluyeOtros" ></ix3-input>
                <ix3-input model="requerido" ></ix3-input>
        </form>

    </div>
</div> 
<div class="row-fluid">
    <div class="span12">
        <div >
            <button class="btn" ng-click="buttonNewChild('item',null,'pregunta.idPregunta','model.idPregunta')"  >Nuevo Item</button>
            <br />
            <br />
        </div>

        <table class="table table-bordered table-striped table-condensed">
            <thead>
                <tr>
                    <th colspan="3" >Items de la pregunta</th>
                </tr>                
                <tr>
                    <th style="text-align: right">N&ordm;</th>
                    <th width="100%">Item</th>
                    <th style="text-align: center">Tipo&nbsp;Item</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="item in model.items">
                    <td style="text-align: right">{{item.idItem}}</td>
                    <td ><a href="javascript:void(0)" ng-click="buttonDefaultChild('item',item.idItem,'pregunta.idPregunta','model.idPregunta')">{{item.nombre}}</a></td>
                    <td style="white-space:nowrap;">{{metadata['Pregunta'].properties['items'].properties['tipoItem'].values[item.tipoItem]}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div> 
<div class="row-fluid" >
    <div class="span12">
        <button class="btn btn-primary" ng-click="buttonOK()">{{labelButtonOK}}</button>
        <button class="btn" ng-click="buttonCancel()"  ng-show="controllerAction !== 'VIEW'">{{labelButtonCancel}}</button>
        <button class="btn btn-danger" ng-click="buttonDelete()" ng-show="controllerAction === 'EDIT'" style="float: right;">Borrar</button>
    </div>
</div>
<div class="row-fluid">
    <div class="span12">
        <ix3-business-messages />
    </div>
</div>      

