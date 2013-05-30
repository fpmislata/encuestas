/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.util.seguridad;

import static org.junit.Assert.*;
import org.junit.Test;

/**
 *
 * @author Lorenzo González
 */
public class CodigoVerificacionSeguroTest {

    public CodigoVerificacionSeguroTest() {
    }

    @Test
    public void testNewInstance_String() {
        System.out.println("isValido");
        byte tipo = 45;
        int key = 67;
        CodigoVerificacionSeguro instance =CodigoVerificacionSeguro.newInstance(CodigoVerificacionSeguro.newInstance(tipo, key).getValor());
        boolean expResult = true;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
    }

    @Test
    public void testIsValido() {
        System.out.println("isValido");
        byte tipo = 45;
        int key = 67;
        CodigoVerificacionSeguro instance = CodigoVerificacionSeguro.newInstance(tipo, key);
        boolean expResult = true;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
    }
}
