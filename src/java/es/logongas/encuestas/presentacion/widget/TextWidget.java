/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.presentacion.widget;

import es.logongas.encuestas.presentacion.util.HTMLUtil;

/**
 *
 * @author Lorenzo González
 */
public class TextWidget {

    public String toHTML(String text) {
        if (text == null) {
            return "";
        }
        String[] words = text.split("\\s");
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < words.length; i++) {
            String word = words[i];
            if (i == 0) {
                appendBlue(sb, word);
            } else {
                sb.append("&nbsp;");
                appendGray(sb, word);
            }

        }

        return sb.toString();
    }

    private void appendFirstBlue(StringBuilder sb, String word) {
        if ((word == null) || (word.length() == 0)) {
            return;
        }

        if (word.length() == 1) {
            appendGray(sb, word);
        } else {
            appendBlue(sb, word.charAt(0) + "");
            appendGray(sb, word.substring(1));
        }
    }

    private void appendBlue(StringBuilder sb, String s) {
        sb.append("<span class=\"main-text\">");
        sb.append(HTMLUtil.toHTML(s));
        sb.append("</span>");
    }

    private void appendGray(StringBuilder sb, String s) {
        sb.append("<span class=\"main-text-gray\">");
        sb.append(HTMLUtil.toHTML(s));
        sb.append("</span>");
    }
}
