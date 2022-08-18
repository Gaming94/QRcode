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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<style>
	.back {
	  padding:1.5em;
	  background: #f5f5f5;
	}
	
	table {
	  border: 1px #a39485 solid;
	  font-size: .9em;
	  box-shadow: 0 2px 5px rgba(0,0,0,.25);
	  width: 700;
	  margin-left: auto;
	  margin-right: auto;
	  line-height: 30px;
	  border-collapse: collapse;
	  border-radius: 5px;
	  overflow: hidden;
	}
	
	th {
	  text-align: center;
	}
	  
	thead {
	  font-weight: bold;
	  color: black;
	  background: #eeeeee;;
	}
	  
	 td, th {
	  padding: 1em .5em;
	  vertical-align: middle;
	}
	  
	 td {
	  border-bottom: 1px solid rgba(0,0,0,.1);
	  background: #fff;
	}
	.writebtn {
		text-align: center;
		margin-left: 785px;
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
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='writeBoard.jsp';">글쓰기</button>
	</div>
	<br>
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
<br>
<div class="sub">
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='../00_Main/Main.jsp';">뒤로가기</button>
</div>
</body>
</html>