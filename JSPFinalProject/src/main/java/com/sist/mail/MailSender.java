package com.sist.mail;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sist.data.input.ReserveVO;
import com.sist.vo.*;
public class MailSender {
		public static void main(String[] args) {
			naverMailSend(null,"admin");
		}
		public static void naverMailSend(ReserveVO vo,String id) { 
			 String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
		     String user = ""; // 패스워드 
		     String password = "";      // SMTP 서버 정보를 설정한다. 
		     Properties props = new Properties(); 
		     props.put("mail.smtp.host", host); 
		     props.put("mail.smtp.port", 587); 
		     props.put("mail.smtp.auth", "true"); 
		     Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){ 
		    	 protected PasswordAuthentication getPasswordAuthentication() 
		    	 { 
		    		 return new PasswordAuthentication(user, password); 
		    	 } 
		     }); 
		     try { 
		        	  MimeMessage message = new MimeMessage(session); 
		              message.setFrom(new InternetAddress(user)); 
		              message.addRecipient(Message.RecipientType.TO, new InternetAddress("vcandjava@nate.com")); // 메일 제목 
		              message.setSubject(id+"님 예약 내역입니다!!"); // 메일 내용
		              
		              String html="<p>예약일:2022-03-10</p>";
		              		     
		              message.setContent(html,"text/html;charset=UTF-8"); // send the message 
		              Transport.send(message); 
		              System.out.println("Success Message Send"); 
		         } catch (MessagingException e) 
		          {
		        	 e.printStackTrace();
		          }
		     }
	}

