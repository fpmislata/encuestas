/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.presentacion.widget;

import es.logongas.encuestas.modelo.encuestas.Pregunta;
import java.net.URL;

/**
 *
 * @author Lorenzo González
 */
public class BotonesWidget implements Widget {
    private Pregunta pregunta;
    private URL first;
    private URL last;

    public BotonesWidget(Pregunta pregunta, URL first, URL last) {
        this.pregunta = pregunta;
        this.first = first;
        this.last = last;
    }



    @Override
    public String toHTML() {
        StringBuilder sb=new StringBuilder();
        URL previous=null;
        URL next=null;
/*        
        if (pregunta.isPrimera()) {
            previous=first;
        } else  {
            previous=
        }
        
        if (pregunta.isUltima()) {
            next=last;
        } else  {
            next=
        }        
*/        
        sb.append("        <div class=\"row-fluid\" style=\"margin-top: 2em;\">");
        sb.append("            <div class=\"span11\" style=\"text-align: right\" >");
        sb.append("                <a href=\"" + previous.toExternalForm() + "\" class=\"btn btn-large \"><i class=\"icon-arrow-left\" ></i> Anterior</a>");
        sb.append("                <a href=\"" + next.toExternalForm() + "\" class=\"btn btn-large btn-primary \">Següent <i class=\"icon-arrow-right icon-white\" ></i></a>");
        sb.append("            </div>");
        sb.append("            <div class=\"span1\" >");
        sb.append("            </div>                    ");
        sb.append("        </div>");
        
        return sb.toString();
    }


    
    
}
