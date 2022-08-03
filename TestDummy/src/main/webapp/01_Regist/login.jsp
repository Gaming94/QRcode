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
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from qrmember where id = ?";
		
		try{
			conn = OracleConnector.getConnection();			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();			
			
			OracleConnector.closeConnection();
			
			if(rs.next())
			{
				String password;
				password = rs.getString("pwd");
				
				if(password.equals(pass))
				{
					out.println("<script>");
					out.println("alert('로그인 되었습니다. 환영합니다.')");
					out.println("location.href='../user/Main.do'");
					out.println("</script>");
				} else{
					out.println("<script>");
					out.println("alert('비밀번호를 확인해주세요')");
					out.println("location.href='../user/Main.do'");
					out.println("</script>");
				}
			} else{
				out.println("<script>");
				out.println("alert('ID를 확인해주세요')");
				out.println("location.href='../user/Main.do'");
				out.println("</script>");
			}
		}
		catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>
