<div class="row-fluid" >
    <div class="span12" >
        <form class="form-horizontal" name="mainForm" id="mainForm">
            <fieldset>

                <!-- Form Name -->
                <legend>Pregunta</legend>

                <div class="control-group">
                    <label class="control-label" for="tipoPregunta">Tipo de Pregunta</label>
                    <div class="controls">
                        <select id="tipoPregunta" name="tipoPregunta" ng-model="model.tipoPregunta" class="input-large" ng-options="key as value for (key , value) in metadata['Pregunta'].properties['tipoPregunta'].values">
                            <option>-- Elige pregunta --</option>
                        </select>
                    </div>
                </div>
                <!-- Text input-->
                <div class="control-group">
                    <label class="control-label" for="pregunta">Pregunta</label>
                    <div class="controls">
                        <input id="pregunta" name="pregunta" ng-model="model.pregunta" type="text" placeholder="pregunta a realizar" class="input-block-level" required="">

                    </div>
                </div>

                <!-- Text input-->
                <div class="control-group">
                    <label class="control-label" for="pie">Pie</label>
                    <div class="controls">
                        <input id="pie" name="pie" ng-model="model.pie"  type="text" placeholder="" class="input-xlarge">
                        <p class="help-block">Texto que aparece al pie de la pregunta</p>
                    </div>
                </div>

                <!-- Multiple Checkboxes (inline) -->
                <div class="control-group">
                    <div class="controls">
                        <label class="checkbox inline" for="ultimoItemIncluyeOtros" style="white-space:nowrap;">
                            <input type="checkbox" name="ultimoItemIncluyeOtros" id="ultimoItemIncluyeOtros" ng-model="model.ultimoItemIncluyeOtros"  id="ultimoItemIncluyeOtros" >
                                   El último Item incluirá un texto libre para "Otros".
                        </label>
                    </div>
                </div>

                <!-- Multiple Checkboxes (inline) -->
                <div class="control-group">
                    <div class="controls">
                        <label class="checkbox inline" for="requerido" style="white-space:nowrap;">
                            <input type="checkbox" name="requerido" id="requerido" ng-model="model.requerido" >
                            Es obligatorio responder a la pregunta
                        </label>
                    </div>
                </div>

            </fieldset>
        </form>

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

