package com.shinhan.auth.mail;



import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class MailDispatcher {

    public static void sendMail(String recipientEmail, String subject, String content) throws MessagingException {
        // 인증 정보
    	String username = "jollery42@gmail.com";
    	String password = "xmeh ponh thcm kigq";

        // SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP 서버 주소 (Gmail 예시)
        props.put("mail.smtp.port", "587"); // SMTP 포트 (TLS: 587, SSL: 465)
        props.put("mail.smtp.auth", "true"); // 인증 사용
        props.put("mail.smtp.starttls.enable", "true"); // TLS 사용

        // 인증 객체 생성
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        // 이메일 메시지 작성
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username)); // 보내는 이메일
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail)); // 받는 이메일
        message.setSubject(subject); // 제목
        message.setText(content); // 본문 내용

        // 이메일 전송
        Transport.send(message);
    }
}
