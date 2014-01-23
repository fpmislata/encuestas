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
package es.logongas.encuestas.persistencia.impl.dao.encuestas;

import es.logongas.encuestas.modelo.encuestas.Pregunta;
import es.logongas.encuestas.persistencia.services.dao.encuestas.PreguntaDAO;
import es.logongas.ix3.persistence.impl.hibernate.dao.GenericDAOImplHibernate;
import org.hibernate.Session;

/**
 * DAO de Pregunta
 *
 * @author Lorenzo
 */
public class PreguntaDAOImplHibernate extends GenericDAOImplHibernate<Pregunta, Integer> implements PreguntaDAO {

    @Override
    protected void postInsertInTransaction(Session session, Pregunta pregunta) {
        if (pregunta != null) {
            if (pregunta.getEncuesta().getPreguntas().contains(pregunta) == false) {
                pregunta.getEncuesta().getPreguntas().add(pregunta);

            }
        }
    }

    @Override
    protected void postDeleteInTransaction(Session session, Integer id, Pregunta pregunta) {
        if (pregunta != null) {
            if (pregunta.getEncuesta().getPreguntas().contains(pregunta) == true) {
                pregunta.getEncuesta().getPreguntas().remove(pregunta);
            }
        }
    }

}
