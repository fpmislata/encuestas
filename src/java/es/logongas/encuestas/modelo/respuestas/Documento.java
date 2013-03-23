/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.logongas.encuestas.modelo.respuestas;

/**
 *
 * @author Lorenzo González
 */
public class Documento {
    private byte[] datos;
    private String mimetype;
    private String fileName;

    public Documento(byte[] datos, String mimetype, String fileName) {
        this.datos = datos;
        this.mimetype = mimetype;
        this.fileName = fileName;
    }

    /**
     * @return the datos
     */
    public byte[] getDatos() {
        return datos;
    }

    /**
     * @param datos the datos to set
     */
    public void setDatos(byte[] datos) {
        this.datos = datos;
    }

    /**
     * @return the mimetype
     */
    public String getMimetype() {
        return mimetype;
    }

    /**
     * @param mimetype the mimetype to set
     */
    public void setMimetype(String mimetype) {
        this.mimetype = mimetype;
    }

    /**
     * @return the fileName
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * @param fileName the fileName to set
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
