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

import es.logongas.encuestas.modelo.encuestas.Encuesta;
import es.logongas.encuestas.modelo.encuestas.Item;
import es.logongas.encuestas.modelo.encuestas.ListaValores;
import es.logongas.encuestas.modelo.encuestas.Pregunta;
import es.logongas.encuestas.modelo.encuestas.Valor;
import es.logongas.encuestas.modelo.respuestas.Documento;
import es.logongas.encuestas.modelo.respuestas.RespuestaEncuesta;
import es.logongas.encuestas.modelo.respuestas.RespuestaItem;
import es.logongas.encuestas.modelo.respuestas.RespuestaPregunta;
import es.logongas.ix3.persistence.services.dao.BusinessException;
import es.logongas.ix3.persistence.services.dao.BusinessMessage;
import es.logongas.ix3.persistence.services.dao.DAOFactory;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
    public ModelAndView encuesta(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        if (request.getCharacterEncoding() == null) {
            try {
                request.setCharacterEncoding("utf-8");
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(EncuestaController.class.getName()).log(Level.WARNING, "no existe el juego de caracteres utf-8", ex);
            }
        }


        int idEncuesta;
        URI backURI;
        try {
            idEncuesta = Integer.parseInt(request.getParameter("idEncuesta"));
        } catch (NumberFormatException ex) {
            throw new BusinessException(new BusinessMessage(null, "El Nº de encuesta no es válido"));
        }

        try {
            if ((request.getParameter("backURI") == null) || (request.getParameter("backURI").trim().equals(""))) {
                backURI = new URI(request.getContextPath());
            } else {
                backURI = new URI(request.getParameter("backURI"));
            }
        } catch (Exception ex) {
            throw new BusinessException(new BusinessMessage(null, "El backURI no es válido"));
        }

        Encuesta encuesta = (Encuesta) daoFactory.getDAO(Encuesta.class).read(idEncuesta);
        if (encuesta == null) {
            throw new BusinessException(new BusinessMessage(null, "La encuesta solicitada no existe"));
        }

        if (encuesta.isEncuestaHabilitada() == false) {
            throw new BusinessException(new BusinessMessage(null, "La encuesta solicitada no es posible realizarla actualmente"));
        }

        RespuestaEncuesta respuestaEncuesta = new RespuestaEncuesta(encuesta);
        EncuestaState encuestaState = new EncuestaState(respuestaEncuesta, backURI);
        setEncuestaState(request, encuestaState);

        Pregunta pregunta = respuestaEncuesta.getPrimeraPregunta();
        if (pregunta == null) {
            throw new BusinessException(new BusinessMessage(null, "La encuesta no tiene preguntas"));
        }
        viewName = "redirect:/pregunta.html?idPregunta=" + pregunta.getIdPregunta();


        return new ModelAndView(viewName, model);
    }

    @RequestMapping(value = {"/pregunta.html"})
    public ModelAndView pregunta(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        if (request.getCharacterEncoding() == null) {
            try {
                request.setCharacterEncoding("utf-8");
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(EncuestaController.class.getName()).log(Level.WARNING, "no existe el juego de caracteres utf-8", ex);
            }
        }

        int idPregunta;
        try {
            idPregunta = Integer.parseInt(request.getParameter("idPregunta"));
        } catch (NumberFormatException ex) {
            throw new BusinessException(new BusinessMessage(null, "El Nº de pregunta no es válido"));
        }

        Pregunta pregunta = (Pregunta) daoFactory.getDAO(Pregunta.class).read(idPregunta);
        if (pregunta == null) {
            throw new BusinessException(new BusinessMessage(null, "La pregunta solicitada no existe"));
        }

        if (getEncuestaState(request).getRespuestaEncuesta().isPreguntaValida(pregunta) == false) {
            throw new BusinessException(new BusinessMessage(null, "La pregunta solicitada es existe en esta encuesta"));
        }

        RespuestaPregunta respuestaPregunta = getEncuestaState(request).getRespuestaEncuesta().getRespuestaPregunta(pregunta);
        model.put("respuestaPregunta", respuestaPregunta);
        viewName = "encuestas/pregunta";


        return new ModelAndView(viewName, model);
    }

    @RequestMapping(value = {"/siguiente.html"})
    public ModelAndView siguiente(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        if (request.getCharacterEncoding() == null) {
            try {
                request.setCharacterEncoding("utf-8");
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(EncuestaController.class.getName()).log(Level.WARNING, "no existe el juego de caracteres utf-8", ex);
            }
        }



        int idPregunta;
        try {
            idPregunta = Integer.parseInt(request.getParameter("idPregunta"));
        } catch (NumberFormatException ex) {
            throw new BusinessException(new BusinessMessage(null, "El Nº de pregunta no es válido"));
        }

        Pregunta pregunta = (Pregunta) daoFactory.getDAO(Pregunta.class).read(idPregunta);
        if (pregunta == null) {
            throw new BusinessException(new BusinessMessage(null, "La pregunta solicitada no existe"));
        }

        RespuestaEncuesta respuestaEncuesta = getEncuestaState(request).getRespuestaEncuesta();
        if (respuestaEncuesta.isPreguntaValida(pregunta) == false) {
            throw new BusinessException(new BusinessMessage(null, "La pregunta solicitada no es válida en esta encuesta"));
        }

        RespuestaPregunta respuestaPregunta = respuestaEncuesta.getRespuestaPregunta(pregunta);
        populateRespuestaFromRequest(request, respuestaPregunta);
        List<BusinessMessage> businessMessages = respuestaPregunta.validate();
        if ((businessMessages != null) && (businessMessages.size() > 0)) {
            model.put("businessMessages", businessMessages);
            model.put("respuestaPregunta", respuestaPregunta);
            viewName = "encuestas/pregunta";
        } else {

            Pregunta siguientePregunta = respuestaEncuesta.getRespuestaPregunta(pregunta).siguiente();

            if (siguientePregunta != null) {
                viewName = "redirect:/pregunta.html?idPregunta=" + siguientePregunta.getIdPregunta();
            } else {
                //Era la última pregunta
                if (pregunta.getEncuesta().isImprimir() == true) {
                    //Vamos a la página de imprimir
                    viewName = "redirect:/imprimir.html";
                } else {
                    //Así que vamos a la página de finalizar pq no hay que imprimir nada
                    viewName = "redirect:/finalizar.html";
                }
            }
        }



        return new ModelAndView(viewName, model);
    }

    @RequestMapping(value = {"/anterior.html"})
    public ModelAndView anterior(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        if (request.getCharacterEncoding() == null) {
            try {
                request.setCharacterEncoding("utf-8");
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(EncuestaController.class.getName()).log(Level.WARNING, "no existe el juego de caracteres utf-8", ex);
            }
        }


        int idPregunta;
        try {
            idPregunta = Integer.parseInt(request.getParameter("idPregunta"));
        } catch (NumberFormatException ex) {
            throw new BusinessException(new BusinessMessage(null, "El Nº de pregunta no es válido"));
        }

        Pregunta pregunta = (Pregunta) daoFactory.getDAO(Pregunta.class).read(idPregunta);
        if (pregunta == null) {
            throw new BusinessException(new BusinessMessage(null, "La pregunta solicitada no existe"));
        }

        RespuestaEncuesta respuestaEncuesta = getEncuestaState(request).getRespuestaEncuesta();
        if (respuestaEncuesta.isPreguntaValida(pregunta) == false) {
            throw new BusinessException(new BusinessMessage(null, "La pregunta solicitada no es válida en esta encuesta"));
        }

        RespuestaPregunta respuestaPregunta = respuestaEncuesta.getRespuestaPregunta(pregunta);
        populateRespuestaFromRequest(request, respuestaPregunta);

        Pregunta anteriorPregunta = respuestaEncuesta.getRespuestaPregunta(pregunta).anterior();


        if (anteriorPregunta != null) {
            viewName = "redirect:/pregunta.html?idPregunta=" + anteriorPregunta.getIdPregunta();
        } else {
            //Era la primera pregunta
            //Así que vamos al BackURL
            viewName = "redirect:" + getEncuestaState(request).getBackURI().toASCIIString();
        }



        return new ModelAndView(viewName, model);
    }

    @RequestMapping(value = {"/ultima.html"})
    public ModelAndView ultima(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        if (request.getCharacterEncoding() == null) {
            try {
                request.setCharacterEncoding("utf-8");
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(EncuestaController.class.getName()).log(Level.WARNING, "no existe el juego de caracteres utf-8", ex);
            }
        }


        Pregunta ultimaPregunta;
        ultimaPregunta = getEncuestaState(request).getRespuestaEncuesta().getUltimaPregunta();
        if (ultimaPregunta == null) {
            throw new BusinessException(new BusinessMessage(null, "La encuesta no tiene preguntas"));
        }

        viewName = "redirect:/pregunta.html?idPregunta=" + ultimaPregunta.getIdPregunta();


        return new ModelAndView(viewName, model);
    }

    @RequestMapping(value = {"/imprimir.html"})
    public ModelAndView imprimir(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        if (request.getCharacterEncoding() == null) {
            try {
                request.setCharacterEncoding("utf-8");
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(EncuestaController.class.getName()).log(Level.WARNING, "no existe el juego de caracteres utf-8", ex);
            }
        }

        viewName = "encuestas/imprimir";

        return new ModelAndView(viewName, model);
    }

    @RequestMapping(value = {"/finalizar.html"})
    public ModelAndView finalizar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        if (request.getCharacterEncoding() == null) {
            try {
                request.setCharacterEncoding("utf-8");
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(EncuestaController.class.getName()).log(Level.WARNING, "no existe el juego de caracteres utf-8", ex);
            }
        }

        RespuestaEncuesta respuestaEncuesta = getEncuestaState(request).getRespuestaEncuesta();

        List<BusinessMessage> businessMessages = respuestaEncuesta.validate();
        if ((businessMessages != null) && (businessMessages.size() > 0)) {
            Encuesta encuesta = respuestaEncuesta.getEncuesta();
            model.put("encuesta", encuesta);
            model.put("businessMessages", businessMessages);
            viewName = "encuestas/error_encuesta";
        } else {
            daoFactory.getDAO(RespuestaEncuesta.class).insert(respuestaEncuesta);

            URI backURI = getEncuestaState(request).getBackURI();

            clearEncuestaState(request);

            model.put("backURI", backURI);
            viewName = "encuestas/finalizar";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping(value = {"/documento.pdf"})
    public void documento(HttpServletRequest request, HttpServletResponse response) {
        try {
            Documento documento = getEncuestaState(request).getRespuestaEncuesta().getDocumento();

            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
            response.setHeader("Pragma", "public");
            response.setHeader("Content-Disposition", "attachment; filename=" + documento.getFileName());
            response.setHeader("Content-Disposition", "inline; filename=" + documento.getFileName());


            response.setContentType(documento.getMimetype());
            response.setContentLength(documento.getDatos().length);
            response.getOutputStream().write(documento.getDatos());

            response.getOutputStream().flush();
        } catch (BusinessException ex) {
            //Si se produce un error, no podemos tratarlo pq es un documento
            //¿Como avisamos al usuario?
            //@TODO: Avisar el usuario con un PDF genérico de error
        } catch (Exception ex) {
            //Si se produce un error, no podemos tratarlo pq es un documento
            //¿Como avisamos al usuario?
            //@TODO: Avisar el usuario con un PDF genérico de error
        }
    }

    private EncuestaState getEncuestaState(HttpServletRequest request) throws Exception {
        EncuestaState encuestaState = (EncuestaState) request.getSession().getAttribute("encuestaState");
        if (encuestaState == null) {
            throw new BusinessException(new BusinessMessage(null, "No hay ninguna encuesta en la sesión"));
        }

        return encuestaState;
    }

    private EncuestaState setEncuestaState(HttpServletRequest request, EncuestaState encuestaState) throws Exception {
        if (encuestaState == null) {
            throw new IllegalArgumentException("El argumento 'encuestaState' no puede ser null");
        }

        request.getSession().setAttribute("encuestaState", encuestaState);

        return encuestaState;
    }

    private void clearEncuestaState(HttpServletRequest request) throws Exception {
        request.getSession().setAttribute("encuestaState", null);
    }

    private void populateRespuestaFromRequest(HttpServletRequest request, RespuestaPregunta respuestaPregunta) {

        for (RespuestaItem respuestaItem : respuestaPregunta.getRespuestaItems()) {
            Item item = respuestaItem.getItem();

            respuestaItem.setValor(parameterDecode(request.getParameter("valor" + item.getIdItem())));
            ListaValores listaValores = respuestaItem.getItem().getListaValores();
            if ((listaValores != null) && (listaValores.isContieneValoresNumericos() == true)) {
                Valor valor = listaValores.getValorByNombre(respuestaItem.getValor());
                if (valor != null) {
                    respuestaItem.setValorNumerico(valor.getValorNumerico());
                }
            }


            switch (respuestaPregunta.getPregunta().getTipoPregunta()) {
                case Radio:
                    if (("" + item.getIdItem()).equals(request.getParameter("check1"))) {
                        respuestaItem.setCheck(true);
                    } else {
                        respuestaItem.setCheck(false);
                    }
                    break;
                case Check:
                case EspecificoPorItem:
                    if (("" + item.getIdItem()).equals(request.getParameter("check" + item.getIdItem()))) {
                        respuestaItem.setCheck(true);
                    } else {
                        respuestaItem.setCheck(false);
                    }
                    break;
                default:
                    throw new RuntimeException("El tipo de pregunta es desconocido:" + respuestaPregunta.getPregunta().getTipoPregunta());
            }
        }


    }

    private String parameterDecode(String s) {
        if (s == null) {
            return null;
        }
        //Cambiar los &nbsp; por " " espacios normales
        s = s.replace("\u00a0", " ");

        if (s.trim().equals("")) {
            return null;
        }

        return s.trim();
    }
}
