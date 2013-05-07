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

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lorenzo González
 */
public class Resultado {
    private String title;
    private String subtitle;
    private List<String> labels=new ArrayList<String>();
    private List<Serie> series=new ArrayList<Serie>();

    public Resultado(String title, String subtitle) {
        this.title = title;
        this.subtitle = subtitle;
    }





    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @return the subtitle
     */
    public String getSubtitle() {
        return subtitle;
    }

    /**
     * @return the labels
     */
    public List<String> getLabels() {
        return labels;
    }

    /**
     * @return the series
     */
    public List<Serie> getSeries() {
        return series;
    }
}
