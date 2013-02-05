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
public class Item {
    private int idItem;
    private String nombre;
    private TipoItem tipoItem;
    private List<String> listaValores;

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
    public List<String> getListaValores() {
        return listaValores;
    }

    /**
     * @param listaValores the listaValores to set
     */
    public void setListaValores(List<String> listaValores) {
        this.listaValores = listaValores;
    }
}
