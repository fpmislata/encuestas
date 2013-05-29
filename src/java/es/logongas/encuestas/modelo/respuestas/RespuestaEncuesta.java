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
package es.logongas.encuestas.modelo.respuestas;

import es.logongas.encuestas.modelo.educacion.Curso;
import es.logongas.encuestas.modelo.encuestas.Encuesta;
import es.logongas.encuestas.modelo.encuestas.Pregunta;
import es.logongas.ix3.persistence.services.dao.BusinessMessage;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Lorenzo González
 */
public class RespuestaEncuesta {

    private int idRespuestaEncuesta;
    private Encuesta encuesta;
    private List<RespuestaPregunta> respuestaPreguntas = new ArrayList<RespuestaPregunta>();
    private Date fechaRespuesta;
    private Curso curso;

    private RespuestaEncuesta() {
    }

    public RespuestaEncuesta(Encuesta encuesta) {
        if (encuesta == null) {
            throw new IllegalArgumentException("El argumento encuesta no puede ser null");
        }
        this.encuesta = encuesta;

        for (Pregunta pregunta : this.encuesta.getPreguntas()) {
            RespuestaPregunta respuestaPregunta = new RespuestaPregunta(this, pregunta);

            this.respuestaPreguntas.add(respuestaPregunta);
        }

    }

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

    public boolean isPreguntaValida(Pregunta pregunta) {
        if (getRespuestaPregunta(pregunta) != null) {
            return true;
        } else {
            return false;
        }
    }

    public RespuestaPregunta getRespuestaPregunta(Pregunta pregunta) {
        for (RespuestaPregunta respuestaPregunta : this.respuestaPreguntas) {
            if (respuestaPregunta.getPregunta().equals(pregunta)) {
                return respuestaPregunta;
            }
        }

        return null;
    }

    public Documento getDocumento() {
        return null;
    }

    public Pregunta getPrimeraPregunta() {
        return encuesta.getPrimeraPregunta();
    }

    public Pregunta getUltimaPregunta() {
        return encuesta.getUltimaPregunta();
    }

    public List<BusinessMessage> validate() {
        List<BusinessMessage> businessMessages = new ArrayList<BusinessMessage>();

        for (RespuestaPregunta respuestaPregunta : this.respuestaPreguntas) {
            businessMessages.addAll(respuestaPregunta.validate());
        }

        return businessMessages;
    }

    /**
     * @return the curso
     */
    public Curso getCurso() {
        return curso;
    }

    /**
     * @param curso the curso to set
     */
    public void setCurso(Curso curso) {
        this.curso = curso;
    }
}
