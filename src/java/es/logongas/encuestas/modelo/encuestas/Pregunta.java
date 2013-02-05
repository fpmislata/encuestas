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
    private int IdPregunta;
    private String pregunta;
    private List<Item> items;
    private TipoPregunta tipoPregunta;
    private boolean ultimoItemIncluyeOtros;

    /**
     * @return the IdPregunta
     */
    public int getIdPregunta() {
        return IdPregunta;
    }

    /**
     * @param IdPregunta the IdPregunta to set
     */
    public void setIdPregunta(int IdPregunta) {
        this.IdPregunta = IdPregunta;
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
}
