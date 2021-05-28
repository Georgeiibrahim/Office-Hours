
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class SendMailUsingAuthentication
{
  public static void sendMail(String recepient,String subject,String body) throws Exception{
       System.out.println("preparing sent");
      Properties prop =new Properties();
      prop.put("mail.smtp.auth","true");
       prop.put("mail.smtp.starttls.enable","true");
        prop.put("mail.smtp.host","smtp.gmail.com"); 
        prop.put("mail.smtp.port","587");
        String myaccountmail ="george.hima55@gmail.com";
        String password= "22359187";
        Session session = Session.getInstance(prop,new Authenticator() {
        
        @Override
        protected PasswordAuthentication getPasswordAuthentication(){
            return new PasswordAuthentication(myaccountmail,password);
        }
        });
        Message message = prepareMessage( session , myaccountmail , recepient,subject,body);
        Transport.send(message);
        System.out.println("successfuly sent");
  }

    private static Message prepareMessage(Session session, String myaccountmail, String recepient,String subject,String body) throws MessagingException {
        try {
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myaccountmail));
            message.setRecipient(Message.RecipientType.TO,new InternetAddress(recepient));
            message.setSubject(subject);
            message.setText(body);
            return message;
        } catch (AddressException ex) {
          Logger.getLogger(SendMailUsingAuthentication.class.getName()).log(Level.SEVERE, null, ex);
      }
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}