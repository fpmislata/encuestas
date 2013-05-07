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
import java.math.RoundingMode;
import org.apache.commons.math3.stat.descriptive.DescriptiveStatistics;

/**
 * Estadística descriptiva
 *
 * @author Lorenzo González
 */
public class EstadisticaDescriptiva {

    private DescriptiveStatistics descriptiveStatistics;
    private int numDecimals;

    public EstadisticaDescriptiva(int numDecimals) {
        this.numDecimals = numDecimals;
        descriptiveStatistics = new DescriptiveStatistics();
    }

    public EstadisticaDescriptiva(double[] datos, int numDecimals) {
        this.numDecimals = numDecimals;
        descriptiveStatistics = new DescriptiveStatistics(datos);
    }

    public void addData(double data) {
        descriptiveStatistics.addValue(data);
    }

    /**
     * @return the media
     */
    public BigDecimal getMedia() {
        return getBigDecimal(descriptiveStatistics.getMean());
    }

    /**
     * @return the desviacionEstandar
     */
    public BigDecimal getDesviacionEstandar() {
        return getBigDecimal(descriptiveStatistics.getStandardDeviation());
    }

    /**
     * @return the maximo
     */
    public BigDecimal getMaximo() {
        return getBigDecimal(descriptiveStatistics.getMax());
    }

    /**
     * @return the minimo
     */
    public BigDecimal getMinimo() {
        return getBigDecimal(descriptiveStatistics.getMin());
    }

    /**
     * @return the numMuestras
     */
    public long getNumMuestras() {
        return descriptiveStatistics.getN();
    }

    private BigDecimal getBigDecimal(double doubleData) {
        BigDecimal bigDecimalData = new BigDecimal(doubleData).setScale(numDecimals, RoundingMode.HALF_UP);

        return bigDecimalData;
    }
}
