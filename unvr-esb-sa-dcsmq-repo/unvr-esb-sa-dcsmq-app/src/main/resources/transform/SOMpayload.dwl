%dw 1.0
%output application/xml
%namespace ns0 http://webserviceclasses/
---
{
	ns0#sPARKSOMProcessWS: {
		arg0: {
			application: payload.ns0#sPARKSOMProcessWS.arg0.application,
			userId: payload.ns0#sPARKSOMProcessWS.arg0.userId,
			password: '*********',
			salesOffice: payload.ns0#sPARKSOMProcessWS.arg0.salesOffice,
			salesOrder: payload.ns0#sPARKSOMProcessWS.arg0.salesOrder,
			lineItemQuantity: payload.ns0#sPARKSOMProcessWS.arg0.lineItemQuantity,
			planShipDate: payload.ns0#sPARKSOMProcessWS.arg0.planShipDate
		},
		SFOrderId: payload.ns0#sPARKSOMProcessWS.SFOrderId
	}
}