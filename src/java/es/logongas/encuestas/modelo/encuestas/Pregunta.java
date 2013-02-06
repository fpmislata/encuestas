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

import java.util.List;

/**
 *
 * @author Lorenzo González
 */
public class Pregunta {
    private int idPregunta;
    private String pregunta;
    private Encuesta encuesta;
    private List<Item> items;
    private TipoPregunta tipoPregunta;
    private boolean ultimoItemIncluyeOtros;

    /**
     * @return the IdPregunta
     */
    public int getIdPregunta() {
        return idPregunta;
    }

    /**
     * @param IdPregunta the IdPregunta to set
     */
    public void setIdPregunta(int idPregunta) {
        this.idPregunta = idPregunta;
    }

    /**
     * @return the pregunta
     */
    public String getPregunta() {
        return pregunta;
    }

    /**
     * @param pregunta the pregunta to set
     */
    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
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
     * @return the items
     */
    public List<Item> getItems() {
        return items;
    }

    /**
     * @param items the items to set
     */
    public void setItems(List<Item> items) {
        this.items = items;
    }

    /**
     * @return the tipoPregunta
     */
    public TipoPregunta getTipoPregunta() {
        return tipoPregunta;
    }

    /**
     * @param tipoPregunta the tipoPregunta to set
     */
    public void setTipoPregunta(TipoPregunta tipoPregunta) {
        this.tipoPregunta = tipoPregunta;
    }

    /**
     * @return the ultimoItemIncluyeOtros
     */
    public boolean isUltimoItemIncluyeOtros() {
        return ultimoItemIncluyeOtros;
    }

    /**
     * @param ultimoItemIncluyeOtros the ultimoItemIncluyeOtros to set
     */
    public void setUltimoItemIncluyeOtros(boolean ultimoItemIncluyeOtros) {
        this.ultimoItemIncluyeOtros = ultimoItemIncluyeOtros;
    }
    
    public boolean isPrimera() {
        int index=encuesta.getPreguntas().indexOf(this);
        
        if (index<0) {
            throw new RuntimeException("No existe la pregunta en la encuesta");
        }
        
        if (index==0) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean isUltima() {
        int index=encuesta.getPreguntas().indexOf(this);
        
        if (index<0) {
            throw new RuntimeException("No existe la pregunta en la encuesta");
        }
        
        if ((index+1)==encuesta.getPreguntas().size()) {
            return true;
        } else {
            return false;
        }        
    }    
    
}
