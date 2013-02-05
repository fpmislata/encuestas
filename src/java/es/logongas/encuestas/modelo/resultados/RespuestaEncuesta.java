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

import es.logongas.encuestas.modelo.encuestas.Encuesta;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Lorenzo González
 */
public class RespuestaEncuesta {
    private int idRespuestaEncuesta;
    private Encuesta encuesta;
    private List<RespuestaPregunta> respuestaPreguntas;
    private Date fechaRespuesta;

    /**
     * @return the idRespuestaEncuesta
     */
    public int getIdRespuestaEncuesta() {
        return idRespuestaEncuesta;
    }

    /**
     * @param idRespuestaEncuesta the idRespuestaEncuesta to set
     */
    public void setIdRespuestaEncuesta(int idRespuestaEncuesta) {
        this.idRespuestaEncuesta = idRespuestaEncuesta;
    }

    /**
     * @return the encuesta
     */
    public Encuesta getEncuesta() {
        return encuesta;
    }

    /**
     * @param encuesta the encuesta to set
     */
    public void setEncuesta(Encuesta encuesta) {
        this.encuesta = encuesta;
    }

    /**
     * @return the respuestaPreguntas
     */
    public List<RespuestaPregunta> getRespuestaPreguntas() {
        return respuestaPreguntas;
    }

    /**
     * @param respuestaPreguntas the respuestaPreguntas to set
     */
    public void setRespuestaPreguntas(List<RespuestaPregunta> respuestaPreguntas) {
        this.respuestaPreguntas = respuestaPreguntas;
    }

    /**
     * @return the fechaRespuesta
     */
    public Date getFechaRespuesta() {
        return fechaRespuesta;
    }

    /**
     * @param fechaRespuesta the fechaRespuesta to set
     */
    public void setFechaRespuesta(Date fechaRespuesta) {
        this.fechaRespuesta = fechaRespuesta;
    }
}
