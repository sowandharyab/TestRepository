%dw 1.0
%output application/xml
%namespace ns0 http://webserviceclasses/
---
{
	ns0#sPARKSOCProcessWS: {
		arg0: {
			application: payload.ns0#sPARKSOCProcessWS.arg0.application,
			userId: payload.ns0#sPARKSOCProcessWS.arg0.userId,
			password: '*********',
			salesOffice: payload.ns0#sPARKSOCProcessWS.arg0.salesOffice,
			salesOrder: payload.ns0#sPARKSOCProcessWS.arg0.salesOrder,
			planShipDate: payload.ns0#sPARKSOCProcessWS.arg0.planShipDate
		},
		SFOrderId: payload.ns0#sPARKSOCProcessWS.SFOrderId
	}
}