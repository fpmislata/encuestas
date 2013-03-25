/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.modelo.estadisticas;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lorenzo González
 */
public class Estadistica {
    public long numRespuestas;
    public List<String> labels=new ArrayList<String>();
    public List<Long> rawData=new ArrayList<Long>();
    public List<Double> data=new ArrayList<Double>();
}
