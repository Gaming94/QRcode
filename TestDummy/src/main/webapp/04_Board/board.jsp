<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body {	
		line-height: 40px;
	}
	table {
		border: 0.5px solid #E6E6E6;		
		margin-left: auto;
    	margin-right: auto;
    	width: 700;
		line-height: 30px;
	}
	.writebtn {
		text-align: center;
		margin-left: 635px;
	}
	thead {
		background-color: #eeeeee;
		text-align: center;
	}
	tbody {
		background-color: white;
		text-align: center;
	}
	.top {
		text-align: center;
	}
	.mainLogo{
		width: 70px;
		text-align: center;
	}
	.sub{
		text-align: center;
		line-height: 45px;
	}
	a{
		color : Black;
		font-size : 15px;
		text-decoration:none;
	}
	
	a:link {
		color : Black;
		text-decoration:none;
	}
	
	a:visited {
		color : Black;
		text-decoration:none;
	}
	
	a:hover{
		color : Gray;
		text-decoration:none;
		cursor : pointer;
	}
	.title{
		float : left;
		margin-left : 20%;
	}
</style>
<title>음악요청</title>
</head>
<body>
<%
	String id = null;
	String admin = "QRCODE";
	int check = 0;
	if(session.getAttribute("user_id") != null) {
	    id = (String)session.getAttribute("user_id");
	    if(id.equals(admin))
	    	check = 2;
	    else
	    	check = 1;
	}
	else if(session.getAttribute("user_id") == null) {
		id = null;	
		PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("alert('회원 권한이 필요합니다.')");
    	script.println("location.href = '../00_Main/Main.jsp'");
    	script.println("</script>");
	}
%>
	<img class="mainLogo" src="../98_Image/QRMusic_MainLogo.jpg">
	<h3 class="top">음악요청</h3>
	<%
		if(check == 1 || check == 2) {
	%>
	<div class="writebtn">
		<a href="writeBoard.jsp">글쓰기</a>
	</div>
	<%} %>
<div>
	<table>
	 <thead>
		<tr>
			<th style="width:5%">번호</th>
			<th style="width:70%">제목</th>
			<th style="width:12%">작성자</th>
			<th >작성일</th>
		</tr>
	 </thead>
	 <tbody>
	 <%
	 BoardDAO bodao = new BoardDAO();
		ArrayList<BoardVO> bvos = bodao.loadBoard();
	 	if(bvos.size() != 0) {
	 		for(int i=0; i < bvos.size(); i++) {
	 %>
	 	<tr>
	 		<%if (bvos.get(i).getPno() == 0) { %>
	 		<td><%= bvos.get(i).getNo()%></td>	 		
	 		<td><a href="boardView.jsp?bID=<%= bvos.get(i).getNo()%>" class="title">
	 			<%= bvos.get(i).getTitle()%></a></td>
	 		<%} else if((bvos.get(i).getPno() != 0)){ %>
	 		<td>└<%= bvos.get(i).getPno() %></td>	 
	 		<td><a href="replyView.jsp?bID=<%= bvos.get(i).getNo()%>&bID2=<%= bvos.get(i).getPno()%>" class="title">└
	 			<%= bvos.get(i).getTitle()%></a></td>
	 		<% } %>
	 		<td><%= bvos.get(i).getId()%></td>
	 		<td><%= bvos.get(i).getRegdate()%></td>
	 	</tr>
	 <%
	 		}} else {
	 %>
	 	<tr>
	 		<td colspan="4" align=center>등록된 글이 없습니다.</td>
	 	</tr>
	 	<% } %>
	 </tbody>
	</table>	
</div>
<div class="sub">
		<a href="../00_Main/Main.jsp">뒤로가기</a>
</div>
</body>
</html>