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

/**
 * Cada uno de los valores de la lista de valores
 * @author Lorenzo González
 */
public class Valor {
    private int idValor;
    private String nombre;
    private ListaValores listaValores;
    private Integer valorNumerico;

    /**
     * @return the idValor
     */
    public int getIdValor() {
        return idValor;
    }

    /**
     * @param idValor the idValor to set
     */
    public void setIdValor(int idValor) {
        this.idValor = idValor;
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
     * @return the valorNumerico
     */
    public Integer getValorNumerico() {
        return valorNumerico;
    }

    /**
     * @param valorNumerico the valorNumerico to set
     */
    public void setValorNumerico(Integer valorNumerico) {
        this.valorNumerico = valorNumerico;
    }
}
