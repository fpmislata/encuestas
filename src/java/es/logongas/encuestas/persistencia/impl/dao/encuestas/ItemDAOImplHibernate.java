/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package es.logongas.encuestas.persistencia.impl.dao.encuestas;

import es.logongas.encuestas.modelo.encuestas.Item;
import es.logongas.encuestas.modelo.encuestas.Pregunta;
import es.logongas.encuestas.persistencia.services.dao.encuestas.ItemDAO;
import es.logongas.encuestas.persistencia.services.dao.encuestas.PreguntaDAO;
import es.logongas.ix3.persistence.impl.hibernate.dao.GenericDAOImplHibernate;
import org.hibernate.Session;

/**
 *
 * @author Lorenzo
 */
public class ItemDAOImplHibernate extends GenericDAOImplHibernate<Item, Integer> implements ItemDAO  {

    @Override
    protected void postInsertInTransaction(Session session, Item item) {
        if (item!=null) {
            item.getPregunta().getItems().add(item);
        }
    }

    @Override
    protected void postDeleteInTransaction(Session session, Integer id, Item item) {
        if (item!=null) {
            item.getPregunta().getItems().remove(item);
        }
    }

}