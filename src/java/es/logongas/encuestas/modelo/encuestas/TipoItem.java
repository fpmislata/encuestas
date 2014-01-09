/*
 * Copyright 2013 Lorenzo González.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package es.logongas.encuestas.modelo.encuestas;

/**
 *
 * @author Lorenzo González
 */
public enum TipoItem {
    Sino("Si/No"),
    ListaValores("Lista de Valores"),
    Texto("Texto"),
    Fecha("Fecha"),
    AreaTexto("Area de Texto");
    
    String text;

    private TipoItem(String text) {
        this.text = text;
    }
    
    
   @Override
   public String toString() {
        return text;
    }  
    
    
}
