package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;

public class DeleteFormAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request,
					HttpServletResponse response) throws Exception {
		if(id.equals("admin")) {
			request.setAttribute("msg", "�����ڴ� Ż�� �� �� �����ϴ�.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		return new ActionForward();
	}

}
