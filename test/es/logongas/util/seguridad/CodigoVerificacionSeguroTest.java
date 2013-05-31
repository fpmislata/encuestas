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
        System.out.print("testNewInstance_String:");
        int key = 245897;
        CodigoVerificacionSeguro instance =CodigoVerificacionSeguro.getInstance(CodigoVerificacionSeguro.getInstance(key).getValor());
        boolean expResult = true;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
        System.out.println(instance.getValor());
    }

    @Test
    public void testIsValido() {
        System.out.print("isValido:");
        int key = 58698;
        CodigoVerificacionSeguro instance = CodigoVerificacionSeguro.getInstance(key);
        boolean expResult = true;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
        System.out.println(instance.getValor());
    }
}
