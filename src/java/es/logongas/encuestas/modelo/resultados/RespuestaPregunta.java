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
package es.logongas.encuestas.modelo.resultados;

import es.logongas.encuestas.modelo.encuestas.Item;
import es.logongas.encuestas.modelo.encuestas.Pregunta;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lorenzo González
 */
public class RespuestaPregunta {
    private int idRespuestaPregunta;
    private RespuestaEncuesta respuestaEncuesta;
    private Pregunta pregunta;
    private List<RespuestaItem> respuestaItems=new ArrayList<RespuestaItem>();

    private RespuestaPregunta() {
    }

    public RespuestaPregunta(RespuestaEncuesta respuestaEncuesta,Pregunta pregunta) {
        if (respuestaEncuesta==null) {
            throw new IllegalArgumentException("El argumento respuestaEncuesta no puede ser null");
        }    
        if (pregunta==null) {
            throw new IllegalArgumentException("El argumento pregunta no puede ser null");
        }         
        this.respuestaEncuesta=respuestaEncuesta;
        this.pregunta=pregunta;
          
        for(Item item:this.pregunta.getItems()) {
            RespuestaItem respuestaItem=new RespuestaItem(this,item);
            
            this.respuestaItems.add(respuestaItem);
        }        
        
    }    
    
   public Pregunta siguiente() {
        return this.pregunta.siguiente();
    }

    public Pregunta anterior() {
        return this.pregunta.anterior();
    }    
    
    /**
     * @return the idRespuestaPregunta
     */
    public int getIdRespuestaPregunta() {
        return idRespuestaPregunta;
    }

    /**
     * @param idRespuestaPregunta the idRespuestaPregunta to set
     */
    public void setIdRespuestaPregunta(int idRespuestaPregunta) {
        this.idRespuestaPregunta = idRespuestaPregunta;
    }

    /**
     * @return the respuestaEncuesta
     */
    public RespuestaEncuesta getRespuestaEncuesta() {
        return respuestaEncuesta;
    }

    /**
     * @param respuestaEncuesta the respuestaEncuesta to set
     */
    public void setRespuestaEncuesta(RespuestaEncuesta respuestaEncuesta) {
        this.respuestaEncuesta = respuestaEncuesta;
    }

    /**
     * @return the pregunta
     */
    public Pregunta getPregunta() {
        return pregunta;
    }

    /**
     * @param pregunta the pregunta to set
     */
    public void setPregunta(Pregunta pregunta) {
        this.pregunta = pregunta;
    }

    /**
     * @return the respuestaItems
     */
    public List<RespuestaItem> getRespuestaItems() {
        return respuestaItems;
    }

    /**
     * @param respuestaItems the respuestaItems to set
     */
    public void setRespuestaItems(List<RespuestaItem> respuestaItems) {
        this.respuestaItems = respuestaItems;
    }
}
