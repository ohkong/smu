package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class IdAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email=request.getParameter("email");
		String tel=request.getParameter("tel");
		MemberDao dao = new MemberDao();
		String id = dao.idSearch(email,tel); 
		request.setAttribute("id", id);
		String msg=null;
		String url=null;
		if(id==null) {
			msg = "������ �´� id�� ã���� �����ϴ�.";
			url = "idForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false,"../alert.jsp");
		}
		return new ActionForward();
	}
}
