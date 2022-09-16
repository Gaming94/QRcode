<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../99_Other/01_CSS/Write.css">
<title>음악요청 수정</title>
</head>
<body>
<div class="logo">
		<a href="../00_Main/Main.jsp">
			<img src="../98_Image/QRMusic_MainLogo.jpg" width="70">
		</a>
	</div>
<% 
	String id = null;
	String admin = "QRCODE";
	int check = 0;
	int bID = 0;
	id = (String)session.getAttribute("user_id");
	PrintWriter script = response.getWriter();
	if(session.getAttribute("user_id") != null) {		
    	if(request.getParameter("bID") != null) {
    		bID = Integer.parseInt(request.getParameter("bID"));
    		BoardVO bvo = new BoardDAO().getBoard(bID);
    		 if((!id.equals(admin)) && (!id.equals(bvo.getId()))) {	
    		    	script.println("<script>");
    		    	script.println("alert('관리자거나 본인이 아닙니다.')");
    		    	script.println("location.href = 'board.jsp'");
    		    	script.println("</script>");
    		    }
    	}else {
    		script.println("<script>");
	    	script.println("alert('유효하지 않은 글입니다.')");
	    	script.println("location.href = 'board.jsp'");
	    	script.println("</script>");
    	}
	   
	}	
	BoardVO bvo = new BoardDAO().getBoard(bID);
%>
<div class="back">	
	<div class="board">
	<h2 class="top">음악요청 수정</h2>
	<form method="post" action="updateBoard.jsp?bID=<%=bID %>">
		<table class="tb">
			<tr class="tit">
				<td style="width:10%">제목</td>
				<td><input type="text" name="title" class="intit" value="<%=bvo.getTitle()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="content" class="incont" value="<%=bvo.getContent()%>"></td>
			</tr>
		</table>
		<div class="sub">
			<input type="submit" value="수정하기">
			<button class="logbtn" type="button" onclick="location.href='board.jsp';">뒤로</button>
		</div>
	</form>
	</div>
</div>
</body>
</html>