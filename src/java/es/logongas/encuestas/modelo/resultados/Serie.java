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
package es.logongas.encuestas.modelo.resultados;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lorenzo González
 */
public class Serie {
    private long numRespuestas;
    private String name;
    private List<Long> rawData=new ArrayList<Long>();
    private List<BigDecimal> data=new ArrayList<BigDecimal>();
    private EstadisticaDescriptiva estadisticaDescriptiva=null;
    private InferenciaEstadistica inferenciaEstadistica=null;
    private Resultado otros=null;


    public Serie(long numRespuestas, String name) {
        this.numRespuestas = numRespuestas;
        this.name = name;
    }




    /**
     * @return the numRespuestas
     */
    public long getNumRespuestas() {
        return numRespuestas;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @return the rawData
     */
    public List<Long> getRawData() {
        return rawData;
    }

    /**
     * @return the data
     */
    public List<BigDecimal> getData() {
        return data;
    }

    /**
     * @return the estadisticaDescriptiva
     */
    public EstadisticaDescriptiva getEstadisticaDescriptiva() {
        return estadisticaDescriptiva;
    }

    /**
     * @param estadisticaDescriptiva the estadisticaDescriptiva to set
     */
    public void setEstadisticaDescriptiva(EstadisticaDescriptiva estadisticaDescriptiva) {
        this.estadisticaDescriptiva = estadisticaDescriptiva;
    }

    /**
     * @return the inferenciaEstadistica
     */
    public InferenciaEstadistica getInferenciaEstadistica() {
        return inferenciaEstadistica;
    }

    /**
     * @param inferenciaEstadistica the inferenciaEstadistica to set
     */
    public void setInferenciaEstadistica(InferenciaEstadistica inferenciaEstadistica) {
        this.inferenciaEstadistica = inferenciaEstadistica;
    }

    /**
     * @return the otros
     */
    public Resultado getOtros() {
        return otros;
    }

    /**
     * @param otros the otros to set
     */
    public void setOtros(Resultado otros) {
        this.otros = otros;
    }






}
