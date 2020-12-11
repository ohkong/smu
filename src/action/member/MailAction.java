package action.member;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import action.ActionForward;

public class MailAction extends AdminLoginAction{

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String sendid = request.getParameter("naverid");
			String sendpw = request.getParameter("naverpw");
			String recipient = request.getParameter("recipient");
			String title = request.getParameter("title");
			String mtype = request.getParameter("mtype");
			String contents = request.getParameter("contents");
			Properties prop = new Properties();
			prop.put("mail.smtp.host","smtp.naver.com");
			prop.put("mail.smtp.port","465");
			prop.put("mail.smtp.starttls.enable","true");
			prop.put("mail.smtp.auth","true");
			prop.put("mail.debug","true"); 
			prop.put("mail.smtp.user",sendid); 
			prop.put("mail.smtp.socketFactory.port","465");
			prop.put("mail.smtp.socketFactory.class",
								"javax.net.ssl.SSLSocketFactory");
			prop.put("mail.smtp.socketFactory.fallback","false");
			MyAuthenticator auth = new MyAuthenticator(sendid, sendpw);
			Session session = Session.getInstance(prop, auth);
			MimeMessage mail = new MimeMessage(session);
			mail.setFrom(new InternetAddress(sendid)); 
			String[] recaddr = recipient.split(",");
			InternetAddress[] address = 
						new InternetAddress[recaddr.length];
			for(int i = 0; i<recaddr.length;i++) {
				address[i] = new InternetAddress(recaddr[i]);
			}
			mail.setRecipients(Message.RecipientType.TO, address);
			mail.setSubject(title);
			mail.setSentDate(new Date());
			mail.setText(contents);
			MimeMultipart multipart = new MimeMultipart();
			MimeBodyPart body = new MimeBodyPart();
			body.setContent(contents,mtype);
			multipart.addBodyPart(body);
			mail.setContent(multipart); 
			Transport.send(mail); 
			request.setAttribute("msg", String.join("\\n",recaddr)
									+ "\\n�������� �Ϸ�.");
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "�������� �� ���� �߻�.");
		}
		request.setAttribute("url", "list.me");
		return new ActionForward(false, "../alert.jsp");
	}
	private final class MyAuthenticator extends Authenticator{
		private String id;
		private String pw;
		public MyAuthenticator(String id, String pw) {
			this.id=id;
			this.pw=pw;
		}
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(id, pw);
	}
	}

}
