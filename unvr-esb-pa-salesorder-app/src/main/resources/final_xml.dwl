%dw 1.0
%namespace orderRes http://com.univar/data/enterprise/business/order/message/1.0
%output application/xml 
---
	orderRes#OrderResponse: {
		orderRes#ResultSet: flowVars.DCS ++ flowVars.EDW
			
			
		
		
	}
