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

import java.util.ArrayList;
import java.util.List;

/**
 * Lista con los posibles valores de una respuesta de un Item
 * @author Lorenzo González
 */
public class ListaValores {
    private int idListaValores;
    private String nombre;
    private List<Valor> valores=new ArrayList<Valor>();
    private boolean contieneValoresNumericos;

    /**
     * @return the idListaValores
     */
    public int getIdListaValores() {
        return idListaValores;
    }

    /**
     * @param idListaValores the idListaValores to set
     */
    public void setIdListaValores(int idListaValores) {
        this.idListaValores = idListaValores;
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
     * @return the valores
     */
    public List<Valor> getValores() {
        return valores;
    }

    /**
     * @param valores the valores to set
     */
    public void setValores(List<Valor> valores) {
        this.valores = valores;
    }

    public boolean contiene(String nombre) {
        for(Valor valor:this.valores) {
            if (valor.getNombre().equals(nombre)) {
                return true;
            }
        }

        return false;
    }

    /**
     * @return the contieneValoresNumericos
     */
    public boolean isContieneValoresNumericos() {
        return contieneValoresNumericos;
    }

    /**
     * @param contieneValoresNumericos the contieneValoresNumericos to set
     */
    public void setContieneValoresNumericos(boolean contieneValoresNumericos) {
        this.contieneValoresNumericos = contieneValoresNumericos;
    }

}
