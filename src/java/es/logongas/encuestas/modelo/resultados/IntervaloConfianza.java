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

/**
 * Intervalo de confianzar de un valor como la media o la desviación ,etc.
 * @author Lorenzo González
 */
public class IntervaloConfianza {
    private BigDecimal inferior;
    private BigDecimal superior;
    private BigDecimal nivelConfianza;

    public IntervaloConfianza(BigDecimal inferior, BigDecimal superior, BigDecimal nivelConfianza) {
        this.inferior = inferior;
        this.superior = superior;
        this.nivelConfianza = nivelConfianza;
    }




    /**
     * @return the inferior
     */
    public BigDecimal getInferior() {
        return inferior;
    }

    /**
     * @return the superior
     */
    public BigDecimal getSuperior() {
        return superior;
    }

    /**
     * @return the nivelConfianza
     */
    public BigDecimal getNivelConfianza() {
        return nivelConfianza;
    }

}
