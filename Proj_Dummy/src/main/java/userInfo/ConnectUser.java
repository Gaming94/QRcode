
package userInfo;


import java.io.IOException;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/user/*")
public class ConnectUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;
	OracleConnector oraConn;

	public void init() throws ServletException {
		userDAO = new UserDAO();
		oraConn = new OracleConnector();
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
		
		if (action == null || action.equals("/Main.do")) {
			nextPage = "/00_Main/Main.jsp";
		}
		else if (action.equals("/loginCheck.do")) {			
			nextPage = "/00_Main/Main.jsp";
		}
		else if (action.equals("/userInfo.do")) {
			List<UserVO> userList = userDAO.loadUser();
			request.setAttribute("userList", userList);
			nextPage = "/01_Regist/userInfo.jsp";
		} 
		else if (action.equals("/userJoin.do")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			UserVO userVO = new UserVO(id, name, pwd, email, tel);
			oraConn.Connect();
			userDAO.userJoin(userVO);			
			request.setAttribute("msg", "userJoined");
			nextPage = "/user/Main.do";
		} 
		else if (action.equals("/signUp.do")) {
			nextPage = "/01_Regist/signUp.jsp";
		}
		else if(action.equals("/userEdit.do")){
		     String id = request.getParameter("id");
		     UserVO Info = userDAO.joinInfo(id);
		     request.setAttribute("Info", Info);
		     nextPage="/01_Regist/userEdit.jsp";
		}
		else if(action.equals("/userModify.do")){
		     String id = request.getParameter("id");
		     String name = request.getParameter("name");
		     String pwd = request.getParameter("pwd");
	         String email = request.getParameter("email");
	         String tel = request.getParameter("tel");
		     UserVO userVO = new UserVO(id, name, pwd, email, tel);
		     userDAO.modifyUser(userVO);
		     request.setAttribute("msg", "userModified");
		     nextPage="/user/userInfo.do";
		}
		else if(action.equals("/dropOut.do")){
		     String id=request.getParameter("id");
		     userDAO.dropUser(id);
		     request.setAttribute("msg", "userDropout");
		     nextPage="/user/userInfo.do";
		}
		else {
			nextPage = "/user/Main.do";
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}
