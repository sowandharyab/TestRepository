%dw 1.0
%output application/xml
%namespace ns1 http://com.univar/data/enterprise/core/exception/1.0
---
{
	DCSDB2Response : {
		Exception: {
			ns1#ExceptionId: "UNIVAR-EX-0001",
			ns1#Description: flowVars.exceptionDetails,
			ns1#Category: "SystemAPI",
			ns1#Service: "System"
		}
	}
}