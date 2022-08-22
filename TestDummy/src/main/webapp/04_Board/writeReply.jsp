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
<title>음악요청 답변작성</title>
<link rel="stylesheet" href="../99_Other/01_CSS/Write.css">
</head>
<body>
<% 
	String id = null;
	String admin = "QRCODE";
	int bID = 0;
	int bID2 = 0;
	id = (String)session.getAttribute("user_id");
	if(session.getAttribute("user_id") != null) {		
    	if(request.getParameter("bID") != null) {
    		bID = Integer.parseInt(request.getParameter("bID")); 
    		bID2 = Integer.parseInt(request.getParameter("bID2")); 
    	} else {
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
	    	script.println("alert('잘못된 접근입니다.')");
	    	script.println("location.href = 'board.jsp'");
	    	script.println("</script>");
    	}
	}	
	BoardVO bvo = new BoardDAO().getReply(bID, bID2);
	int no = bvo.getNo();
	int pno = bvo.getPno() + 1;
	
%>
	<div class="logo">
		<a href="../00_Main/Main.jsp">
			<img src="../98_Image/QRMusic_MainLogo.jpg" width="70">
		</a>
	</div>
	<div class="back">	
	<div class="board">
	<h2 class="top">음악요청 답변 작성</h2>
	<form action="rWrite.jsp" method="post">
	<table class="tb">
		<tr class="tit">
			<td style="height:10%">글번호</td>
			<td><input type="text" name="no" class="intit" value="<%=no %>" readonly></td>
		</tr>
		<tr class="tit">
			<td style="height:10%">답변번호</td>
			<td><input type="text" name="pno" class="intit" value="<%=pno %>" readonly></td>
		</tr>
		<tr class="tit">
			<td style="height:10%">제목</td>
			<td><input type="text" name="title" class="intit"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" class="incont-reply"></td>
		</tr>
	</table>
	<br>
	<div class="sub">
		<input class="logbtn" type="submit" value="글쓰기">
		<button type="button" class="logbtn" onclick="location.href='board.jsp';">목록으로</button>
	</div>
	</form>
	</div>
	</div>
</body>
</html>