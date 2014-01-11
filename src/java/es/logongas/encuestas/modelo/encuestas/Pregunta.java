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
import javax.validation.constraints.NotNull;
import org.hibernate.Hibernate;
import org.hibernate.validator.constraints.NotBlank;

/**
 * Cada una de las preguntas de una encuesta. Cada Pregunta tiene varios Items a
 * responder.
 *
 * @author Lorenzo González
 */
public class Pregunta implements Comparable<Pregunta> {

    private int idPregunta;
    @NotBlank
    private String pregunta;
    private String pie;
    @NotNull
    private Encuesta encuesta;
    private List<Item> items;
    @NotNull
    private TipoPregunta tipoPregunta;
    private boolean ultimoItemIncluyeOtros;
    private boolean requerido;
    private int idx;

    /**
     * @return the IdPregunta
     */
    public int getIdPregunta() {
        return idPregunta;
    }

    /**
     * @param IdPregunta the IdPregunta to set
     */
    public void setIdPregunta(int idPregunta) {
        this.idPregunta = idPregunta;
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
     * @return the encuesta
     */
    public Encuesta getEncuesta() {
        return encuesta;
    }

    /**
     * @param encuesta the encuesta to set
     */
    public void setEncuesta(Encuesta encuesta) {
        this.encuesta = encuesta;
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

    public Pregunta siguiente() {
        int index = encuesta.getPreguntas().indexOf(this);

        index++;

        if (index < encuesta.getPreguntas().size()) {
            return encuesta.getPreguntas().get(index);
        } else {
            return null;
        }
    }

    public Pregunta anterior() {
        int index = encuesta.getPreguntas().indexOf(this);

        index--;

        if (index >= 0) {
            return encuesta.getPreguntas().get(index);
        } else {
            return null;
        }
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

        Pregunta usuario = (Pregunta) obj;
        int dato1 = getIdPregunta();
        int dato2 = usuario.getIdPregunta();

        if (dato1 <= 0) {
            if (dato2 <= 0) {
                return true;
            } else {
                return false;
            }
        } else if (dato1 == dato2) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public int hashCode() {
        int dato1 = getIdPregunta();
        int resultado = 45;

        resultado = 31 * resultado + dato1;

        return resultado;
    }

    @Override
    public int compareTo(Pregunta pregunta) {
        if (pregunta==null) {
            return -1;
        }

        int indexThis=this.getEncuesta().getPreguntas().indexOf(this);
        int indexOther=pregunta.getEncuesta().getPreguntas().indexOf(pregunta);
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
     * @return the pie
     */
    public String getPie() {
        return pie;
    }

    /**
     * @param pie the pie to set
     */
    public void setPie(String pie) {
        this.pie = pie;
    }
}
