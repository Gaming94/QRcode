<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="userInfo.UserDAO" %>
<%@ page import="userInfo.UserVO" %>
<jsp:useBean id="user" class="userInfo.UserVO" scope="page"/>
<jsp:setProperty name="user" property="id"/>
<jsp:setProperty name="user" property="name"/>
<jsp:setProperty name="user" property="pwd"/>
<jsp:setProperty name="user" property="email"/>
<jsp:setProperty name="user" property="tel"/>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>회원 정보 수정</title>
</head>
<body>
<% 
		String id = null, userId = null;
		String admin = "QRCODE";
		PrintWriter script = response.getWriter();
		if(session.getAttribute("user_id") != null) {
			if(request.getParameter("id") != null) {
				id = (String)request.getParameter("id");
				UserDAO dao = new UserDAO();
				UserVO uvo = new UserVO(user.getId(),user.getName(),user.getPwd(),user.getEmail(),user.getTel());
				dao.modifyUser(uvo);			
				script.println("<script>");
				script.println("alert('수정되었습니다.')");
				script.println("location.href = 'userInfo.jsp'");
				script.println("</script>");
			}
		} else {
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = '../00_Main/Main.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>
