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

import es.logongas.ix3.core.annotations.Caption;
import es.logongas.ix3.core.annotations.ValuesList;
import javax.validation.constraints.NotNull;
import org.hibernate.Hibernate;
import org.hibernate.validator.constraints.NotBlank;

/**
 * Cada uno de los Item a los que se puede responder de una pregunta de la encuesta
 * @author Lorenzo González
 */
public class Item implements Comparable<Item> {
    private int idItem;
    @NotBlank
    private String nombre;
    @Caption("Tipo de Item")
    private TipoItem tipoItem;
    @ValuesList(shortLength = true)
    @Caption("Lista de Valores")
    private ListaValores listaValores;
    @NotNull
    private Pregunta pregunta;
    private boolean requerido;
    private String expresionRegular;
    @Caption("Valor por defecto")
    private String valorDefecto;
    private int idx;

    /**
     * @return the idItem
     */
    public int getIdItem() {
        return idItem;
    }

    /**
     * @param idItem the idItem to set
     */
    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the tipoItem
     */
    public TipoItem getTipoItem() {
        return tipoItem;
    }

    /**
     * @param tipoItem the tipoItem to set
     */
    public void setTipoItem(TipoItem tipoItem) {
        this.tipoItem = tipoItem;
    }

    /**
     * @return the listaValores
     */
    public ListaValores getListaValores() {
        return listaValores;
    }

    /**
     * @param listaValores the listaValores to set
     */
    public void setListaValores(ListaValores listaValores) {
        this.listaValores = listaValores;
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

    @Override
    public int compareTo(Item item) {
        if (item==null) {
            return -1;
        }

        int indexThis=this.getPregunta().getItems().indexOf(this);
        int indexOther=item.getPregunta().getItems().indexOf(item);
        if (indexThis<indexOther) {
            return -1;
        } else if (indexThis>indexOther) {
            return 1;
        } else if (indexThis==indexOther) {
            return 0;
        } else {
            throw new RuntimeException("Error de lógica:"+indexThis + "  " +indexOther) ;
        }
    }

    /**
     * @return the requerido
     */
    public boolean isRequerido() {
        return requerido;
    }

    /**
     * @param requerido the requerido to set
     */
    public void setRequerido(boolean requerido) {
        this.requerido = requerido;
    }

    /**
     * @return the idx
     */
    public int getIdx() {
        return idx;
    }

    /**
     * @param idx the idx to set
     */
    public void setIdx(int idx) {
        this.idx = idx;
    }

    /**
     * @return the expresionRegular
     */
    public String getExpresionRegular() {
        return expresionRegular;
    }

    /**
     * @param expresionRegular the expresionRegular to set
     */
    public void setExpresionRegular(String expresionRegular) {
        this.expresionRegular = expresionRegular;
    }

    /**
     * @return the valorDefecto
     */
    public String getValorDefecto() {
        return valorDefecto;
    }

    /**
     * @param valorDefecto the valorDefecto to set
     */
    public void setValorDefecto(String valorDefecto) {
        this.valorDefecto = valorDefecto;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (Hibernate.getClass(this) != Hibernate.getClass(obj)) {
            return false;
        }

        Item item = (Item) obj;
        int dato1 = getIdItem();
        int dato2 = item.getIdItem();

        if ((dato1 == 0) && (dato2 == 0)) {
            return false;
        } else if (dato1 == dato2) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public int hashCode() {
        int dato1 = getIdItem();
        int resultado = 45;

        resultado = 31 * resultado + dato1;

        return resultado;
    }
    
    
}
