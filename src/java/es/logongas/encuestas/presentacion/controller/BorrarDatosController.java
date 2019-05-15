/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.presentacion.controller;

import es.logongas.encuestas.modelo.encuestas.Encuesta;
import es.logongas.encuestas.persistencia.services.dao.encuestas.EncuestaDAO;
import es.logongas.ix3.core.conversion.Conversion;
import es.logongas.ix3.dao.DAOFactory;
import es.logongas.ix3.dao.metadata.MetaDataFactory;
import es.logongas.ix3.web.controllers.RESTController;
import es.logongas.ix3.web.json.JsonFactory;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author logongas
 */
@Controller
public class BorrarDatosController {
    @Autowired
    DAOFactory daoFactory;
    @Autowired
    MetaDataFactory metaDataFactory;
    @Autowired
    ConversionService conversionService;
    @Autowired
    JsonFactory jsonFactory;
    @Autowired
    Conversion conversion;    
    private static final Log log = LogFactory.getLog(RESTController.class);
    
   
    
    @RequestMapping(value = {"/Encuesta"}, method = RequestMethod.DELETE)
    public void delete(HttpServletRequest httpRequest, HttpServletResponse httpServletResponse) {
        try {
            EncuestaDAO encuestaDAO = (EncuestaDAO)daoFactory.getDAO(Encuesta.class);

            Date fechaBorrado;
            String parameterfechaBorrado=httpRequest.getParameter("fechaBorrado");
            if ((parameterfechaBorrado==null) || (parameterfechaBorrado.trim().isEmpty())) {
                fechaBorrado=null;
            } else {
                fechaBorrado=(Date)conversion.convertFromString(parameterfechaBorrado, Date.class);
            }
            
            encuestaDAO.deleteAllData(fechaBorrado);

            noCache(httpServletResponse);
            httpServletResponse.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } catch (Exception ex) {
            httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            httpServletResponse.setContentType("text/plain");
            try {
                ex.printStackTrace(httpServletResponse.getWriter());
            } catch (Exception ex2) {
                log.error("Falló al imprimir la traza", ex2);
            }
        }
    } 
    
    private void noCache(HttpServletResponse httpServletResponse) {
        httpServletResponse.setHeader("Cache-Control", "no-cache");
    }     
    
}
