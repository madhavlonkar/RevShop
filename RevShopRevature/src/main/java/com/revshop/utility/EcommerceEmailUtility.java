package com.revshop.utility;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class EcommerceEmailUtility {

    private static final Properties props = new Properties();

    static {
        try (InputStream input = EcommerceEmailUtility.class.getClassLoader().getResourceAsStream("application.properties")) {
            if (input == null) {
                throw new IOException("Sorry, unable to find application.properties");
            }
            props.load(input);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static void sendOrderConfirmationToBuyer(String buyerEmail, String subject, String message) {
        sendEmail(buyerEmail, subject, message, null);
    }

    public static void sendOrderNotificationToSeller(String sellerEmail, String subject, String message) {
        sendEmail(sellerEmail, subject, message, null);
    }

    private static void sendEmail(String recipientEmail, String subject, String message, String attachmentPath) {

        Properties connectionProperties = new Properties();
        connectionProperties.put("mail.smtp.host", props.getProperty("smtp.host"));
        connectionProperties.put("mail.smtp.auth", "true");
        connectionProperties.put("mail.smtp.socketFactory.port", props.getProperty("smtp.port"));
        connectionProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        connectionProperties.put("mail.smtp.port", props.getProperty("smtp.port"));

        Session session = Session.getDefaultInstance(connectionProperties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(props.getProperty("smtp.username"), props.getProperty("smtp.password"));
            }
        });

        try {
            Message emailMessage = new MimeMessage(session);
            emailMessage.setFrom(new InternetAddress(props.getProperty("email.from")));
            emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            emailMessage.setSubject(subject);

            if (attachmentPath == null || attachmentPath.isEmpty()) {
                emailMessage.setText(message);
            } else {
                MimeBodyPart mimeBodyPart = new MimeBodyPart();
                mimeBodyPart.setContent(message, "text/html");

                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(mimeBodyPart);

                MimeBodyPart attachmentBodyPart = new MimeBodyPart();
                attachmentBodyPart.attachFile(new File(attachmentPath));
                multipart.addBodyPart(attachmentBodyPart);

                emailMessage.setContent(multipart);
            }

            Transport.send(emailMessage);
            System.out.println("Email sent successfully to " + recipientEmail);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
