package com.poly.service.impl;

import javax.servlet.ServletContext;

import com.poly.entity.User;
import com.poly.service.MailService;
import com.poly.utils.SendMailUtil;

public class MailServiceImpl implements MailService {
	private static final String MAIL_WELCOME_SUBJECT = "Welcome to Online Entetainment";
	private static final String MAIL_FORGOT_PASSWORD = "Online Entetainment - New Password";

	@Override
	public void sendMail(ServletContext context, User recipient, String type) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");

		try {
			String content = null;
			String subject = null;
			switch (type) {
			case "welcome":
				subject = MAIL_WELCOME_SUBJECT;
				content = "Dear " + recipient.getUsername() + ", hope you have a good time with me.";
				break;

			case "forgot":
				subject = MAIL_FORGOT_PASSWORD;
				content = "Dear " + recipient.getUsername() + ", this is your new password: "+recipient.getPassword();
				break;

			default:
				subject = "Online Entertainment";
				content = "What is this?";
			}
			SendMailUtil.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
