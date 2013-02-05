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

/**
 *
 * @author Lorenzo González
 */
class RespuestaItem {
    private int idRespuestaItem;
    private Item item;
    private RespuestaPregunta respuestaPregunta;
    private boolean check;
    private String valor;    

    /**
     * @return the idRespuestaItem
     */
    public int getIdRespuestaItem() {
        return idRespuestaItem;
    }

    /**
     * @param idRespuestaItem the idRespuestaItem to set
     */
    public void setIdRespuestaItem(int idRespuestaItem) {
        this.idRespuestaItem = idRespuestaItem;
    }

    /**
     * @return the item
     */
    public Item getItem() {
        return item;
    }

    /**
     * @param item the item to set
     */
    public void setItem(Item item) {
        this.item = item;
    }

    /**
     * @return the respuestaPregunta
     */
    public RespuestaPregunta getRespuestaPregunta() {
        return respuestaPregunta;
    }

    /**
     * @param respuestaPregunta the respuestaPregunta to set
     */
    public void setRespuestaPregunta(RespuestaPregunta respuestaPregunta) {
        this.respuestaPregunta = respuestaPregunta;
    }

    /**
     * @return the check
     */
    public boolean isCheck() {
        return check;
    }

    /**
     * @param check the check to set
     */
    public void setCheck(boolean check) {
        this.check = check;
    }

    /**
     * @return the valor
     */
    public String getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(String valor) {
        this.valor = valor;
    }

}
