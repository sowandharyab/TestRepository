package com.univar;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.SimpleTimeZone;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.IvParameterSpec;

import sun.misc.BASE64Encoder;

public class InvoiceDetails {

	private String InvoiceNumber;

	public String getInvoiceNumber() {
		return InvoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		InvoiceNumber = invoiceNumber;
	}

	public String generateInvoiceURL(String passPhrase, String iV,
			String clientId, String baseURL, String invoiceNumber ) {
		String URL = baseURL;
		try {
			String encryptedString = null;
			byte[] encryptKey = passPhrase.getBytes("UTF8");
			byte[] IV = iV.getBytes("UTF8");

			DESedeKeySpec spec = new DESedeKeySpec(encryptKey);
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DESede");
			SecretKey theKey = keyFactory.generateSecret(spec);
			Cipher cipher = Cipher.getInstance("DESede/CBC/PKCS5Padding");

			IvParameterSpec IvParameters = new IvParameterSpec(IV);
			cipher.init(Cipher.ENCRYPT_MODE, theKey, IvParameters);
			String ts = getCurrentTimeStamp();
			String req = "<REQUEST clientId=\""
					+ clientId
					+ "\" reqId=\"1\" ts=\""
					+ ts
					+ "\" type=\"DOCPDFBYINVNBR\"><PARAMETER key=\"invNbr\" val=\""
					+ invoiceNumber + "\"/><PARAMETER key=\"contentDisposition\" val=\"INLINE\"/></REQUEST>";
			System.out.println("req" + req);
			byte[] plaintext = req.getBytes();
			byte[] encryptedText = cipher.doFinal(plaintext);

			BASE64Encoder base64encoder = new BASE64Encoder();
			encryptedString = base64encoder.encode(encryptedText);

			URL += "?req=" + encryptedString;
			System.out.println(URL);

		} catch (Exception exc) {
			exc.printStackTrace();
		}
		return URL;
	}

	public static String getCurrentTimeStamp() {
		java.util.Date dtCurrentDate;
		String strCurrentDate;

		dtCurrentDate = new java.util.Date();
		java.text.SimpleDateFormat sdf = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss.SSS");
		java.util.Calendar cal = Calendar.getInstance(new SimpleTimeZone(0,
				"GMT"));
		sdf.setCalendar(cal);
		strCurrentDate = sdf.format(dtCurrentDate);
		System.out.println("strCurrentDate" + strCurrentDate);
		return strCurrentDate;
	}

}
