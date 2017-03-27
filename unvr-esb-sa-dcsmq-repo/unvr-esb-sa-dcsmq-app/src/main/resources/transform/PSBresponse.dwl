%dw 1.0
%output application/xml
%namespace ns0 http://webserviceclasses/
---
{
	ns0#sPARKPSBProcessWSResponse: {
		return: payload.ns0#sPARKPSBProcessWSResponse.return,
		SFOrderId: flowVars.SFOrderId
	}
}