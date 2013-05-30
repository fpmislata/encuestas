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
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.oned.Code39Writer;
import com.google.zxing.qrcode.QRCodeWriter;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.util.Random;
import org.apache.commons.codec.binary.Base32;

/**
 * Clase para la generacion de código únicos de verificacion seguros.
 * @author Lorenzo González
 */
public class CodigoVerificacionSeguro {

    /**
     * Crea un código de verificación seguro único
     * @param tipo El tipo del documento.. Es responsable del que llama a ésta función coordinarse con los tipos
     * @param key La clave del documento.
     * @return String con el código de verificación seguro
     */
    static public String createCodigoVerificacionSeguro(byte tipo, int key) {
        try {
            //Generar el Nº aleatorio
            int numeroAleatorio = new Random().nextInt(Integer.MAX_VALUE);

            //Genera el array de datos con el tipo, key y el nº aleatorio
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            DataOutputStream dataOutputStream = new DataOutputStream(byteArrayOutputStream);
            dataOutputStream.writeByte(tipo);
            dataOutputStream.writeInt(key);
            dataOutputStream.writeInt(numeroAleatorio);
            byte[] datos = byteArrayOutputStream.toByteArray();

            //Trasformarlo en un String en Base32
            Base32 base32 = new Base32();
            String codigoVerificacionSeguro = base32.encodeAsString(datos);

            //Quitamos el "=" del final pq no se puedo codificar con el código de barras.
            codigoVerificacionSeguro=codigoVerificacionSeguro.substring(0,codigoVerificacionSeguro.indexOf('='));

            return codigoVerificacionSeguro;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }


    }

    /**
     * Genera una imagen en formato PNG con un código de barras en función del código de verificación seguro
     * @param codigoVerificacionSeguro El código de verificación seguro del que se genera el código de barras
     * @param ancho Ancho en píxeles de la imagen generada
     * @param alto Alto en píxeles de la imagen generada
     * @return Los bytes de la imagen del código de barras en formato PNG
     */
    public static byte[] getBarCode(String codigoVerificacionSeguro,int ancho,int alto) {
        try {
            Code39Writer  writer = new Code39Writer();
            BitMatrix bitMatrix = writer.encode(codigoVerificacionSeguro, BarcodeFormat.CODE_39, ancho, alto);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "png", byteArrayOutputStream);

            return byteArrayOutputStream.toByteArray();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    /**
     * Genera una imagen en formato PNG con un código QR en función del código de verificación seguro
     * @param codigoVerificacionSeguro El código de verificación seguro del que se genera el código de barras
     * @param tamanyo tamanyo del lado en píxeles de la imagen generada. La iamgen es cuadrada
     * @return Los bytes de la imagen del código QR en formato PNG
     */
    public static byte[] getQRCode(String codigoVerificacionSeguro,int tamanyo) {
        try {
            QRCodeWriter writer = new QRCodeWriter();
            BitMatrix bitMatrix = writer.encode(codigoVerificacionSeguro, BarcodeFormat.QR_CODE, tamanyo, tamanyo);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "png", byteArrayOutputStream);

            return byteArrayOutputStream.toByteArray();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
