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

import es.logongas.encuestas.modelo.encuestas.Pregunta;
import java.util.List;

/**
 *
 * @author Lorenzo González
 */
class RespuestaPregunta {
    private int idRespuestaPregunta;
    private RespuestaEncuesta respuestaEncuesta;
    private Pregunta pregunta;
    private List<RespuestaItem> respuestaItems;

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
