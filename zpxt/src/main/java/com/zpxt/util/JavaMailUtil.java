package com.zpxt.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.sun.mail.smtp.SMTPTransport;

public class JavaMailUtil {

	private JavaMailUtil(){}
	
	//发送人
	private static final String from = "foolchum@163.com";
	private static final String smtp = "smtp.163.com";
	private static final String user = "foolchum";
	private static final String authCode = "wkj224";
	
	public static void sendMail(String to,String subject,String content){
		try {
			//1.设置邮件服务器以及开启邮件服务器的认证
			Properties props = System.getProperties();
			props.put("mail.smtp.host", smtp);
			props.put("mail.smtp.auth", "true");
			//2.创建Session对象，用于发送邮件
			Session session = Session.getInstance(props);
			//2.1设置调试模式，可以打印发送邮件的具体信息（开发可用，上线关闭）
			session.setDebug(true);
			//3.创建邮件主题（发送人，接收人，标题，内容，附件）
			MimeMessage message = new MimeMessage(session);
			//3.1设置发送人
			message.setFrom(new InternetAddress(from));
			//3.2设置接收人
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parseHeader(to, false));
			//3.3设置邮件标题
			message.setSubject(subject);
			//3.4设置邮件内容和附件
			MimeBodyPart mbp1 = new MimeBodyPart();
			//3.4.1不解析HTML文本
			//mbp.setText("");
			//3.4.2解析HTML文本
			mbp1.setContent(content, "text/html;charset=utf-8");
			
			//3.4.3设置附件
			//MimeBodyPart mbp2 = new MimeBodyPart();
			//File file = new File("");
			//mbp2.attachFile(file);
			
			MimeMultipart multipart = new MimeMultipart();
			multipart.addBodyPart(mbp1);
			
			//multipart.addBodyPart(mbp2);
			message.setContent(multipart);
			//4.创建邮件协议对象
			SMTPTransport transport = (SMTPTransport) session.getTransport("smtp");
			//设置发送邮件的账号以及授权码
			transport.connect(user, authCode);
			//发送邮件
			transport.sendMessage(message, message.getAllRecipients());
			//关闭协议对象
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
