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

import es.logongas.ix3.persistence.services.annotations.Caption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.validator.constraints.NotBlank;

/**
 * Definición de los datos de una encuesta
 * @author Lorenzo González
 */
public class Encuesta {
    private int idEncuesta;
    @NotBlank
    private String nombre;
    private boolean habilitada;
    @es.logongas.ix3.persistence.services.annotations.Date
    @Caption("Fecha de inicio")
    private Date fechaInicio;
    @es.logongas.ix3.persistence.services.annotations.Date  
    @Caption("Fecha de fin")
    private Date fechaFin;
    private boolean imprimir;
    private List<Pregunta> preguntas=new ArrayList<Pregunta>();

    /**
     * @return the IdEncuesta
     */
    public int getIdEncuesta() {
        return idEncuesta;
    }

    /**
     * @param IdEncuesta the IdEncuesta to set
     */
    public void setIdEncuesta(int idEncuesta) {
        this.idEncuesta = idEncuesta;
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
     * @return the fechaInicio
     */
    public Date getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return the fechaFin
     */
    public Date getFechaFin() {
        return fechaFin;
    }

    /**
     * @param fechaFin the fechaFin to set
     */
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    /**
     * @return the preguntas
     */
    public List<Pregunta> getPreguntas() {
        return preguntas;
    }

    /**
     * @param preguntas the preguntas to set
     */
    public void setPreguntas(List<Pregunta> preguntas) {
        this.preguntas = preguntas;
    }

    /**
     * @return the habilitada
     */
    public boolean isHabilitada() {
        return habilitada;
    }

    /**
     * @param habilitada the habilitada to set
     */
    public void setHabilitada(boolean habilitada) {
        this.habilitada = habilitada;
    }

    /**
     * @return the imprimir
     */
    public boolean isImprimir() {
        return imprimir;
    }

    /**
     * @param imprimir the imprimir to set
     */
    public void setImprimir(boolean imprimir) {
        this.imprimir = imprimir;
    }
    
    public Pregunta getPrimeraPregunta() {
        if (preguntas.size()==0) {
            return null;
        } else {
            return preguntas.get(0);
        } 
    }     
    
    public Pregunta getUltimaPregunta() {
        if (preguntas.size()==0) {
            return null;
        } else {
            return preguntas.get(preguntas.size()-1);
        } 
    }
    
   public boolean isEncuestaHabilitada() {
       if (this.habilitada==false) {
           return false;
       }
       
       Date ahora=new Date();
       if (this.fechaInicio!=null) {
           if (ahora.before(this.fechaInicio)){
               return false;
           }
       }
       
       if (this.fechaFin!=null) {
           if (ahora.after(this.fechaFin)){
               return false;
           }
       }       
       
       return true;
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

        Encuesta encuesta = (Encuesta) obj;
        int dato1 = getIdEncuesta();
        int dato2 = encuesta.getIdEncuesta();

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
        int dato1 = getIdEncuesta();
        int resultado = 45;

        resultado = 31 * resultado + dato1;

        return resultado;
    }   
   
   
}
