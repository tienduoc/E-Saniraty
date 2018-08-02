package com.fpt.esanitary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class MailServiceImpl implements MailService {

    @Autowired
    private JavaMailSender mailSender;

    @Async
    @Override
    public void sendMail(String fromAdress, String toAdress, String subject, String msgBody) throws MessagingException {

        MimeMessage message = mailSender.createMimeMessage();
        boolean multipart = true;
        MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "utf-8");
        String htmlMsg = msgBody;
        message.setContent(htmlMsg, "text/html; charset=utf-8");
        helper.setTo(toAdress);
        helper.setSubject(subject);
        this.mailSender.send(message);
    }
}
