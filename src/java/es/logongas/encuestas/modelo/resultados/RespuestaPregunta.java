/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
