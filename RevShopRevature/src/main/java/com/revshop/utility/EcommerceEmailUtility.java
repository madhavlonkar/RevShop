package com.revshop.utility;

import java.io.File;
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

    // SMTP server credentials
    private static final String SMTP_HOST = "smtp-relay.sendinblue.com";
    private static final String SMTP_PORT = "587";
    private static final String SMTP_USERNAME = "vayavi6626@yasiok.com";
    private static final String SMTP_PASSWORD = "ZDgPTAzQnXOcsESY";
    private static final String FROM_EMAIL = "java88pro@gmail.com";

    /**
     * Sends an order confirmation email to the buyer.
     *
     * @param buyerEmail the buyer's email address
     * @param subject    the email subject
     * @param message    the email message
     */
    public static void sendOrderConfirmationToBuyer(String buyerEmail, String subject, String message) {
        sendEmail(buyerEmail, subject, message, null);
    }

    /**
     * Sends an order notification email to the seller.
     *
     * @param sellerEmail the seller's email address
     * @param subject     the email subject
     * @param message     the email message
     */
    public static void sendOrderNotificationToSeller(String sellerEmail, String subject, String message) {
        sendEmail(sellerEmail, subject, message, null);
    }

    /**
     * Sends an email with optional attachment.
     *
     * @param recipientEmail the recipient's email address
     * @param subject        the email subject
     * @param message        the email message
     * @param attachmentPath the path to the file to attach (optional)
     */
    private static void sendEmail(String recipientEmail, String subject, String message, String attachmentPath) {

        // Create all the needed properties
        Properties connectionProperties = new Properties();
        connectionProperties.put("mail.smtp.host", SMTP_HOST);
        connectionProperties.put("mail.smtp.auth", "true");
        connectionProperties.put("mail.smtp.socketFactory.port", SMTP_PORT);
        connectionProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        connectionProperties.put("mail.smtp.port", SMTP_PORT);

        // Create the session
        Session session = Session.getDefaultInstance(connectionProperties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        try {
            // Create the message
            Message emailMessage = new MimeMessage(session);
            emailMessage.setFrom(new InternetAddress(FROM_EMAIL));
            emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            emailMessage.setSubject(subject);

            if (attachmentPath == null || attachmentPath.isEmpty()) {
                // Simple text email
                emailMessage.setText(message);
            } else {
                // Email with attachment
                MimeBodyPart mimeBodyPart = new MimeBodyPart();
                mimeBodyPart.setContent(message, "text/html");

                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(mimeBodyPart);

                MimeBodyPart attachmentBodyPart = new MimeBodyPart();
                attachmentBodyPart.attachFile(new File(attachmentPath));
                multipart.addBodyPart(attachmentBodyPart);

                emailMessage.setContent(multipart);
            }

            // Send the message
            Transport.send(emailMessage);
            System.out.println("Email sent successfully to " + recipientEmail);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
