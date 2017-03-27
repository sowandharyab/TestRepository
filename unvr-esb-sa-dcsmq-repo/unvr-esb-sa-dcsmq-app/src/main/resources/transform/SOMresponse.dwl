%dw 1.0
%output application/xml
%namespace ns0 http://webserviceclasses/
---
{
	ns0#sPARKSOMProcessWSResponse: {
		return: payload.ns0#sPARKSOMProcessWSResponse.return,
		SFOrderId: flowVars.SFOrderId
	}
}