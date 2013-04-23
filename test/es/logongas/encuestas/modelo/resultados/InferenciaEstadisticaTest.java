/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.modelo.resultados;

import java.math.BigDecimal;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Lorenzo González
 */
public class InferenciaEstadisticaTest {

    public InferenciaEstadisticaTest() {
    }

    @Test
    public void testMedia() {
        double[] datos={-0.04,-0.19,0.14,-0.09,-0.14,0.19,0.04,0.09};
        EstadisticaDescriptiva estadisticaDescriptiva=new EstadisticaDescriptiva(datos,4);
        InferenciaEstadistica inferenciaEstadistica=new InferenciaEstadistica(estadisticaDescriptiva, new BigDecimal("0.95"),4);


        assertEquals(inferenciaEstadistica.getIntervaloConfianzaMedia().getInferior().doubleValue(), -0.0926, 0.01);
        assertEquals(inferenciaEstadistica.getIntervaloConfianzaMedia().getSuperior().doubleValue(), 0.0926, 0.01);

        System.out.println("["+inferenciaEstadistica.getIntervaloConfianzaMedia().getInferior()+","+inferenciaEstadistica.getIntervaloConfianzaMedia().getSuperior()+"]");

    }
}
