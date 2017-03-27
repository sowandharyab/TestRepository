%dw 1.0
%output application/xml
%input payload application/xml
%namespace p urn:cidx:names:specification:ces:schema:all:5:3
%function split(strData) strData splitBy ('|')
%var trackingNbr = payload.p#OrderCreate.OrderCreateBody.OrderCreateProperties.*ReferenceInformation[?($.@ReferenceType == "BookingNumber")][0].DocumentReference.DocumentIdentifier
%var paymentNumber = payload.p#OrderCreate.OrderCreateBody.OrderCreateProperties.*ReferenceInformation[?($.@ReferenceType == "PaymentNumber")][0].DocumentReference.DocumentIdentifier
%var salesOrderReference = payload.p#OrderCreate.OrderCreateBody.OrderCreateProperties.*ReferenceInformation[?($.@ReferenceType == "SalesOrderReference")][0].DocumentReference.DocumentIdentifier
%var purchaseOrderNumber = payload.p#OrderCreate.OrderCreateBody.OrderCreateProperties.*ReferenceInformation[?($.@ReferenceType == "PurchaseOrderNumber")][0].DocumentReference.DocumentIdentifier

---
{
SalesOrder:{
	CustomerInformation:{
		CustomerID:payload.p#OrderCreate.OrderCreateBody.OrderCreatePartners.Buyer.PartnerInformation.PartnerIdentifier
		                   when payload.p#OrderCreate.OrderCreateBody.OrderCreatePartners.Buyer.PartnerInformation.PartnerIdentifier.@Agency == "AssignedBySeller"
		                   otherwise '',
		ShopperReferenceNumber:'-1',
		CustomerEmail:payload.p#OrderCreate.OrderCreateBody.OrderCreatePartners.Buyer.PartnerInformation.ContactInformation.EmailAddress
		                   when payload.p#OrderCreate.OrderCreateBody.OrderCreatePartners.Buyer.PartnerInformation.ContactInformation?
			               otherwise '',
	    ShipToDeptCd:'04',
		ShipToBranchNbr: '01',
		CustomerPurchaseOrderNumber:payload.p#OrderCreate.OrderCreateBody.OrderCreateProperties.PurchaseOrderNumber.DocumentIdentifier,
		CustomerContactInformation: {
			Name:payload.p#OrderCreate.OrderCreateBody.OrderCreatePartners.Buyer.PartnerInformation.ContactInformation.ContactName
			               when payload.p#OrderCreate.OrderCreateBody.OrderCreatePartners.Buyer.PartnerInformation.ContactInformation?
			               otherwise '',
			PhoneNumber:payload.p#OrderCreate.OrderCreateBody.OrderCreatePartners.Buyer.PartnerInformation.ContactInformation.ContactNumber
			               when payload.p#OrderCreate.OrderCreateBody.OrderCreatePartners.Buyer.PartnerInformation.ContactInformation?
			               otherwise ''
		}
	},
	LiveOrderStatus:'Y',
	OrderSource:'B',
	TrackingNumber: trackingNbr
	                when trackingNbr != null
	                otherwise flowVars.nextTrackingNbr,
	PaymentInformation:{
		ShipViaCode:'RGDV',
		PaymentMethod:split(paymentNumber as :string)[0]
		              when (paymentNumber != null) and (paymentNumber != "")
		              otherwise 'VWRA',
		CreditCardNumber:split(paymentNumber as :string)[2]
		              when (paymentNumber != null) and (paymentNumber != "")
		              otherwise '',
		ExpiryDate: split(paymentNumber as :string)[3]
		              when (paymentNumber != null) and (paymentNumber != "")
		              otherwise ''
	},
	(payload.p#OrderCreate.p#OrderCreateBody.p#OrderCreateDetails.*p#OrderCreateProductLineItem map ((orderCreateProductLineItem , indexOfOrderCreateProductLineItem) -> {
			OrderItem: {
				VWRProductNumber: orderCreateProductLineItem.p#ProductIdentification.ProductIdentifier,
				TaxableIndicator:'Y',
		        OrderQuantity: orderCreateProductLineItem.p#ProductQuantity.Measurement.MeasurementValue,
		        SellingUOM: orderCreateProductLineItem.p#ProductQuantity.Measurement.UnitOfMeasureCode,
		        Price:orderCreateProductLineItem.p#RequestedPrice.Pricing.PricingPerUnit.MonetaryAmount.MonetaryValue,
		        PricingUOM:orderCreateProductLineItem.p#ProductQuantity.Measurement.UnitOfMeasureCode,
		        NeedByDate:orderCreateProductLineItem.p#ScheduleDateTimeInformation.DateTimeInformation.DateTime as :datetime as :string {format: "MM/dd/yyyy"},
		        ItemDeliveryDateTypeIndicator: '',
		        ItemSpecialInstructions: ''
			}
	})),
	(payload.p#OrderCreate.p#OrderCreateBody.p#OrderCreateProperties.*p#SpecialInstructions[?($.@InstructionType == "ShippingInstructions")] map {
		    Instruction: $
	})
	}
}