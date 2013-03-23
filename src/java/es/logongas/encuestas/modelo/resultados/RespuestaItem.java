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
public class RespuestaItem {
    private int idRespuestaItem;
    private Item item;
    private RespuestaPregunta respuestaPregunta;
    private Boolean check;
    private String valor;

    private RespuestaItem() {
    }

    public RespuestaItem( RespuestaPregunta respuestaPregunta,Item item) {
        this.item = item;
        this.respuestaPregunta = respuestaPregunta;
        this.check = false;
        this.valor = null;

        //Hacemos ésto para que se cargen los valores
        //Pq sino luego no hay sesión. 
        //@TODO:Que no sea necesaria esta linea.
        if (this.item.getListaValores()!=null) {
            int i=this.item.getListaValores().getValores().size();
        }

    }





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
    public Boolean isCheck() {
        return check;
    }

    /**
     * @param check the check to set
     */
    public void setCheck(Boolean check) {
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
