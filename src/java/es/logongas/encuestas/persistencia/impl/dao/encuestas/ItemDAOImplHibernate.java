/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.persistencia.impl.dao.encuestas;

import es.logongas.encuestas.modelo.encuestas.Item;
import es.logongas.encuestas.persistencia.services.dao.encuestas.ItemDAO;
import es.logongas.ix3.dao.impl.GenericDAOImplHibernate;
import org.hibernate.Session;

/**
 *
 * @author Lorenzo
 */
public class ItemDAOImplHibernate extends GenericDAOImplHibernate<Item, Integer> implements ItemDAO {

    @Override
    protected void postInsertInTransaction(Session session, Item item) {
        if (item != null) {
            if (item.getPregunta().getItems().contains(item) == false) {
                item.getPregunta().getItems().add(item);
            }
        }
    }

    @Override
    protected void postDeleteInTransaction(Session session, Integer id, Item item) {
        if (item != null) {
            if (item.getPregunta().getItems().contains(item) == true) {
                item.getPregunta().getItems().remove(item);
            }
        }
    }

}
