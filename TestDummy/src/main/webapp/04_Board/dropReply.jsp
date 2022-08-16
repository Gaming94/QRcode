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
<title>공지사항 삭제</title>
</head>
<body>
<% 
	String id = null;
		String admin = "QRCODE";
		PrintWriter script = response.getWriter();
		if(session.getAttribute("user_id") != null) {
		    id = (String)session.getAttribute("user_id");
		}
		int bID = 0, bID2 = 0;
		if(request.getParameter("bID") != null) {
			bID = Integer.parseInt(request.getParameter("bID"));
			bID2 = Integer.parseInt(request.getParameter("bID2"));
			BoardVO bvo = new BoardDAO().getBoard(bID);
			BoardDAO bdao = new BoardDAO();
			if((id.equals(admin)) || (id.equals(bvo.getId()))){				
				bdao.dropReply(bID, bID2);			
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