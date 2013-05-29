/*
 * Copyright 2013 Lorenzo González.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package es.logongas.encuestas.persistencia.services.dao.educacion;

import es.logongas.encuestas.modelo.educacion.Curso;
import es.logongas.ix3.persistence.services.dao.GenericDAO;

/**
 * DAO del modelo Curso
 * @author Lorenzo González
 */
public interface CursoDAO extends GenericDAO<Curso,Integer> {
    /**
     * Obtiene el curso por el año en el que empieza
     * @param anyo Año de inicio del curso
     * @return El curso o null si no existe.
     */
    Curso getByAnyoInicio(int anyo);
}
