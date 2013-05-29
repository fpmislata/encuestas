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
package es.logongas.encuestas.persistencia.impl.dao.educacion;

import es.logongas.encuestas.modelo.educacion.Curso;
import es.logongas.encuestas.persistencia.services.dao.educacion.CursoDAO;
import es.logongas.ix3.persistence.impl.hibernate.dao.GenericDAOImplHibernate;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 * Implementación del DAO de curso
 * @author Lorenzo González
 */
public class CursoDAOImplHibernate extends GenericDAOImplHibernate<Curso, Integer> implements CursoDAO {

    @Override
    public Curso getByAnyoInicio(int anyo) {
        Session session = sessionFactory.getCurrentSession();

        Criteria criteria = session.createCriteria(Curso.class);
        criteria.add(Restrictions.eq("anyoInicio", anyo));

        return (Curso)criteria.uniqueResult();
    }

}
