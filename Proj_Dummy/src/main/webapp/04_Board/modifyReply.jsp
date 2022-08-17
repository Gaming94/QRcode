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
<title>음악요청 수정</title>
</head>
<body>
<% 
	String id = null;
	String admin = "QRCODE";
	int check = 0;
	int bID = 0, bID2 = 0;
	id = (String)session.getAttribute("user_id");
	PrintWriter script = response.getWriter();
	if(session.getAttribute("user_id") != null) {		
    	if(request.getParameter("bID") != null) {
    		bID = Integer.parseInt(request.getParameter("bID"));
    		bID2 = Integer.parseInt(request.getParameter("bID2"));
    		BoardVO bvo = new BoardDAO().getReply(bID, bID2);
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
	BoardVO bvo = new BoardDAO().getReply(bID, bID2);
%>
<div>
	<form method="post" action="updateReply.jsp?bID=<%=bID %>">
		<table>
			<tr class="tit">
				<td style="width:10%">글번호</td>
				<td><input type="text" name="no" class="intit" value="<%=bvo.getNo() %>" readonly></td>
			</tr>
			<tr class="tit">
				<td style="width:10%">답변번호</td>
				<td><input type="text" name="pno" class="intit" value="<%=bvo.getPno() %>" readonly></td>
			</tr>
			<tr class="tit">
				<td style="width:10%">제목</td>
				<td><input type="text" name="title" class="intit" value="<%=bvo.getTitle()%>"></td>
			</tr>
			<tr class="cont">
				<td>내용</td>
				<td><input type="text" name="content" class="incont" value="<%=bvo.getContent()%>"></td>
			</tr>
		</table>
		<div style="line-height: 45px">
			<input class="sub" type="submit" value="수정하기">
			<button class="sub" type="button" onclick="location.href='board.jsp';">뒤로</button>
		</div>
	</form>
</div>
</body>
</html>