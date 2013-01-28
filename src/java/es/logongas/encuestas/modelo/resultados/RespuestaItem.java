/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
