package com.fpt.esanitary.service;

import javax.mail.MessagingException;

public interface MailService {

    void sendMail(String fromAdress, String toAdress, String subject, String msgBody) throws MessagingException;
}
