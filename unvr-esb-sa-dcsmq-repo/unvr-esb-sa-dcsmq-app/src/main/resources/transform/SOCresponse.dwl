%dw 1.0
%output application/xml
%namespace ns0 http://webserviceclasses/
---
{
	ns0#sPARKSOCProcessWSResponse: {
		return: payload.ns0#sPARKSOCProcessWSResponse.return,
		SFOrderId: flowVars.SFOrderId,
		AfterPSB : flowVars.AfterPSB
	}
}