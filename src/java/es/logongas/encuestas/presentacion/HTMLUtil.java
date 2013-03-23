/*
 * HTMLUtil 05-may-2005
 *
 * Easy Layered Framework (ELF)
 *
 * Copyright 2005 Lorenzo González Gascón
 * http://elfframework.sourceforge.net
 * mailto: logongas@users.sourceforge.net
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA02111-1307USA
 * 
 * Disclaimer:
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
 * 
 */
package es.logongas.encuestas.presentacion;

import java.text.*;

/**
 * Diversas rutinas utiles para tratar con el HTML
 * 
 * @author  <a href="mailto:logongas@users.sourceforge.net">Lorenzo González</a>
 */
public class HTMLUtil {

    /**
     * Constructor por defecto privado para evitar que se instance la clase
     */
    private HTMLUtil() {};

    /**
      * Reemplaza car�cteres que son especiales en HTML por su representaci�n en HTML
      * @param s String a transformar al juego de caracteres de HTML
      * @return El String de entrada pero con el juego de caracteres del HTML
      */
    public static String toHTML(String s){
        return toHTML(s,false,false);
      }
    
    /**
     * Reemplaza car�cteres que son especiales en HTML por su representaci�n en HTML
     * @param s String a transformar al juego de caracteres de HTML
     * @param spaces Si vales 'true' NO se cambian " " por &nbsp;
     * @return El String de entrada pero con el juego de caracteres del HTML
     */
    public static String toHTML(String s,boolean spaces){
        return toHTML(s,spaces,false);
    }      
    /**
     * Reemplaza car�cteres que son especiales en HTML por su representaci�n en HTML
     * @param s String a transformar al juego de caracteres de HTML
     * @param spaces Si vales 'true' NO se cambian " " por &nbsp;
     * @param hyphen Si vales 'true' NO se cambian "-" por &#8208;
     * @return El String de entrada pero con el juego de caracteres del HTML
     */
    public static String toHTML(String s,boolean spaces,boolean hyphen){
        
        if (s==null) {
            return "";
        } else {
            //El tama�o del String lo hacemos un 25% mas grande que el original
            StringBuffer htmlString = new StringBuffer((int)(s.length()*1.25));

            StringCharacterIterator iterator = new StringCharacterIterator(s);

            for(char c = iterator.first(); c != CharacterIterator.DONE; c = iterator.next()) {
                if ((c>='a' && c<='z') || (c>='A' && c<='Z') || (c>='0' && c<='9') ) {
                    htmlString.append(c);
                } else if (c==' ') {
                    if (spaces==true) {
                        htmlString.append(" ");
                    } else {
                        htmlString.append("&nbsp;");
                    }
                } else if (c=='-') {
                    if (hyphen=true) {
                        htmlString.append("-");
                    } else {
                        htmlString.append("&#8209;");
                    }                    
                } else {
                    htmlString.append("&#"+(int)c+";");
                }
             }
             return htmlString.toString();
        }
      }    
}
