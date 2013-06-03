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
package es.logongas.util.seguridad;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.LuminanceSource;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.oned.Code39Writer;
import com.google.zxing.qrcode.QRCodeReader;
import com.google.zxing.qrcode.QRCodeWriter;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import org.apache.commons.codec.binary.Base32;

/**
 * Clase para la generacion de código únicos de verificacion seguros.
 *
 * @author Lorenzo González
 */
public class CodigoVerificacionSeguro {

    //OJO:Si se cambia el nombre de la variable se debe cambiar tambien algún hbm de persistencia de Hiebrante.
    private String valor;

    private CodigoVerificacionSeguro() {
        //Lo necesita Hibernate
    }

    private CodigoVerificacionSeguro(String valor) {
        this.valor = valor;
    }

    /**
     * Crea un código de verificación seguro único en base al String con el
     * valor
     *
     * @param valor Este valor se obtiene de unba instancia de llamar al método
     * getValor()
     * @return El código de verificación seguro
     */
    public static CodigoVerificacionSeguro getInstance(String valor) {
        return new CodigoVerificacionSeguro(valor);
    }

    /**
     * Crea un código de verificación seguro único
     *
     * @param key La clave del documento.
     * @return El código de verificación seguro
     */
    public static CodigoVerificacionSeguro getInstance(int key) {
        return new CodigoVerificacionSeguro(createValor(key));
    }

    /**
     * Crea un código de verificación seguro único a paritr de una imagen que
     * está en un array de datos
     *
     * @param imageInputStream Los bytes de la imagen
     * @return El código de verificación seguro
     */
    public static CodigoVerificacionSeguro getInstanceFromImageQRCode(InputStream imageInputStream) {
        try {
            BufferedImage originalImage = ImageIO.read(imageInputStream);
            BufferedImage image = resizeImage(originalImage, 0.5); //Hacemos mas pequeña la imagen pq sino no lee bien el código.
            LuminanceSource source = new BufferedImageLuminanceSource(image);
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));

            QRCodeReader qRCodeReader = new QRCodeReader();
            Result result = qRCodeReader.decode(bitmap);

            return new CodigoVerificacionSeguro(String.valueOf(result.getText()));
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public String getValor() {
        return valor;
    }

    public int getKey() {
        try {
            Base32 base32 = new Base32();
            byte datos[] = base32.decode(valor);
            DataInputStream dataInputStream = new DataInputStream(new ByteArrayInputStream(datos));
            int key = dataInputStream.readInt();

            return key;
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
    }

    public boolean isValido() {
        try {
            Base32 base32 = new Base32();
            byte datos[] = base32.decode(valor);
            DataInputStream dataInputStream = new DataInputStream(new ByteArrayInputStream(datos));
            int key = dataInputStream.readInt();
            int numeroAleatorio = dataInputStream.readInt();
            int crcReal = dataInputStream.readInt();

            CRC crc = new CRC();
            crc.update(key).update(numeroAleatorio);

            if (crcReal == crc.getCRC()) {
                return true;
            } else {
                return false;
            }
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
    }

    private static String createValor(int key) {
        try {
            //Generar el Nº aleatorio
            int numeroAleatorio = new Random().nextInt(Integer.MAX_VALUE);
            CRC crc = new CRC();
            crc.update(key).update(numeroAleatorio);


            //Genera el array de datos con el tipo, key y el nº aleatorio
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            DataOutputStream dataOutputStream = new DataOutputStream(byteArrayOutputStream);
            dataOutputStream.writeInt(key);
            dataOutputStream.writeInt(numeroAleatorio);
            dataOutputStream.writeInt(crc.getCRC());

            byte[] datos = byteArrayOutputStream.toByteArray();

            //Trasformarlo en un String en Base32
            Base32 base32 = new Base32();
            String codigoVerificacionSeguro = base32.encodeAsString(datos);

            //Quitamos el "=" del final pq no se puedo codificar con el código de barras.
            codigoVerificacionSeguro = codigoVerificacionSeguro.substring(0, codigoVerificacionSeguro.indexOf('='));

            return codigoVerificacionSeguro;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }


    }

    /**
     * Genera una imagen en formato PNG con un código de barras del código de
     * verificación seguro
     *
     * @param ancho Ancho en píxeles de la imagen generada
     * @param alto Alto en píxeles de la imagen generada
     * @return Los bytes de la imagen del código de barras en formato PNG
     */
    public byte[] getBarCode(int ancho, int alto) {
        try {
            Code39Writer writer = new Code39Writer();
            BitMatrix bitMatrix = writer.encode(valor, BarcodeFormat.CODE_39, ancho, alto);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "png", byteArrayOutputStream);

            return byteArrayOutputStream.toByteArray();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    /**
     * Genera una imagen en formato PNG con un código QR del código de
     * verificación seguro
     *
     * @param tamanyo tamanyo del lado en píxeles de la imagen generada. La
     * iamgen es cuadrada
     * @return Los bytes de la imagen del código QR en formato PNG
     */
    public byte[] getQRCode(int tamanyo) {
        try {
            QRCodeWriter writer = new QRCodeWriter();
            BitMatrix bitMatrix = writer.encode(valor, BarcodeFormat.QR_CODE, tamanyo, tamanyo);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "png", byteArrayOutputStream);

            return byteArrayOutputStream.toByteArray();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    /**
     * Esta función se aplica pq para imagenes muy grandes no reconoce el código
     * QR
     *
     * @param originalImage La imagen original
     * @param f El factor de escalado
     * @return La iamgen reescalada.
     */
    private static BufferedImage resizeImage(BufferedImage originalImage, double f) {
        int ancho = (int) (((double) originalImage.getWidth()) * f);
        int alto = (int) (((double) originalImage.getHeight()) * f);
        int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
        BufferedImage resizedImage = new BufferedImage(ancho, alto, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, ancho, alto, null);
        g.dispose();

        return resizedImage;
    }
}
