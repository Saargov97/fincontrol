/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import support.SendEmail;
import static org.junit.Assert.assertNotEquals;
import org.junit.Test;

/**
 *
 * @author Rafa_
 */
public class SendMailTest {
    
    @Test
    public void SendMailTest() {
        SendEmail sm = new SendEmail();
        sm.Send("", "", "");
        
        assertNotEquals(true, true);
    }
}
