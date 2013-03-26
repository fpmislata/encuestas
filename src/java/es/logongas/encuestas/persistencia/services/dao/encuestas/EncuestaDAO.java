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
package es.logongas.encuestas.persistencia.services.dao.encuestas;

import es.logongas.encuestas.modelo.encuestas.Encuesta;
import es.logongas.encuestas.modelo.encuestas.Estadistica;
import es.logongas.encuestas.modelo.encuestas.Item;
import es.logongas.encuestas.modelo.encuestas.Pregunta;
import es.logongas.ix3.persistencia.services.dao.GenericDAO;

/**
 *
 * @author Lorenzo González
 */
public interface EncuestaDAO extends GenericDAO<Encuesta,Integer>  {

    Estadistica getEstadisticaItem(Item item);
    Estadistica getEstadisticaPregunta(Pregunta pregunta);
}
