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

import es.logongas.encuestas.modelo.encuestas.Item;
import es.logongas.ix3.persistence.services.dao.BusinessMessage;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lorenzo González
 */
public class RespuestaItem {

    private int idRespuestaItem;
    private Item item;
    private RespuestaPregunta respuestaPregunta;
    private boolean check;
    private String valor;
    private Double valorNumerico;

    private RespuestaItem() {
    }

    public RespuestaItem(RespuestaPregunta respuestaPregunta, Item item) {
        this.item = item;
        this.respuestaPregunta = respuestaPregunta;
        this.check = false;
        this.valor = null;

        //Hacemos ésto para que se cargen los valores
        //Pq sino luego no hay sesión.
        //@TODO:Que no sea necesaria esta linea.
        if (this.item.getListaValores() != null) {
            int i = this.item.getListaValores().getValores().size();
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

    public List<BusinessMessage> validate() {
        List<BusinessMessage> businessMessages = new ArrayList<BusinessMessage>();

        switch (this.getItem().getTipoItem()) {
            case Sino:
                //No se valida un Check
                break;
            case ListaValores:
                if ((this.getValor() == null) || (this.getValor().trim().equals(""))) {
                    if (this.getItem().isRequerido() == true) {
                        businessMessages.add(new BusinessMessage(null, "El valor de '" + this.getItem().getNombre() + "' no puede estar vacío"));
                    }
                } else {
                    if (this.getItem().getListaValores().contiene(this.getValor()) == false) {
                        businessMessages.add(new BusinessMessage(null, "El valor '" + this.getValor() + "' de '" + this.getItem().getNombre() + "' no es válido"));
                    }
                }
                break;
            case Texto:
                if ((this.getValor() == null) || (this.getValor().trim().equals(""))) {
                    if (this.getItem().isRequerido() == true) {
                        businessMessages.add(new BusinessMessage(null, "El valor de '" + this.getItem().getNombre() + "' no puede estar vacío"));
                    }
                }
                break;
            case Fecha:
                if ((this.getValor() == null) || (this.getValor().trim().equals(""))) {
                    if (this.getItem().isRequerido() == true) {
                        businessMessages.add(new BusinessMessage(null, "La fecha de '" + this.getItem().getNombre() + "' no puede estar vacío"));
                    }
                }
                SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
                sdf.setLenient(false);
                try {
                    Date date = sdf.parse(this.getValor());
                } catch (ParseException ex) {
                    businessMessages.add(new BusinessMessage(null, "La fecha '" + this.getValor() + "' de '" + this.getItem().getNombre() + "' no es válido"));
                }
                break;
            case AreaTexto:
                if ((this.getValor() == null) || (this.getValor().trim().equals(""))) {
                    if (this.getItem().isRequerido() == true) {
                        businessMessages.add(new BusinessMessage(null, "El texto no puede estar vacío"));
                    }
                }
                if (this.getValor()!=null) {
                    if (this.getValor().length()>1000) {
                        businessMessages.add(new BusinessMessage(null, "El texto es demasiado largo"));
                    }
                }

                break;
            default:
                throw new RuntimeException("El tipo de item es desconocido:" + this.getItem().getTipoItem());
        }

        return businessMessages;
    }

    /**
     * @return the valorNumerico
     */
    public Double getValorNumerico() {
        return valorNumerico;
    }

    /**
     * @param valorNumerico the valorNumerico to set
     */
    public void setValorNumerico(Double valorNumerico) {
        this.valorNumerico = valorNumerico;
    }
}
