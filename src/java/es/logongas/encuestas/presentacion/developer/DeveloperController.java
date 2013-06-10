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
package es.logongas.encuestas.presentacion.developer;

import es.logongas.ix3.model.User;
import es.logongas.ix3.security.services.authentication.AuthenticationManager;
import es.logongas.ix3.security.services.authentication.Principal;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Lorenzo González
 */
@Controller
public class DeveloperController {

    @Autowired
    AuthenticationManager authenticationManager;

    @RequestMapping(value = {"/developer/userinfo.html"})
    public ModelAndView userinfo(HttpServletRequest request, HttpServletResponse httpServletResponse) {
        try {
            Map<String, Object> model = new HashMap<String, Object>();
            String viewName = "developer/userinfo";
            Principal principal;

            HttpSession httpSession = request.getSession();
            Serializable sid = (Serializable) httpSession.getAttribute("sid");

            if (sid == null) {
                principal = null;
            } else {
                principal = authenticationManager.getPrincipalBySID(sid);
            }

            model.put("principal", principal);
            return new ModelAndView(viewName, model);

        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
