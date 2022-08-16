<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>회원 가입</title>
</head>
<body>
<%	
   	UserDAO dao = new UserDAO();
   	UserVO uvo = new UserVO(user.getId(),user.getName(),user.getPwd(),user.getEmail(),user.getTel());
   	dao.userJoin(uvo);
   	PrintWriter script = response.getWriter();
   	script.println("<script>");
   	script.println("alert('회원가입 되었습니다.')");
   	script.println("location.href = '../00_Main/Main.jsp'");   	
   	script.println("</script>");
%>
</body>
</html>