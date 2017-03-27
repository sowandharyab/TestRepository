%dw 1.0
%output application/xml
%namespace ns0 http://webserviceclasses/
---
{
	ns0#sPARKPSBProcessWS: {
		arg0: {
			application: payload.ns0#sPARKPSBProcessWS.arg0.application,
			custPO: payload.ns0#sPARKPSBProcessWS.arg0.custPO,
			custShipTo: payload.ns0#sPARKPSBProcessWS.arg0.custShipTo,
			customer_nbx: payload.ns0#sPARKPSBProcessWS.arg0.customer_nbx,
			deliveryDate: payload.ns0#sPARKPSBProcessWS.arg0.deliveryDate,
			currency: payload.ns0#sPARKPSBProcessWS.arg0.currency,
			mailInvoice: payload.ns0#sPARKPSBProcessWS.arg0.mailInvoice,
			dept: payload.ns0#sPARKPSBProcessWS.arg0.dept,
			msgText: payload.ns0#sPARKPSBProcessWS.arg0.msgText,
			poOffice: payload.ns0#sPARKPSBProcessWS.arg0.poOffice,
			psbOrderNbx: payload.ns0#sPARKPSBProcessWS.arg0.psbOrderNbx,
			shipTerm: payload.ns0#sPARKPSBProcessWS.arg0.shipTerm,
			shipVia: payload.ns0#sPARKPSBProcessWS.arg0.shipVia,
			soOffice: payload.ns0#sPARKPSBProcessWS.arg0.soOffice,
			storeXML: payload.ns0#sPARKPSBProcessWS.arg0.storeXML,
			user_id: payload.ns0#sPARKPSBProcessWS.arg0.user_id,
			user_password: '*********',
			warehouse: payload.ns0#sPARKPSBProcessWS.arg0.warehouse,
			messagesXML: payload.ns0#sPARKPSBProcessWS.arg0.messagesXML
		},
		SFOrderId: payload.ns0#sPARKPSBProcessWS.SFOrderId
	}
}