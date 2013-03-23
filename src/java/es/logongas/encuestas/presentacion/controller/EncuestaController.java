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
package es.logongas.encuestas.presentacion.controller;

import es.logongas.encuestas.datos.dao.encuestas.EncuestaDAO;
import es.logongas.encuestas.modelo.encuestas.Encuesta;
import es.logongas.encuestas.modelo.encuestas.Pregunta;
import es.logongas.ix3.persistencia.services.dao.BussinessException;
import es.logongas.ix3.persistencia.services.dao.BussinessMessage;
import es.logongas.ix3.persistencia.services.dao.DAOFactory;
import es.logongas.ix3.persistencia.services.dao.GenericDAO;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Lorenzo González
 */
@Controller
public class EncuestaController {

    @Autowired
    DAOFactory daoFactory;

    @RequestMapping(value = {"/encuesta.html"})
    public ModelAndView primeraPregunta(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            int idEncuesta;
            try {
                idEncuesta = Integer.parseInt(request.getParameter("idEncuesta"));
            } catch (NumberFormatException ex) {
                throw new BussinessException(new BussinessMessage(null, "El Nº de encuesta no es válido"));
            }
            GenericDAO encuestaDAO = daoFactory.getDAO(Encuesta.class);

            Encuesta encuesta = (Encuesta) encuestaDAO.read(idEncuesta);

            if (encuesta == null) {
                throw new BussinessException(new BussinessMessage(null, "La encuesta solicitada no existe"));
            }

            if (encuesta.getPreguntas().size() == 0) {
                throw new BussinessException(new BussinessMessage(null, "La encuesta no tiene ninguna pregunta"));
            }

            Pregunta pregunta = encuesta.getPreguntas().get(0);

            viewName = "redirect:/pregunta.html?idPregunta=" + pregunta.getIdPregunta();
        } catch (BussinessException ex) {
            viewName = "bussinessException";
            model.put("bussinessMessages", ex.getBussinessMessages());
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping(value = {"/pregunta.html"})
    public ModelAndView pregunta(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        try {
            int idPregunta;
            try {
                idPregunta = Integer.parseInt(request.getParameter("idPregunta"));
            } catch (NumberFormatException ex) {
                throw new BussinessException(new BussinessMessage(null, "El Nº de pregunta no es válido"));
            }
            GenericDAO preguntaDAO = daoFactory.getDAO(Pregunta.class);

            Pregunta pregunta = (Pregunta) preguntaDAO.read(idPregunta);

            if (pregunta == null) {
                throw new BussinessException(new BussinessMessage(null, "La pregunta solicitada no existe"));
            }

            model.put("pregunta", pregunta);
            viewName = "encuestas/pregunta";
        } catch (BussinessException ex) {
            viewName = "bussinessException";
            model.put("bussinessMessages", ex.getBussinessMessages());
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping(value = {"/siguiente.html"})
    public ModelAndView siguiente(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        try {
            int idPregunta;
            try {
                idPregunta = Integer.parseInt(request.getParameter("idPregunta"));
            } catch (NumberFormatException ex) {
                throw new BussinessException(new BussinessMessage(null, "El Nº de pregunta no es válido"));
            }
            GenericDAO preguntaDAO = daoFactory.getDAO(Pregunta.class);

            Pregunta pregunta = (Pregunta) preguntaDAO.read(idPregunta);

            if (pregunta == null) {
                throw new BussinessException(new BussinessMessage(null, "La pregunta solicitada no existe"));
            }


            Pregunta siguientePregunta = pregunta.siguiente();

            if (siguientePregunta != null) {
                viewName = "redirect:/pregunta.html?idPregunta=" + siguientePregunta.getIdPregunta();
            } else {
                //Era la última pregunta
                viewName = null;
            }


        } catch (BussinessException ex) {
            viewName = "bussinessException";
            model.put("bussinessMessages", ex.getBussinessMessages());
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping(value = {"/anterior.html"})
    public ModelAndView anterior(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        try {
            int idPregunta;
            try {
                idPregunta = Integer.parseInt(request.getParameter("idPregunta"));
            } catch (NumberFormatException ex) {
                throw new BussinessException(new BussinessMessage(null, "El Nº de pregunta no es válido"));
            }
            GenericDAO preguntaDAO = daoFactory.getDAO(Pregunta.class);

            Pregunta pregunta = (Pregunta) preguntaDAO.read(idPregunta);

            if (pregunta == null) {
                throw new BussinessException(new BussinessMessage(null, "La pregunta solicitada no existe"));
            }


            Pregunta anteriorPregunta = pregunta.anterior();

            if (anteriorPregunta != null) {
                viewName = "redirect:/pregunta.html?idPregunta=" + anteriorPregunta.getIdPregunta();
            } else {
                //Era la primera pregunta
                viewName = null;
            }


        } catch (BussinessException ex) {
            viewName = "bussinessException";
            model.put("bussinessMessages", ex.getBussinessMessages());
        }

        return new ModelAndView(viewName, model);
    }
}
