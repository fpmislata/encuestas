/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.persistencia.impl.dao.encuestas;

import es.logongas.encuestas.modelo.encuestas.Encuesta;
import es.logongas.encuestas.modelo.estadisticas.Estadistica;
import es.logongas.encuestas.persistencia.services.dao.encuestas.EncuestaDAO;
import es.logongas.ix3.persistencia.impl.hibernate.dao.GenericDAOImplHibernate;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Lorenzo González
 */
public class EncuestaDAOImplHibernate extends GenericDAOImplHibernate<Encuesta, Integer> implements EncuestaDAO {

    @Override
    public Estadistica getEstadisticaItem(int idItem) {
        Session session = sessionFactory.getCurrentSession();



        long numRespuestas;
        {
            String shql = "SELECT count(*) FROM RespuestaItem ri WHERE ri.item.idItem=?";
            Query query = session.createQuery(shql);
            query.setInteger(0, idItem);
            numRespuestas = (Long) query.uniqueResult();
        }

        List<Object[]> resultados;
        {
            String shql = "SELECT ri.valor,count(*) FROM RespuestaItem ri WHERE ri.item.idItem=? GROUP BY ri.valor";
            Query query = session.createQuery(shql);
            query.setInteger(0, idItem);
            resultados = query.list();
        }
        Estadistica estadistica = new Estadistica();

        for (Object[] resultado : resultados) {
            String label=(String)resultado[0];
            if ((label==null) ||(label.trim().equals(""))) {
                label="NS/NC";
            }
            long dataRaw=(Long)resultado[1];

            double data;
            if (numRespuestas != 0) {
                data = ((double)(dataRaw * 100)) / (double)numRespuestas;
            } else {
                data = 0;
            }

            estadistica.labels.add(label);
            estadistica.rawData.add(dataRaw);
            estadistica.data.add(data);
        }

        estadistica.numRespuestas=numRespuestas;

        return estadistica;
    }
}
