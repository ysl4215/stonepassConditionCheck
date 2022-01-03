package com.swempire.web.comm.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailUtil {
	
	
	private static String HOST="smtps.hiworks.com";
	private static int PORT=465;
	private static String SENDER_EMAIL="victory@swempire.co.kr";
	private static String SENDER_PASSWORD="thvmxm1234";
	private static String recipient;
	private static String title;
	private static String body="CURL 연결상태 불량입니다.";
	
	
	/*
	 * private static String recipient="victory@swempire.co.kr"; private static
	 * String title="타이틀";
	 */
	
	public static String getRecipient() {
		return recipient;
	}

	public static void setRecipient(String recipient) {
		SendMailUtil.recipient = recipient;
	}

	public static String getTitle() {
		return title;
	}

	public static void setTitle(String title) {
		SendMailUtil.title = title + " CURL 연결상태 불량입니다";
	}

	
	
	public static void main(String[] args) throws AddressException, MessagingException {
		send();
	}
	
	public static void send() throws AddressException, MessagingException {
		
		//system.out.println("HOST ="+HOST);
		//system.out.println("PORT ="+PORT);
		//system.out.println("SENDER_EMAIL ="+SENDER_EMAIL);
		//system.out.println("SENDER_PASSWORD ="+SENDER_PASSWORD);
		
		// SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", HOST); 
        prop.put("mail.smtp.port", PORT); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.starttls.enable", "true");
//        String trust = HOST.replace("smtp\\.", "smtps.");
//        //system.out.println("trust ="+trust);
//        prop.put("mail.smtp.ssl.trust", trust);
        prop.put("mail.smtp.ssl.trust", HOST);
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });
        session.setDebug(true);

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SENDER_EMAIL));
        
        //수신자메일주소
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
        
        // Subject
        message.setSubject(title); //메일 제목을 입력
        
        // Text
        message.setText(body);    //메일 내용을 입력
        
        // send the message
        Transport.send(message); ////전송
        //system.out.println("message sent successfully...");
	}
}
