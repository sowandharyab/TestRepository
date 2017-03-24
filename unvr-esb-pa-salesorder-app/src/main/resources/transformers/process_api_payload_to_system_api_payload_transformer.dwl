%dw 1.0
%input payload application/xml
%output application/xml
---
CumulativeTotalRequest @(xmlns: "http://com.univar/data/enterprise/business/salesorder/messages/1.0"):  {
	CorporateCode: payload.CumulativeTotalRequest.CorpCode,
	Account: {
		AROfficeCode: payload.CumulativeTotalRequest.CustAROfficeCode,
		CustomerNumber: payload.CumulativeTotalRequest.CustomerNumber,
		ShipToSuffix: payload.CumulativeTotalRequest.CustomerShipToSuffix
	},
	Period: {
		StartDate: payload.CumulativeTotalRequest.OrderEntryStartDate,
		EndDate: payload.CumulativeTotalRequest.OrderEntryEndDate
	}
}
