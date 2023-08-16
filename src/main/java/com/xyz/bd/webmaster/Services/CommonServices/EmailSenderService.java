package com.xyz.bd.webmaster.Services.CommonServices;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.List;

@Service
public class EmailSenderService {
    @Autowired
    private JavaMailSender sender;

    @Value("${spring.mail.from}")
    private String fromAddress;


    private final Logger logger = LoggerFactory.getLogger(this.getClass().getName());

    public boolean sendEmail(String toEmail, String body, String subject, String cc) {
        MimeMessage mimeMessage = sender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
        try {
            helper.setTo(InternetAddress.parse(toEmail));
            if (!cc.equals(""))
                helper.setCc(InternetAddress.parse(cc));
            // helper.setTo(toEmail);
            helper.setSubject(subject);
            helper.setText(body, true);
            helper.setFrom(fromAddress);
            sender.send(mimeMessage);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return false;
    }

    public boolean sendEmailWithAttachment(String toEmail, String body, String subject, String toCC, List<File> files) throws MessagingException {
        MimeMessage mimeMessage = sender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
        try {

            helper.setTo(InternetAddress.parse(toEmail));
            helper.setCc(InternetAddress.parse(toCC));
            // helper.setTo(toEmail);
            helper.setSubject(subject);
            helper.setText(body, true);
            helper.setFrom(fromAddress);

            files.forEach((file) -> {
                try {
                    helper.addAttachment(file.getName(), file);
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            });

            sender.send(mimeMessage);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return false;
    }
}
