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
package es.logongas.encuestas.modelo.educacion;

/**
 *
 * @author Lorenzo González
 */
public class Curso {
    private int idCurso;
    private int anyoInicio;

    public Curso() {
    }

    

    @Override
    public String toString() {
        return anyoInicio+"-"+(anyoInicio+1);
    }

    public Curso(int anyoInicio) {
        this.anyoInicio = anyoInicio;
    }



    /**
     * @return the idCurso
     */
    public int getIdCurso() {
        return idCurso;
    }

    /**
     * @param idCurso the idCurso to set
     */
    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    /**
     * @return the anyoInicio
     */
    public int getAnyoInicio() {
        return anyoInicio;
    }

    /**
     * @param anyoInicio the anyoInicio to set
     */
    public void setAnyoInicio(int anyoInicio) {
        this.anyoInicio = anyoInicio;
    }

}
