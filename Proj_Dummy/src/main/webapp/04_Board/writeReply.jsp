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
<style>
	body {
		text-align: center;
	}
	table {
		border: 0.5px solid #E6E6E6;
		width: 600px;
		height: 700px;
		margin-left: auto;
		margin-right: auto;
	}
	td{ 
		border: 0.5px solid #E6E6E6;
	}
	.tit {
		height: 10%;
	}
	.cont{
		
	}
	.intit{
		width: 500px;
		height: 25px;
	}
	.incont{
		width: 500px;
		height: 600px;
	}
	.sub{
		text-align: center;
		margin-left: 540px;
	}
</style>
<title>음악요청 답변작성</title>
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
	<h2>음악요청 작성</h2>
	<form action="rWrite.jsp" method="post">
	<table>
		<tr class="tit">
			<td style="width:10%">글번호</td>
			<td><input type="text" name="no" class="intit" value="<%=no %>" readonly></td>
		</tr>
		<tr class="tit">
			<td style="width:10%">답변번호</td>
			<td><input type="text" name="pno" class="intit" value="<%=pno %>" readonly></td>
		</tr>
		<tr class="tit">
			<td style="width:10%">제목</td>
			<td><input type="text" name="title" class="intit"></td>
		</tr>
		<tr class="cont">
			<td>내용</td>
			<td><input type="text" name="content" class="incont"></td>
		</tr>
	</table>
	<div style="line-height: 45px">
		<input class="sub" type="submit" value="글쓰기">
		<button class="sub" type="button" onclick="location.href='board.jsp';">목록으로</button>
	</div>
	</form>
</body>
</html>