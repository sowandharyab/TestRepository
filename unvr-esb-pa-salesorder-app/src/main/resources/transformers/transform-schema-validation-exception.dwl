%dw 1.0
%output application/xml
%namespace ns1 http://com.univar/data/enterprise/core/exception/1.0
---
{
	CumulativeTotalResponse @(xmlns: "http://com.univar/data/enterprise/business/salesorder/messages/1.0"): {
		Exception: {
			ns1#ExceptionId: "UNIVAR-EX-0004",
			ns1#Description: "Error in schema validation, please verify input values.",
			ns1#Details: flowVars.exceptionDetails,
			ns1#Category: "SystemAPI",
			ns1#Service: "System"
		}
	}
}