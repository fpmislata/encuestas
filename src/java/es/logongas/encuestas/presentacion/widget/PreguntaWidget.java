/*
 * Copyright 2013 Lorenzo González.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package es.logongas.encuestas.presentacion.widget;

import es.logongas.encuestas.modelo.encuestas.Item;
import es.logongas.encuestas.modelo.encuestas.Pregunta;

/**
 * Genera el HTML relativo a una pregunta de una encuesta
 *
 * @author Lorenzo González
 */
public class PreguntaWidget implements Widget {

    private Pregunta pregunta;

    public PreguntaWidget(Pregunta pregunta) {
        this.pregunta = pregunta;
    }

    @Override
    public String toHTML() {
        StringBuilder sb = new StringBuilder();

        generateCabecera(pregunta, sb);

        switch (pregunta.getTipoPregunta()) {
            case SiNo:
                generateHTMLSiNo(pregunta, sb);
                break;
            case EleccionMultiple:
                generateHTMLEleccionMultiple(pregunta, sb);
                break;
            case ListadeValores:
                generateHTMLListadeValores(pregunta, sb);
                break;
            case EspecificoPorItem:
                generateHTMLEspecificoPorItem(pregunta, sb);
                break;
            case CajaTexto:
                generateHTMLCajaTexto(pregunta, sb);
                break;
            default:
                throw new RuntimeException("El tipo de preguntaes desconocido:" + pregunta.getTipoPregunta());
        }
        return sb.toString();
    }

    private void generateCabecera(Pregunta pregunta, StringBuilder sb) {
        //@TODO: Usar HTMLUtils.htmlEscape de Spring
        sb.append("<div class=\"row-fluid\" style=\"margin-top: 2em;\">\n");
        sb.append("  <div class=\"span12 main-text\" >" + pregunta.getPregunta() + ":</div>");
        sb.append("</div>");
    }

    private void generateHTMLCajaTexto(Pregunta pregunta, StringBuilder sb) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    private void generateHTMLSiNo(Pregunta pregunta, StringBuilder sb) {
        sb.append("<div class=\"row-fluid\">");
        sb.append("  <div class=\"span12\" >");
        sb.append("    <ul class=\"items_encuesta\">");
        for (int i = 0; i < pregunta.getItems().size(); i++) {
            Item item = pregunta.getItems().get(i);
            sb.append("      <li style=\"text-align: left\">");
            sb.append("        <div class=\".checkbox\">");
            sb.append("          <input type=\"checkbox\" value=\"" + item.getIdItem() + "\" id=\"option" + item.getIdItem() + "\"  name=\"option" + item.getIdItem() + "\" />");
            sb.append("          <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + item.getNombre() + "</label>");
            if (i+1==pregunta.getItems().size()) {
                //Estamos en el último
                if (pregunta.isUltimoItemIncluyeOtros()==true) {
                    sb.append("          <input class=\"input-xxlarge\" type=\"text\" id=\"otros\" name=\"otros\" placeholder=\"Altres\">");
                }
            }
            sb.append("        </div>  ");
            sb.append("      </li>");
        }
        sb.append("    </ul>");
        sb.append("  </div>");
        sb.append("</div>");
    }

    private void generateHTMLEleccionMultiple(Pregunta pregunta, StringBuilder sb) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    private void generateHTMLListadeValores(Pregunta pregunta, StringBuilder sb) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    private void generateHTMLEspecificoPorItem(Pregunta pregunta, StringBuilder sb) {
        throw new UnsupportedOperationException("Not yet implemented");
    }
}
