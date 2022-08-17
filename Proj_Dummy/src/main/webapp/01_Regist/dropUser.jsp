<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="userInfo.UserDAO" %>
<%@ page import="userInfo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
</head>
<body>
<% 
		String id = null, userID = null;
		String admin = "QRCODE";
		PrintWriter script = response.getWriter();
		userID = (String)session.getAttribute("user_id");
		if(request.getParameter("id") != null) {
		    id = (String)request.getParameter("id");
		    UserVO uvo = new UserDAO().loadUserinfo(id);
		    UserDAO dao = new UserDAO();
		    dao.dropUser(id);
		    script.println("<script>");
			script.println("alert('삭제되었습니다.')");
			if(userID.equals(admin)) 
				script.println("location.href = 'userInfo.jsp'");
			else{
				script.println("location.href = 'logout.jsp'");
			}				
			script.println("</script>");
		}
%>
</body>
</html>