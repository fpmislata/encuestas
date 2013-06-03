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

import es.logongas.encuestas.presentacion.util.HTMLUtil;
import es.logongas.ix3.persistence.services.dao.BusinessMessage;
import java.util.List;

/**
 * Genera el HTML relativo a los BusinessMessages
 * @author Lorenzo González
 */
public class BusinessMessagesWidget {

    private List<BusinessMessage> businessMessages;
    private boolean showCloseButton;

    public BusinessMessagesWidget(List<BusinessMessage> businessMessages) {
        this.businessMessages = businessMessages;
        this.showCloseButton=true;
    }

    public void setShowCloseButton(boolean showCloseButton) {
        this.showCloseButton=showCloseButton;
    }

    public String toHTML() {
        StringBuilder sb = new StringBuilder();

        generateBusinessMessages(businessMessages, sb);

        return sb.toString();
    }

    private void generateBusinessMessages(List<BusinessMessage> businessMessages, StringBuilder sb) {
        if ((businessMessages != null) && (businessMessages.size() > 0)) {
            sb.append("<div class=\"alert alert-block alert-error\" style='margin-bottom:5px;padding-top:5px;padding-botton:5px'>\n");
            sb.append("<strong>S'han produït els següents errors:</strong>");
            if (showCloseButton==true) {
                sb.append("<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n");
            }
            sb.append("<ul>\n");
            for (BusinessMessage businessMessage : this.businessMessages) {
                sb.append("<li>\n");
                if (businessMessage.getPropertyName() != null) {
                    sb.append("<strong>" + HTMLUtil.toHTML(businessMessage.getPropertyName()) + ":&nbsp;&nbsp;</strong>\n");
                }
                sb.append(HTMLUtil.toHTML(businessMessage.getMessage()));
                sb.append("</li>\n");
            }
            sb.append("</ul>\n");
            sb.append("</div>\n");
        }
    }
}
