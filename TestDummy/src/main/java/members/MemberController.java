
package members;


import java.io.IOException;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberDAO memberDAO;

	public void init() throws ServletException {
		memberDAO = new MemberDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		System.out.printf("@ member.MemberController.doHandle(%s)%n", request.getMethod());
		
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		
		System.out.println("@@ action:" + action);
		
		if (action == null || action.equals("/memberList.do")) {
			List<MemberVO> membersList = memberDAO.getMembers();
			request.setAttribute("membersList", membersList);
			nextPage = "/members/memberList.jsp";
		} 
		else if (action.equals("/addMember.do")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			MemberVO memberVO = new MemberVO(id, name, pwd, email, tel);
			memberDAO.addMember(memberVO);
			request.setAttribute("msg", "addMember");
			nextPage = "/member/memberList.do";
		} 
		else if (action.equals("/memberForm.do")) {
			nextPage = "/members/memberForm.jsp";
		}
		else if(action.equals("/memberEditForm.do")){
		     String id = request.getParameter("id");
		     MemberVO memInfo = memberDAO.getMember(id);
		     request.setAttribute("memInfo", memInfo);
		     nextPage="/members/memberEditForm.jsp";
		}
		else if(action.equals("/editMember.do")){
		     String id = request.getParameter("id");
		     String name = request.getParameter("name");
		     String pwd = request.getParameter("pwd");
	         String email = request.getParameter("email");
	         String tel = request.getParameter("tel");
		     MemberVO memberVO = new MemberVO(id, name, pwd, email, tel);
		     memberDAO.updateMember(memberVO);
		     request.setAttribute("msg", "modified");
		     nextPage="/member/memberList.do";
		}
		else if(action.equals("/delMember.do")){
		     String id=request.getParameter("id");
		     memberDAO.delMember(id);
		     request.setAttribute("msg", "deleted");
		     nextPage="/member/memberList.do";
		}
		else {
			List<MemberVO> membersList = memberDAO.getMembers();
			request.setAttribute("membersList", membersList);
			nextPage = "/members/memberList.jsp";
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}
