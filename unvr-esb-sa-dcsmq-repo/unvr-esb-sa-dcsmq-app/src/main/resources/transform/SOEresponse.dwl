%dw 1.0
%output application/xml
%namespace ns0 http://webserviceclasses/
---
{
	ns0#sPARKSOEProcessWSResponse: {
		return: payload.ns0#sPARKSOEProcessWSResponse.return,
		SFOrderId: flowVars.SFOrderId
	}
}