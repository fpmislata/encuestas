/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
