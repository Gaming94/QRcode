<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음악요청 삭제</title>
</head>
<body>
<% 
	String id = null;
		String admin = "QRCODE";
		PrintWriter script = response.getWriter();
		if(session.getAttribute("user_id") != null) {
		    id = (String)session.getAttribute("user_id");
		}
		int bID = 0;
		if(id.equals("QRCODE")){
			if(request.getParameter("bID") != null) {
				bID = Integer.parseInt(request.getParameter("bID"));
				BoardVO bvo = new BoardDAO().getBoard(bID);
				BoardDAO bdao = new BoardDAO();
				bdao.dropBoard(bID);			
				script.println("<script>");
				script.println("alert('삭제되었습니다.')");
				script.println("location.href = 'board.jsp'");
				script.println("</script>");
			}
		} else {
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>