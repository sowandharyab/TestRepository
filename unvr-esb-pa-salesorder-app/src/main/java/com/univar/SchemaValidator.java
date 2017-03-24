package com.univar;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import javax.xml.XMLConstants;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.xml.sax.SAXException;

public class SchemaValidator {
	
	private String schemaString;
	
	public void setSchemaString(String schemaString) {
		this.schemaString = schemaString;
	}

	public String validateXML(String xmlContent, String strUrl)
			throws SAXException, IOException {
		
		URL xsdUrl = new URL (strUrl);
		Source xmlFile = new StreamSource(new StringReader(xmlContent));
		SchemaFactory schemaFactory = SchemaFactory
				.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
		Schema schema = schemaFactory.newSchema(xsdUrl);

		// validate XML against the schema.
		Validator validator = schema.newValidator();
		validator.validate(xmlFile);
		return xmlContent;
	}
	
/*	
	public String validateXML(String xmlContent)
			throws SAXException, IOException {
		
		Source xmlFile = new StreamSource(new StringReader(xmlContent));
		SchemaFactory schemaFactory = SchemaFactory
				.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
		Source schemaSource = new StreamSource(new ByteArrayInputStream(
				schemaString.getBytes(StandardCharsets.UTF_8)));
		Schema schema = schemaFactory.newSchema(schemaSource);

		// validate XML against the schema.
		Validator validator = schema.newValidator();
		validator.validate(xmlFile);
		return xmlContent;
	}
*/	
}
