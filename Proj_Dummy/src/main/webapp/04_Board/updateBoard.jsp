<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<jsp:useBean id="board" class="board.BoardVO" scope="page"/>
<jsp:setProperty name="board" property="title"/>
<jsp:setProperty name="board" property="content"/>
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
		int bID = 0;	
    	if(request.getParameter("bID") != null) {
    		bID = Integer.parseInt(request.getParameter("bID"));
    		BoardVO bvo = new BoardDAO().getBoard(bID);
    		BoardDAO bdao = new BoardDAO();
    		if((id.equals(admin)) || (id.equals(bvo.getId()))) {	
    			BoardVO bvo2 = new BoardVO(board.getTitle(),board.getContent(),bID); 
    			bdao.modifyBoard(bvo2);			
 				script.println("<script>");
 				script.println("alert('수정되었습니다.')");
 				script.println("location.href = 'board.jsp'");
 				script.println("</script>");	
    		}
    		else {    			
 				script.println("<script>");
   		    	script.println("alert('관리자거나 본인이 아닙니다.')");
   		    	script.println("location.href = 'board.jsp'");
   		    	script.println("</script>");
    		}
    	} 	 
   	} else {
   		script.println("<script>");
    	script.println("alert('로그인 상태가 아닙니다.')");
    	script.println("location.href = 'board.jsp'");
    	script.println("</script>");
   	}
%>
</body>
</html>