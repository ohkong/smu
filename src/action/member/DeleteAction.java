package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class DeleteAction extends UserLoginAction{
	@Override
	public ActionForward doExecute(HttpServletRequest request,
					HttpServletResponse response) throws Exception {
		if(id.equals("admin")) {
			request.setAttribute("msg", "�����ڴ� Ż�� �� �� �����ϴ�.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		String pass =request.getParameter("pass");
		String msg=null;
		String url=null;
		if(login.equals("admin")) {	 
			url="list.me";
		}else{						
			url="loginForm.me";
		}
		Member dbmem = null;
		MemberDao dao = new MemberDao();
		dbmem = dao.selectOne(login);
		if(pass.equals(dbmem.getPass())) {	
			if(dao.delete(id)>0) {
				if(login.equals("admin")) {
					msg = id + "����ڸ� ����Ż�� ����";
				}else {
					msg = id + "���� ȸ��Ż�� �Ϸ�Ǿ����ϴ�.";
					request.getSession().invalidate(); 
				}
			}else {	
				msg = id + "���� Ż��� �����߻�.";
				if(!login.equals("admin")) {
					url = "info.me?id=" + id;
				}
			}
		}else {	
			msg = login + "���� ��й�ȣ�� Ʋ���ϴ�.";
			url = "deleteForm.me?id=" + id;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
