<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.BoardVO" scope="page"/>
<jsp:setProperty name="board" property="no"/>
<jsp:setProperty name="board" property="pno"/>
<jsp:setProperty name="board" property="title"/>
<jsp:setProperty name="board" property="content"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음악요청 답변쓰기</title>
</head>
<body>
<%
	String id = null;
	PrintWriter script = response.getWriter();
	if(session.getAttribute("user_id") != null) {
	    id = (String)session.getAttribute("user_id");
    	BoardDAO bodao = new BoardDAO();
    	BoardVO bovo = new BoardVO(board.getNo(),board.getTitle(),id,board.getContent(), board.getPno());
    	bodao.addReply(bovo);
    	script.println("<script>");
    	script.println("location.href = 'board.jsp'");
    	script.println("</script>");
	} else {
    	script.println("<script>");
    	script.println("alert('회원 권한이 필요합니다.')");
    	script.println("location.href = '../00_Main/Main.jsp'");
    	script.println("</script>");
	}
%>
</body>
</html>