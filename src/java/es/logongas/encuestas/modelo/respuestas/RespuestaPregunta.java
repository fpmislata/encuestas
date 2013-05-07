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
import es.logongas.encuestas.modelo.encuestas.Pregunta;
import es.logongas.ix3.persistence.services.dao.BusinessMessage;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lorenzo González
 */
public class RespuestaPregunta {

    private int idRespuestaPregunta;
    private RespuestaEncuesta respuestaEncuesta;
    private Pregunta pregunta;
    private List<RespuestaItem> respuestaItems = new ArrayList<RespuestaItem>();

    private RespuestaPregunta() {
    }

    public RespuestaPregunta(RespuestaEncuesta respuestaEncuesta, Pregunta pregunta) {
        if (respuestaEncuesta == null) {
            throw new IllegalArgumentException("El argumento respuestaEncuesta no puede ser null");
        }
        if (pregunta == null) {
            throw new IllegalArgumentException("El argumento pregunta no puede ser null");
        }
        this.respuestaEncuesta = respuestaEncuesta;
        this.pregunta = pregunta;

        for (Item item : this.pregunta.getItems()) {
            RespuestaItem respuestaItem = new RespuestaItem(this, item);

            this.respuestaItems.add(respuestaItem);
        }

    }

    public Pregunta siguiente() {
        return this.pregunta.siguiente();
    }

    public Pregunta anterior() {
        return this.pregunta.anterior();
    }

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

    public List<BusinessMessage> validate() {
        List<BusinessMessage> businessMessages = new ArrayList<BusinessMessage>();

        switch (this.getPregunta().getTipoPregunta()) {
            case Radio:
            case Check:
                //Debe haber alguno marcado
                if (isAnyItemCheck() == false) {
                    if (this.getPregunta().isRequerido()==true) {
                        businessMessages.add(new BusinessMessage(null, "Se debe marcar alguna respuesta"));
                    }
                }

                if (this.getPregunta().isUltimoItemIncluyeOtros()) {
                    RespuestaItem ultimoRespuestaItem = this.respuestaItems.get(this.respuestaItems.size() - 1);
                    if (ultimoRespuestaItem.isCheck() == true) {
                        String valor = ultimoRespuestaItem.getValor();
                        if ((valor == null) || (valor.trim().equals(""))) {
                            businessMessages.add(new BusinessMessage(null, "No puede estar vacía la respuesta de '" + ultimoRespuestaItem.getItem().getNombre() + "'"));
                        }
                    }
                }

                break;
            case EspecificoPorItem:
                for (RespuestaItem respuestaItem : this.respuestaItems) {
                    businessMessages.addAll(respuestaItem.validate());
                }
                break;
            default:
                throw new RuntimeException("El tipo de pregunta es desconocido:" + this.getPregunta().getTipoPregunta());
        }

        return businessMessages;
    }

    private boolean isAnyItemCheck() {
        for (RespuestaItem respuestaItem : this.respuestaItems) {
            if (respuestaItem.isCheck() == true) {
                return true;
            }
        }

        return false;
    }
}
