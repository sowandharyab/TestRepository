%dw 1.0
%output application/xml
%namespace ns0 http://webserviceclasses/
---
{
	ns0#sPARKSOEProcessWS: {
		arg0: {
			SFOrderId: payload.ns0#sPARKSOEProcessWS.arg0.SFOrderId,
			application: payload.ns0#sPARKSOEProcessWS.arg0.application,
			user_id: payload.ns0#sPARKSOEProcessWS.arg0.user_id,
			user_password: '*********',
			customerNumber: payload.ns0#sPARKSOEProcessWS.arg0.customerNumber,
			customerShipTo: payload.ns0#sPARKSOEProcessWS.arg0.customerShipTo,
			customerPO: payload.ns0#sPARKSOEProcessWS.arg0.customerPO,
			department: payload.ns0#sPARKSOEProcessWS.arg0.department,
			shipTerms: payload.ns0#sPARKSOEProcessWS.arg0.shipTerms,
			shipVia: payload.ns0#sPARKSOEProcessWS.arg0.shipVia,
			warehouse: payload.ns0#sPARKSOEProcessWS.arg0.warehouse,
			poOffice: payload.ns0#sPARKSOEProcessWS.arg0.poOffice,
			soOffice: payload.ns0#sPARKSOEProcessWS.arg0.soOffice,
			firstPromiseDate: payload.ns0#sPARKSOEProcessWS.arg0.firstPromiseDate,
			planShipDate: payload.ns0#sPARKSOEProcessWS.arg0.planShipDate,
			ShipComplete: payload.ns0#sPARKSOEProcessWS.arg0.ShipComplete,
			mailInvoice: payload.ns0#sPARKSOEProcessWS.arg0.mailInvoice,
			storeXML: payload.ns0#sPARKSOEProcessWS.arg0.storeXML
		},
		SFOrderId: payload.ns0#sPARKSOEProcessWS.SFOrderId
	}
}