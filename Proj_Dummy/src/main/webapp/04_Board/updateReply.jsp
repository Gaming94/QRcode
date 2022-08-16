<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<jsp:useBean id="bID" class="board.BoardVO" scope="page"/>
<jsp:setProperty name="bID" property="no"/>
<jsp:setProperty name="bID" property="pno"/>
<jsp:setProperty name="bID" property="title"/>
<jsp:setProperty name="bID" property="content"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음악요청 수정적용</title>
</head>
<body>
<% 
	String id = null; 
	String admin = "QRCODE";
	PrintWriter script = response.getWriter();
	if(session.getAttribute("user_id") != null) {
	    id = (String)session.getAttribute("user_id");
    		BoardDAO bdao = new BoardDAO();
   			BoardVO bvo = new BoardVO(bID.getTitle(),bID.getContent(),bID.getNo(),bID.getPno()); 
   			bdao.modifyReply(bvo);			
			script.println("<script>");
			script.println("alert('수정되었습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");	
   	} else {
   		script.println("<script>");
    	script.println("alert('로그인 상태가 아닙니다.')");
    	script.println("location.href = 'board.jsp'");
    	script.println("</script>");
   	}
%>
</body>
</html>