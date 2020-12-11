package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class LogoutAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		request.setAttribute("msg", "�α׾ƿ��ϼ̽��ϴ�.");
		request.setAttribute("url", "loginForm.me");
		return new ActionForward(false,"../alert.jsp");
	}
	
}
