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
        <form name="mainForm" id="mainForm" >
            <fieldset>
                <legend>Item</legend>
                <!-- Text input-->
                <div class="control-group">
                    <label class="control-label" for="nombre">Nombre</label>
                    <div class="controls">
                        <input id="nombre" name="nombre" ng-model="model.nombre" type="text" placeholder="Nombre del Item" class="input-block-level" >

                    </div>
                </div>
                <div class="control-group" ng-show="model.pregunta.tipoPregunta==='EspecificoPorItem'">

                    <div class="span3">
                        <div class="control-group" >
                            <label class="control-label" for="tipoItem">Tipo de Item</label>
                            <div class="controls">
                                <select id="tipoItem" name="tipoItem" ng-model="model.tipoItem" class="input-large" ng-options="key as value for (key , value) in metadata['Item'].properties['tipoItem'].values">
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="span9">
                        <div class="control-group" ix3-visibility="model.tipoItem==='ListaValores'">
                            <label class="control-label" for="listaValores" >Lista de Valores</label>
                            <div class="controls">
                                <select id="listaValores"  ix3-clear="model.tipoItem!=='ListaValores'" name="listaValores" ng-model="model.listaValores.idListaValores" class="input-xlarge" ng-options="key*1 as value for (key , value) in metadata['Item'].properties['listaValores'].values">
                                    <option value="">--Elige opcion--</option>
                                </select>
                            </div>
                        </div>         


                    </div>

                </div>
                <!-- Select Basic -->


                <!-- Select Basic -->


                <!-- Multiple Checkboxes (inline) -->
                <div class="control-group">
                    <div class="controls">
                        <label class="checkbox inline" for="requerido" style="white-space:nowrap;">
                            <input type="checkbox" name="requerido" ng-model="model.requerido" id="requerido" value="requerido">
                            La respuesta del usuario a este Item es obligatoria
                        </label>
                    </div>
                </div>

                <!-- Text input-->
                <div class="control-group">
                    <label class="control-label" for="expresionRegular">Expresion Regular de Validacion</label>
                    <div class="controls">
                        <input id="expresionRegular" name="expresionRegular" ng-model="model.expresionRegular" type="text" placeholder="validación a cumplir la respuesta del usuario" class="input-xlarge">
                        <p class="help-block">Expresión que debe cumplir para ser válido (Ej: un CP es [0-9]{5})</p>
                    </div>
                </div>

                <!-- Text input-->
                <div class="control-group">
                    <label class="control-label" for="valorDefecto">Valor por defecto</label>
                    <div class="controls">
                        <input id="valorDefecto" name="valorDefecto" ng-model="model.valorDefecto" type="text" placeholder="" class="input-xlarge">
                    </div>
                </div>

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
        <ix3-business-messages />
    </div>
</div>      

