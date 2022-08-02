<%@page import="userInfo.OracleConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page import="java.sql.Connection"%> 		  <!-- 추가 -->
<%@page import="java.sql.PreparedStatement"%> <!-- 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 확인</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	// String id = "1111";
	// String pass = "1111";
	String id = request.getParameter("id");
	String pass = request.getParameter("pwd");
	
	System.out.println(id + ' ' + pass);
	
	Connection conn = OracleConnector.getConnection();
	
	String sql = "select * from qrmember where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	String password;
	rs.next();
	password = rs.getString("pwd");
	
	OracleConnector.closeConnection();
	// OracleConnector.closeConnection(rs);
	// OracleConnector.closeConnection(pstmt);
	// OracleConnector.closeConnection(conn);
	
	if(password.equals(pass)){
		out.println("<script>");
		out.println("alert('로그인 되었습니다. 환영합니다.')");
		out.println("location.href='Main.html'");
		out.println("</script>");
		
	}else{
		out.println("<script>");
		out.println("alert('정보가 틀렸습니다!')");
		out.println("location.href='Main.html'");
		out.println("</script>");
	}
%>
</body>
</html>