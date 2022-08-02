<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import="userInfo.UserDAO" %>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.OracleConnection"%> 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="userInfo.OracleConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pwd");
		
		Connection conn = OracleConnector.getConnection();
		
		String sql = "select * from qrmember where id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		String password;
		rs.next();
		password = rs.getString("pwd");
		
		OracleConnector.closeConnection();
		
		String mg = "";
		if(password.equals(pass))
		{
			out.println("<script>");
			out.println("alert('로그인 되었습니다. 환영합니다.')");
			out.println("location.href='../user/Main.do'");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('정보가 틀렸습니다!')");
			out.println("location.href='../user/Main.do'");
			out.println("</script>");
		}
	%>
</body>
</html>
