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
import es.logongas.encuestas.presentacion.HTMLUtil;
import java.net.URL;

/**
 * Genera el HTML relativo a una pregunta de una encuesta
 *
 * @author Lorenzo González
 */
public class PreguntaWidget implements Widget {

    private Pregunta pregunta;

    public PreguntaWidget(Pregunta pregunta) {
        if (pregunta == null) {
            throw new IllegalArgumentException("pregunta no puede ser null");
        }

        this.pregunta = pregunta;
    }

    @Override
    public String toHTML() {
        StringBuilder sb = new StringBuilder();

        generateCabecera(pregunta, sb);

        switch (pregunta.getTipoPregunta()) {
            case Radio:
                generateHTMLRadio(pregunta, sb);
                break;
            case EspecificoPorItem:
                generateHTMLEspecificoPorItem(pregunta, sb);
                break;
            default:
                throw new RuntimeException("El tipo de pregunta es desconocido:" + pregunta.getTipoPregunta());
        }

        generateBotones(pregunta, sb);

        return sb.toString();
    }

    private void generateCabecera(Pregunta pregunta, StringBuilder sb) {
        sb.append("<div class=\"row-fluid\" style=\"margin-top: 2em;\">\n");
        sb.append("  <div class=\"span12 main-text\" >" + HTMLUtil.toHTML(pregunta.getPregunta()) + ":</div>");
        sb.append("</div>");
    }

    private void generateHTMLRadio(Pregunta pregunta, StringBuilder sb) {
        sb.append("<div class=\"row-fluid\">");
        sb.append("  <div class=\"span12\" >");
        sb.append("    <ul class=\"items_encuesta\">");
        for (int i = 0; i < pregunta.getItems().size(); i++) {
            Item item = pregunta.getItems().get(i);
            sb.append("      <li style=\"text-align: left\">");
            sb.append("        <div class=\".checkbox\">");
            sb.append("          <input type=\"checkbox\" value=\"" + item.getIdItem() + "\" id=\"option" + item.getIdItem() + "\"  name=\"option" + item.getIdItem() + "\" />");
            sb.append("          <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + HTMLUtil.toHTML(item.getNombre()) + "</label>");
            if (i + 1 == pregunta.getItems().size()) {
                //Estamos en el último
                if (pregunta.isUltimoItemIncluyeOtros() == true) {
                    sb.append("          <input class=\"input-xxlarge\" type=\"text\" id=\"otros\" name=\"otros\" placeholder=\"Altres\"  style=\"visibility:hidden\">");
                }
            }
            sb.append("        </div>  ");
            sb.append("      </li>");
        }
        sb.append("    </ul>");
        sb.append("  </div>");
        sb.append("</div>");
    }

    private void generateHTMLEspecificoPorItem(Pregunta pregunta, StringBuilder sb) {
        sb.append("<div class=\"row-fluid\">");
        sb.append("  <div class=\"span12\" >");
        sb.append("    <ul class=\"items_encuesta\">");
        for (int i = 0; i < pregunta.getItems().size(); i++) {
            Item item = pregunta.getItems().get(i);
            switch (item.getTipoItem()) {
                case Sino:
                    generateItemSino(item, sb);
                    break;
                case ListaValores:
                    generateItemListaValores(item, sb);
                    break;
                case Texto:
                    break;
                case Fecha:
                    break;
                default:
                    throw new RuntimeException("El tipo de item es desconocido:" + item.getTipoItem());
            }
        }
        sb.append("    </ul>");
        sb.append("  </div>");
        sb.append("</div>");
    }

    private void generateItemSino(Item item, StringBuilder sb) {
        
    }   
    private void generateItemListaValores(Item item, StringBuilder sb) {
        
    }      
    
    private void generateBotones(Pregunta pregunta, StringBuilder sb) {
        sb.append("        <div class=\"row-fluid\" style=\"margin-top: 2em;\">");
        sb.append("            <div class=\"span11\" style=\"text-align: right\" >");
        sb.append("                <a href=\"anterior.html?idPregunta=" + pregunta.getIdPregunta() + "\" class=\"btn btn-large \"><i class=\"icon-arrow-left\" ></i> Anterior</a>");
        sb.append("                <a href=\"siguiente.html?idPregunta=" + pregunta.getIdPregunta() + "\" class=\"btn btn-large btn-primary \">Següent <i class=\"icon-arrow-right icon-white\" ></i></a>");
        sb.append("            </div>");
        sb.append("            <div class=\"span1\" >");
        sb.append("            </div>                    ");
        sb.append("        </div>");
    }
}
