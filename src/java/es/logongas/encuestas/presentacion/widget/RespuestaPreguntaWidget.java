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
import es.logongas.encuestas.modelo.encuestas.ListaValores;
import es.logongas.encuestas.modelo.encuestas.Valor;
import es.logongas.encuestas.modelo.respuestas.RespuestaItem;
import es.logongas.encuestas.modelo.respuestas.RespuestaPregunta;
import es.logongas.encuestas.presentacion.util.HTMLUtil;
import es.logongas.ix3.persistence.services.dao.BusinessMessage;
import java.util.List;

/**
 * Genera el HTML relativo a una pregunta de una encuesta
 *
 * @author Lorenzo González
 */
public class RespuestaPreguntaWidget {

    private RespuestaPregunta respuestaPregunta;
    private List<BusinessMessage> businessMessages;

    public RespuestaPreguntaWidget(RespuestaPregunta respuestaPregunta, List<BusinessMessage> businessMessages) {
        if (respuestaPregunta == null) {
            throw new IllegalArgumentException("respuestaPregunta no puede ser null");
        }

        this.respuestaPregunta = respuestaPregunta;
        this.businessMessages = businessMessages;
    }

    public String toHTML() {
        StringBuilder sb = new StringBuilder();

        generateCabecera(respuestaPregunta, sb);

        switch (respuestaPregunta.getPregunta().getTipoPregunta()) {
            case Radio:
                generateHTMLRadio(respuestaPregunta, sb);
                break;
            case Check:
                generateHTMLCheck(respuestaPregunta, sb);
                break;
            case EspecificoPorItem:
                generateHTMLEspecificoPorItem(respuestaPregunta, sb);
                break;
            default:
                throw new RuntimeException("El tipo de pregunta es desconocido:" + respuestaPregunta.getPregunta().getTipoPregunta());
        }
        generatePie(respuestaPregunta, sb);

        generateBotones(respuestaPregunta, sb);

        return sb.toString();
    }

    private void generateCabecera(RespuestaPregunta respuestaPregunta, StringBuilder sb) {
        sb.append("<div class=\"row-fluid\" style=\"margin-top: 2em;\">\n");
        sb.append("  <div class=\"span12 main-text\" >" + HTMLUtil.toHTML(respuestaPregunta.getPregunta().getPregunta()) + ":</div>\n");
        sb.append("</div>\n");
        sb.append("<form  id=\"formRespuestas\" action=\"\" method=\"POST\" style=\"margin: 0px; padding: 0px;\">\n");
        sb.append("<div class=\"row-fluid\">\n");
        sb.append("  <div class=\"span12\" >\n");
        sb.append("    <ul class=\"items_encuesta\">\n");
    }

    private void generatePie(RespuestaPregunta respuestaPregunta, StringBuilder sb) {
        sb.append("    </ul>\n");
        sb.append("  </div>\n");
        sb.append("</div>\n");
        sb.append("</form>\n");
        generateBusinessMessages(businessMessages, sb);

    }

    private void generateBusinessMessages(List<BusinessMessage> businessMessages, StringBuilder sb) {
        BusinessMessagesWidget businessMessagesWidget=new BusinessMessagesWidget(businessMessages);

        sb.append(businessMessagesWidget.toHTML());
    }

