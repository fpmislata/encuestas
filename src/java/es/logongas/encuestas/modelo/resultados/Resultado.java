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

import es.logongas.encuestas.modelo.encuestas.Item;
import es.logongas.encuestas.modelo.encuestas.Pregunta;
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
    private Pregunta pregunta;
    private Item item;

    public Resultado(Pregunta pregunta) {
        this.pregunta=pregunta;
        this.item=null;
        this.title = pregunta.getEncuesta().getNombre();
        this.subtitle = null;
    }

    public Resultado(Item item) {
        this.item=item;
        this.pregunta=item.getPregunta();
        this.title = item.getPregunta().getEncuesta().getNombre();
        this.subtitle =item.getPregunta().getPregunta();
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

    /**
     * @return the pregunta
     */
    public Pregunta getPregunta() {
        return pregunta;
    }

    /**
     * @return the item
     */
    public Item getItem() {
        return item;
    }
}
