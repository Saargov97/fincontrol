package test;

import support.SendEmail;
import static org.junit.Assert.assertNotEquals;
import org.junit.Test;

public class SendMailTest {
    
    @Test
    public void SendMailTest() {
        SendEmail sm = new SendEmail();
        sm.Send("", "", "");
        
        assertNotEquals(true, true);
    }
}
