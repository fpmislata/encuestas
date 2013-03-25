/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.persistencia.impl.dao.encuestas;

import es.logongas.encuestas.modelo.encuestas.Encuesta;
import es.logongas.encuestas.modelo.encuestas.Estadistica;
import es.logongas.encuestas.modelo.encuestas.Item;
import es.logongas.encuestas.modelo.encuestas.Pregunta;
import es.logongas.encuestas.modelo.encuestas.Serie;
import es.logongas.encuestas.persistencia.services.dao.encuestas.EncuestaDAO;
import es.logongas.ix3.persistencia.impl.hibernate.dao.GenericDAOImplHibernate;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Lorenzo González
 */
public class EncuestaDAOImplHibernate extends GenericDAOImplHibernate<Encuesta, Integer> implements EncuestaDAO {

    private int numDecimals = 2;

    @Override
    public Estadistica getEstadisticaItem(Item item) {
        Session session = sessionFactory.getCurrentSession();
        Estadistica estadistica = new Estadistica();

        long numRespuestas;
        {
            String shql = "SELECT count(*) FROM RespuestaItem ri WHERE ri.item.idItem=?";
            Query query = session.createQuery(shql);
            query.setInteger(0, item.getIdItem());
            numRespuestas = (Long) query.uniqueResult();
        }

        List<Object[]> resultados;
        {
            String shql = "SELECT ri.valor,count(*) FROM RespuestaItem ri WHERE ri.item.idItem=? GROUP BY ri.valor";
            Query query = session.createQuery(shql);
            query.setInteger(0, item.getIdItem());
            resultados = query.list();
        }

        Serie serie=new Serie();

        for (Object[] resultado : resultados) {
            String label = (String) resultado[0];
            if ((label == null) || (label.trim().equals(""))) {
                label = "NS/NC";
            }
            long dataRaw = (Long) resultado[1];

            double doubleData;
            if (numRespuestas != 0) {
                doubleData = ((double) (dataRaw * 100)) / (double) numRespuestas;
            } else {
                doubleData = 0;
            }
            BigDecimal bigDecimalData = new BigDecimal(doubleData);
            BigDecimal data = bigDecimalData.setScale(numDecimals, RoundingMode.HALF_UP);

            estadistica.labels.add(label);
            serie.rawData.add(dataRaw);
            serie.data.add(data);
        }
        serie.numRespuestas = numRespuestas;

        estadistica.series.add(serie);

        return estadistica;
    }
}
