package com.univar;

import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;
import java.util.Random;

public class TrackingNumberGenerator implements Callable{
    @Override
    public Object onCall(MuleEventContext eventContext) throws Exception {
    	Random r = new Random(System.currentTimeMillis());
		int nextTrackingNbr = r.nextInt(1000000) * -1;
        eventContext.getMessage().setInvocationProperty("nextTrackingNbr", String.valueOf(nextTrackingNbr));
        return eventContext.getMessage().getPayload();
    }

}
