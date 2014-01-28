<div class="row-fluid" >
    <div class="span12">
        <ol class="breadcrumb">
            
            <li><a href="#/encuesta/edit/{{model.pregunta.encuesta.idEncuesta}}">Encuesta ({{model.pregunta.encuesta.nombre | limitTo: 25}})</a> <span class="divider">/</span></li>
            <li><a href="#/pregunta/edit/{{model.pregunta.idPregunta}}/encuesta.idEncuesta/{{model.pregunta.encuesta.idEncuesta}}">Pregunta ({{model.pregunta.pregunta | limitTo: 25}})</a> <span class="divider">/</span></li>
            <li class="active">Item</li>
        </ol>
    </div>
</div>
<div class="row-fluid" >
    <div class="span12" >
        <form name="mainForm" class="form-horizontal" id="mainForm" >
            <fieldset>
                <legend>Item</legend>
                <ix3-input model="nombre" ></ix3-input>

                <div class="row-fluid" ng-show="model.pregunta.tipoPregunta==='EspecificoPorItem'">
                    <div class="span6">
                        <ix3-input model="tipoItem" ></ix3-input>
                    </div>
                    <div class="span6">
                        <ix3-input model="listaValores" ></ix3-input>    
                    </div>
                </div>
                <ix3-input model="requerido" ></ix3-input>
                <ix3-input model="expresionRegular" ></ix3-input>
                <ix3-input model="valorDefecto" ></ix3-input>
                
            </fieldset>
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

