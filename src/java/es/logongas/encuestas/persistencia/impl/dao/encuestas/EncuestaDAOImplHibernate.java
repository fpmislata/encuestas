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
import es.logongas.ix3.persistence.impl.hibernate.dao.GenericDAOImplHibernate;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
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

        List<Object[]> resultados;
        {
            String shql = "SELECT ri.valor,count(*) FROM RespuestaItem ri WHERE ri.item.idItem=? GROUP BY ri.valor ORDER BY ri.valor";
            Query query = session.createQuery(shql);
            query.setInteger(0, item.getIdItem());
            resultados = query.list();
        }

        Estadistica estadistica = new Estadistica();
        estadistica.title=item.getPregunta().getEncuesta().getNombre();
        estadistica.subtitle=item.getPregunta().getPregunta();
        Serie serie = new Serie();
        serie.name=item.getNombre();
        serie.numRespuestas = getNumRespuestas(item.getPregunta().getEncuesta());
        for (Object[] datos : resultados) {
            estadistica.labels.add(getLabelFromValue((String)datos[0]));
            long rawData=((Number)datos[1]).longValue();
            serie.rawData.add(rawData);
            serie.data.add(getDataFromRawData(rawData, serie.numRespuestas));
        }
        estadistica.series.add(serie);

        return estadistica;
    }

    @Override
    public Estadistica getEstadisticaPregunta(Pregunta pregunta) {
        Session session = sessionFactory.getCurrentSession();

        Map<Item, Long> resultados = new TreeMap<Item, Long>();
        {
            List<Object[]> resultadosTrue;
            String shql = "SELECT ri.item,count(*) FROM RespuestaItem ri WHERE ri.item.pregunta.idPregunta=? and ri.check=true GROUP BY ri.item.nombre ";
            Query query = session.createQuery(shql);
            query.setInteger(0, pregunta.getIdPregunta());
            resultadosTrue = query.list();
            for (Object[] resultado : resultadosTrue) {
                Item item = (Item) resultado[0];
                long dataRaw = ((Number) resultado[1]).longValue();

                if (resultados.get(item) == null) {
                    resultados.put(item, dataRaw);
                }
            }
        }
        {
            List<Object[]> resultadosLabels;
            String shql = " SELECT i,0 FROM Item i WHERE i.pregunta.idPregunta=?";
            Query query = session.createQuery(shql);
            query.setInteger(0, pregunta.getIdPregunta());
            resultadosLabels = query.list();
            for (Object[] resultado : resultadosLabels) {
                Item item = (Item) resultado[0];
                long dataRaw = ((Number) resultado[1]).longValue();

                if (resultados.get(item) == null) {
                    resultados.put(item, dataRaw);
                }
            }
        }

        Estadistica estadistica = new Estadistica();
        estadistica.title=pregunta.getEncuesta().getNombre();
        estadistica.subtitle=null;
        Serie serie = new Serie();
        serie.name=pregunta.getPregunta();
        serie.numRespuestas = getNumRespuestas(pregunta.getEncuesta());
        for (Item item : resultados.keySet()) {
            estadistica.labels.add(getLabelFromValue(item.getNombre()));
            long rawData=resultados.get(item);
            serie.rawData.add(rawData);
            serie.data.add(getDataFromRawData(rawData, serie.numRespuestas));
        }
        estadistica.series.add(serie);

        return estadistica;
    }

    public long getNumRespuestas(Encuesta encuesta) {
        Session session = sessionFactory.getCurrentSession();

        long numRespuestas;

        String shql = "SELECT count(*) FROM RespuestaEncuesta re WHERE re.encuesta.idEncuesta=?";
        Query query = session.createQuery(shql);
        query.setInteger(0, encuesta.getIdEncuesta());
        numRespuestas = (Long) query.uniqueResult();

        return numRespuestas;
    }

    private String getLabelFromValue(String value) {
        String label;

        if ((value == null) || (value.trim().equals(""))) {
            label = "NS/NC";
        } else {
            label = value;
        }

        return label;
    }

    private BigDecimal getDataFromRawData(long rawData, long numRespuestas) {
        double doubleData;
        if (numRespuestas != 0) {
            doubleData = ((double) (rawData * 100)) / (double) numRespuestas;
        } else {
            doubleData = 0;
        }
        BigDecimal bigDecimalData = new BigDecimal(doubleData);
        BigDecimal data = bigDecimalData.setScale(numDecimals, RoundingMode.HALF_UP);

        return data;
    }
}
