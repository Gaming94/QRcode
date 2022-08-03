<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
	response.setCharacterEncoding("UTF-8");
	session.setAttribute("user_id", null);
	session.setMaxInactiveInterval(0);
	out.println("<script>");
	out.println("alert('로그아웃 되었습니다.')");
	out.println("location.href='../user/Main.do'");
	out.println("</script>");
%>
</body>
</html>