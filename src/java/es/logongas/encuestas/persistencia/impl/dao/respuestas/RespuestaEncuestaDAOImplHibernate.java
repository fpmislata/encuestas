/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.persistencia.impl.dao.respuestas;

import es.logongas.encuestas.modelo.educacion.Curso;
import es.logongas.encuestas.modelo.respuestas.RespuestaEncuesta;
import es.logongas.encuestas.persistencia.services.dao.respuestas.RespuestaEncuestaDAO;
import es.logongas.ix3.persistence.impl.hibernate.dao.GenericDAOImplHibernate;
import es.logongas.util.seguridad.CodigoVerificacionSeguro;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Lorenzo González
 */
public class RespuestaEncuestaDAOImplHibernate extends GenericDAOImplHibernate<RespuestaEncuesta, Integer> implements RespuestaEncuestaDAO  {

    @Override
    public RespuestaEncuesta getByCodigoVerificacionSeguro(CodigoVerificacionSeguro codigoVerificacionSeguro) {
        if (codigoVerificacionSeguro==null) {
            throw new IllegalArgumentException("El argumento codigoVerificacionSeguro no puede ser null");
        }
        if (codigoVerificacionSeguro.isValido()==false) {
            throw new IllegalArgumentException("El argumento codigoVerificacionSeguro no es válido");
        }
        Session session = sessionFactory.getCurrentSession();

        Criteria criteria = session.createCriteria(RespuestaEncuesta.class);
        criteria.add(Restrictions.eq("codigoVerificacionSeguro.valor", codigoVerificacionSeguro.getValor()));

        return (RespuestaEncuesta)criteria.uniqueResult();
    }

}