    private void generateHTMLRadio(RespuestaPregunta respuestaPregunta, StringBuilder sb) {
        for (int i = 0; i < respuestaPregunta.getRespuestaItems().size(); i++) {
            RespuestaItem respuestaItem = respuestaPregunta.getRespuestaItems().get(i);
            Item item = respuestaItem.getItem();

            String checked;
            String cssClassChecked;
            String cssStyleVisibility;
            if (respuestaItem.isCheck() == true) {
                checked = "checked=\"checked\"";
                cssClassChecked = "checkedd";
                cssStyleVisibility = "visible";
            } else {
                checked = "";
                cssClassChecked = "uncheckedd";
                cssStyleVisibility = "hidden";
            }

            sb.append("      <li style=\"text-align: left\">\n");
            sb.append("        <div class=\".radiobutton\">\n");
            sb.append("          <input type=\"radio\" value=\"" + respuestaPregunta.getPregunta().getItems().get(i).getIdItem() + "\"  name=\"check1\" " + checked + " />\n");
            sb.append("          <label class=\"" + cssClassChecked + "\" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + HTMLUtil.toHTML(item.getNombre()) + "</label>\n");
            if ((i + 1) == respuestaPregunta.getPregunta().getItems().size()) {
                //Estamos en el último
                if (respuestaPregunta.getPregunta().isUltimoItemIncluyeOtros() == true) {
                    sb.append("          <input class=\"input-xxlarge\" type=\"text\" name=\"valor" + respuestaPregunta.getPregunta().getItems().get(i).getIdItem() + "\" placeholder=\"Altres\"  style=\"visibility:" + cssStyleVisibility + "\" value=\"" + HTMLUtil.toHTML(respuestaItem.getValor()) + "\">\n");
                }
            }
            sb.append("        </div>\n");
            sb.append("      </li>\n");
        }

    }

    private void generateHTMLCheck(RespuestaPregunta respuestaPregunta, StringBuilder sb) {

        for (int i = 0; i < respuestaPregunta.getRespuestaItems().size(); i++) {
            RespuestaItem respuestaItem = respuestaPregunta.getRespuestaItems().get(i);
            Item item = respuestaItem.getItem();

            String checked;
            String cssClassChecked;
            String cssStyleVisibility;
            if (respuestaItem.isCheck() == true) {
                checked = "checked=\"checked\"";
                cssClassChecked = "checkedd";
                cssStyleVisibility = "visible";
            } else {
                checked = "";
                cssClassChecked = "uncheckedd";
                cssStyleVisibility = "hidden";
            }

            boolean showText = false;
            if ((i + 1) == respuestaPregunta.getPregunta().getItems().size()) {
                //Estamos en el último
                if (respuestaPregunta.getPregunta().isUltimoItemIncluyeOtros() == true) {
                    showText = true;
                }
            }

            sb.append("      <li style=\"text-align: left\">\n");
            sb.append("        <div class=\".checkbox\">\n");
            sb.append("          <input type=\"checkbox\" value=\"" + respuestaItem.getItem().getIdItem() + "\"  name=\"check" + respuestaItem.getItem().getIdItem() + "\"  " + checked + " />\n");
            sb.append("          <label class=\"" + cssClassChecked + "\" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + HTMLUtil.toHTML(respuestaItem.getItem().getNombre()) + "</label>\n");
            if (showText == true) {
                sb.append("          <input class=\"input-xxlarge\" type=\"text\" name=\"valor" + respuestaItem.getItem().getIdItem() + "\" placeholder=\"Altres expectatives\" style=\"visibility:" + cssStyleVisibility + "\" value=\"" + HTMLUtil.toHTML(respuestaItem.getValor()) + "\" >\n");
            }
            sb.append("        </div>\n");
            sb.append("      </li>\n");
        }
    }

    private void generateHTMLEspecificoPorItem(RespuestaPregunta respuestaPregunta, StringBuilder sb) {
        for (int i = 0; i < respuestaPregunta.getRespuestaItems().size(); i++) {
            RespuestaItem respuestaItem = respuestaPregunta.getRespuestaItems().get(i);

            switch (respuestaItem.getItem().getTipoItem()) {
                case Sino:
                    boolean showText = false;
                    if ((i + 1) == respuestaPregunta.getRespuestaItems().size()) {
                        //Estamos en el último
                        if (respuestaPregunta.getPregunta().isUltimoItemIncluyeOtros() == true) {
                            showText = true;
                        }
                    }
                    generateItemSino(respuestaItem, showText, sb);
                    break;
                case ListaValores:
                    generateItemListaValores(respuestaItem, sb);
                    break;
                case Texto:
                    generateItemTexto(respuestaItem, sb);
                    break;
                case Fecha:
                    generateItemFecha(respuestaItem, sb);
                    break;
                case AreaTexto:
                    generateItemAreaTexto(respuestaItem, sb);
                    break;
                default:
                    throw new RuntimeException("El tipo de item es desconocido:" + respuestaItem.getItem().getTipoItem());
            }
        }
    }

    private void generateItemSino(RespuestaItem respuestaItem, boolean showText, StringBuilder sb) {
        String checked;
        String cssClassChecked;
        String cssStyleVisibility;
        if (respuestaItem.isCheck() == true) {
            checked = "checked=\"checked\"";
            cssClassChecked = "checkedd";
            cssStyleVisibility = "visible";
        } else {
            checked = "";
            cssClassChecked = "uncheckedd";
            cssStyleVisibility = "hidden";
        }

        sb.append("      <li style=\"text-align: left\">\n");
        sb.append("        <div class=\".checkbox\">\n");
        sb.append("          <input type=\"checkbox\" value=\"" + respuestaItem.getItem().getIdItem() + "\"  name=\"check" + respuestaItem.getItem().getIdItem() + "\"  " + checked + " />\n");
        sb.append("          <label class=\"" + cssClassChecked + "\" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + HTMLUtil.toHTML(respuestaItem.getItem().getNombre()) + "</label>\n");
        if (showText == true) {
            sb.append("          <input class=\"input-xxlarge\" type=\"text\" name=\"valor" + respuestaItem.getItem().getIdItem() + "\" placeholder=\"Altres expectatives\" style=\"visibility:" + cssStyleVisibility + "\" value=\"" + HTMLUtil.toHTML(respuestaItem.getValor()) + "\" >\n");
        }
        sb.append("        </div>\n");
        sb.append("      </li>\n");
    }

    private void generateItemListaValores(RespuestaItem respuestaItem, StringBuilder sb) {
        ListaValores listaValores = respuestaItem.getItem().getListaValores();
        if (listaValores == null) {
            throw new RuntimeException("listaValores no puede ser null");
        }

        sb.append("      <li style=\"text-align: left\">\n");
        sb.append("        <div class=\"row-fluid\">\n");
        sb.append("            <div class=\"span10 simple-text\" style=\"padding-left: 20px;padding-top: 0.5em;\" >\n");
        sb.append("                <img src=\"img/icons/bullet.png\" />&nbsp;" + HTMLUtil.toHTML(respuestaItem.getItem().getNombre()) + ":\n");
        sb.append("            </div>\n");
        sb.append("            <div class=\"span2\" >\n");
        sb.append("                <div class=\"btn-group\">\n");
        sb.append("                    <button class=\"btn dropdown-toggle\" data-toggle=\"dropdown\">\n");
        sb.append("                        " + HTMLUtil.toHTML(respuestaItem.getValor()) + "&nbsp;&nbsp;<span class=\"caret\"></span>\n");
        sb.append("                    </button>\n");
        sb.append("                    <ul class=\"dropdown-menu\">\n");
        sb.append("                        <li><a href=\"javascript:void(0)\" onclick=\"select_click(this)\" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>\n");
        for (Valor valor : listaValores.getValores()) {
            sb.append("                        <li><a href=\"javascript:void(0)\" onclick=\"select_click(this)\" >" + valor.getNombre() + "</a></li>\n");
        }
        sb.append("                    </ul>\n");
        sb.append("                    <input class=\"dropdownlist\" type=\"text\" name=\"valor" + respuestaItem.getItem().getIdItem() + "\" value=\"" + HTMLUtil.toHTML(respuestaItem.getValor()) + "\" />\n");
        sb.append("                </div>\n");
        sb.append("            </div>\n");
        sb.append("        </div>\n");
        sb.append("      </li>\n");
    }

    private void generateItemTexto(RespuestaItem respuestaItem, StringBuilder sb) {
        sb.append("      <li style=\"text-align: left\">\n");
        sb.append("        <div class=\"row-fluid\">\n");
        sb.append("            <div class=\"span5 simple-text\" style=\"padding-left: 20px\" >\n");
        sb.append("                <img src=\"img/icons/bullet.png\"  />&nbsp;" + HTMLUtil.toHTML(respuestaItem.getItem().getNombre()) + ":\n");
        sb.append("            </div >\n");
        sb.append("            <div class=\"span7\">\n");
        sb.append("                <input type=\"text\" class=\"input-xxlarge\" style=\"margin-top: 0px;\" name=\"valor" + respuestaItem.getItem().getIdItem() + "\"  value=\"" + HTMLUtil.toHTML(respuestaItem.getValor()) + "\" />\n");
        sb.append("            </div>\n");
        sb.append("        </div>\n");
        sb.append("      </li>\n");
    }

    private void generateItemFecha(RespuestaItem respuestaItem, StringBuilder sb) {
        sb.append("      <li style=\"text-align: left\">\n");
        sb.append("        <div class=\"row-fluid\">\n");
        sb.append("            <div class=\"span5 simple-text\" style=\"padding-left: 20px\" >\n");
        sb.append("                <img src=\"img/icons/bullet.png\"  />&nbsp;" + HTMLUtil.toHTML(respuestaItem.getItem().getNombre()) + ":\n");
        sb.append("            </div >\n");
        sb.append("            <div class=\"span7\">\n");
        sb.append("                <input type=\"text\" id=\"valor" + respuestaItem.getItem().getIdItem() + "\" class=\"input-xxlarge\" style=\"margin-top: 0px;\" name=\"valor" + respuestaItem.getItem().getIdItem() + "\"  value=\"" + HTMLUtil.toHTML(respuestaItem.getValor()) + "\" />\n");
        sb.append("            </div>\n");
        sb.append("        </div>\n");
        sb.append("      </li>\n");
        sb.append("      <script>\n");
        sb.append("          $(function() { $(\"#valor" + respuestaItem.getItem().getIdItem() + "\").datepicker(); });\n");
        sb.append("      </script>\n");
    }

    private void generateBotones(RespuestaPregunta respuestaPregunta, StringBuilder sb) {
        sb.append("        <div class=\"row-fluid\" style=\"margin-top: 2em;\">\n");
        sb.append("            <div class=\"span11\" style=\"text-align: right\" >\n");
        if (respuestaPregunta.anterior() != null) {
            sb.append("                <button onclick=\"document.getElementById('formRespuestas').action='anterior.html?idPregunta=" + respuestaPregunta.getPregunta().getIdPregunta() + "';document.getElementById('formRespuestas').submit();\" class=\"btn btn-large \"><i class=\"icon-arrow-left\" ></i> Anterior</button>\n");
        }
        String nextLabel;
        if (respuestaPregunta.siguiente() != null) {
            nextLabel = "Següent";
        } else {
            if (respuestaPregunta.getPregunta().getEncuesta().isImprimir() == false) {
                nextLabel = "Finalitzar";
            } else {
                nextLabel = "Següent";
            }
        }
        sb.append("                <button onclick=\"document.getElementById('formRespuestas').action='siguiente.html?idPregunta=" + respuestaPregunta.getPregunta().getIdPregunta() + "';document.getElementById('formRespuestas').submit();\" class=\"btn btn-large btn-primary \">" + HTMLUtil.toHTML(nextLabel) + " <i class=\"icon-arrow-right icon-white\" ></i></button>\n");
        sb.append("            </div>\n");
        sb.append("            <div class=\"span1\" >\n");
        sb.append("            </div>\n");
        sb.append("        </div>\n");
    }

    private void generateItemAreaTexto(RespuestaItem respuestaItem, StringBuilder sb) {
        boolean showPregunta;
        String pregunta = respuestaItem.getItem().getNombre();

        if ((pregunta == null) || (pregunta.trim().equals(""))) {
            showPregunta = false;
        } else if (respuestaItem.getRespuestaPregunta().getPregunta().getItems().size()==1) {
            //Si solo hay un item y es de "Area de Texto" no hae falta que mostremos su item
            showPregunta = false;
        } else {
            showPregunta = true;
        }


        sb.append("      <li style=\"text-align: left\">\n");
        if (showPregunta == true) {
            sb.append("        <div class=\"row-fluid\">\n");
            sb.append("            <div class=\"span12 simple-text\" style=\"padding-left: 20px\" >\n");
            sb.append("                <img src=\"img/icons/bullet.png\"  />&nbsp;" + HTMLUtil.toHTML(respuestaItem.getItem().getNombre()) + ":\n");
            sb.append("            </div >\n");
            sb.append("        </div>\n");
        }
        sb.append("        <div class=\"row-fluid\">\n");
        sb.append("                <textarea  class=\"span12\" id=\"valor" + respuestaItem.getItem().getIdItem() + "\"  name=\"valor" + respuestaItem.getItem().getIdItem() + "\" rows=\"5\" cols=\"200\"   />\n");
        sb.append(HTMLUtil.toHTML(respuestaItem.getValor()));
        sb.append("</textarea>");
        sb.append("        </div>\n");

        sb.append("      </li>\n");
    }
}
