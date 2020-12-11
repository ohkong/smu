package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;

public class LoginAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = new MemberDao().selectOne(id);
		if(mem == null) {
			request.setAttribute("msg", "���̵� Ȯ���ϼ���.");
			request.setAttribute("url", "loginForm.me");
		} else {
			if(pass.equals(mem.getPass())) {
				request.getSession().setAttribute("login", id);
				request.getSession().setAttribute("picture", mem.getPicture());
				request.setAttribute("msg", mem.getName()+"���� �α��� �߽��ϴ�.");
				request.setAttribute("url", "main.me");
			}else {
				request.setAttribute("msg", "��й�ȣ�� Ʋ���ϴ�.");
				request.setAttribute("url", "loginForm.me");
			}
		}
		return new ActionForward(false,"../alert.jsp");
	}

}
