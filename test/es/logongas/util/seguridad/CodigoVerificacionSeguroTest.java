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
    }

    @Test
    public void testIsValido() {
        System.out.print("isValido:");
        int key = 58698;
        CodigoVerificacionSeguro instance = CodigoVerificacionSeguro.getInstance(key);
        boolean expResult = true;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
    }
    @Test
    public void testIsValido1() {
        System.out.print("isValido1 con letras en minusculas:");
        String cvc="AAAAhgfAALB4TK7OTJSJU5A";
        CodigoVerificacionSeguro instance = CodigoVerificacionSeguro.getInstance(cvc);
        boolean expResult = false;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
    }


    @Test
    public void testIsValido2() {
        System.out.print("isValido2 con letras en minusculas:");
        String cvc="AAAAhgfAALkjhkB4TK7OTJSJU5A";
        CodigoVerificacionSeguro instance = CodigoVerificacionSeguro.getInstance(cvc);
        boolean expResult = false;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
    }



    @Test
    public void testIsValido3() {
        System.out.print("isValido3 con letras en minusculas:");
        String cvc="AAAAhgfAALB4TK7OTJSJU5A";
        CodigoVerificacionSeguro instance = CodigoVerificacionSeguro.getInstance(cvc);
        boolean expResult = false;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
    }

    @Test
    public void testIsValido4() {
        System.out.print("isValido con letras en minusculas:");
        String cvc="AAAAhgfAALkjhkB4TK7OTJSjhgjhgjJU5A";
        CodigoVerificacionSeguro instance = CodigoVerificacionSeguro.getInstance(cvc);
        boolean expResult = false;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
    }
    @Test
    public void testIsValido5() {
        System.out.print("isValido OK:");
        String cvc="AAAAAASSKYAWNFNUK3EA";
        CodigoVerificacionSeguro instance = CodigoVerificacionSeguro.getInstance(cvc);
        boolean expResult = true;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
    }
    @Test
    public void testIsValido6() {
        System.out.print("isValido con números:");
        String cvc="AAAA1ASSKYAWNFNUK3EA";
        CodigoVerificacionSeguro instance = CodigoVerificacionSeguro.getInstance(cvc);
        boolean expResult = false;
        boolean result = instance.isValido();
        assertEquals(expResult, result);
    }
}
