/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.presentacion.controller;

import es.logongas.encuestas.modelo.resultados.RespuestaEncuesta;
import java.net.URI;
import java.net.URL;

/**
 *
 * @author Lorenzo González
 */
public class EncuestaState {
    private RespuestaEncuesta respuestaEncuesta;
    private URI backURI;

    public EncuestaState(RespuestaEncuesta respuestaEncuesta, URI backURI) {
        if (respuestaEncuesta==null) {
            throw new IllegalArgumentException("El argumento respuestaEncuesta no puede ser null");
        }
        if (backURI==null) {
            throw new IllegalArgumentException("El argumento backURL no puede ser null");
        }
        
        this.respuestaEncuesta = respuestaEncuesta;
        this.backURI = backURI;
    }
    
    /**
     * @return the respuestaEncuesta
     */
    public RespuestaEncuesta getRespuestaEncuesta() {
        return respuestaEncuesta;
    }

    /**
     * @return the backURL
     */
    public URI getBackURI() {
        return backURI;
    }
}
