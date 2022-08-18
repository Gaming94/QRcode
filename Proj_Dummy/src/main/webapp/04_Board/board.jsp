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
<link rel="stylesheet" href="../99_Other/01_CSS/Menu.css">
<meta charset="UTF-8">
<style>

</style>
<title>음악요청</title>
</head>
<body>
	<div class="logo">
		<a href="../00_Main/Main.jsp">
			<img src="../98_Image/QRMusic_MainLogo.jpg" width="70">
		</a>
	</div>
		<div class="menu_top">
      <div>
	      <form>
		      	<input type="text">
	      </form>
      </div>
  		<ul>
   			<li>
   				<a href="../03_Notice/notice.jsp">공지사항</a>
   			</li>
   			<li>
   				<a href="../04_Board/board.jsp">음악요청</a>
   			</li>
   		</ul>
   		<hr>
	</div>
	<div class="menu_left">
		<ul>
			<li>
			    <img src="../98_Image/MenuIcon_1.jpg">
				<a href="Main.jsp">인기차트</a>
			</li>
			<li>
				<img src="../98_Image/MenuIcon_2.JPG">
				<a href="Main.jsp">최신음악</a>
			</li>	
			<li>
				<img src="../98_Image/MenuIcon_3.JPG">
				<a href="Main.jsp">장르</a>
			</li>
			<li>
				<img src="../98_Image/MenuIcon_3.JPG">
				<a href="Main.jsp">내 음악</a>
			</li>
			<li>
				<img src="../98_Image/MenuIcon_1.jpg">
				<a href="Main.jsp">테마</a>
			</li>
		</ul>
	</div>
<div class="back">	
	<div class="board">
	<h3 class="top">음악요청</h3>
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
	
	<%
		if(check == 1 || check == 2) {
	%>
	<div class="writebtn">
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='writeBoard.jsp';">글쓰기</button>
	</div>
	<%} %>
	
	<br>
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
	<div class="sub">
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='../00_Main/Main.jsp';">뒤로가기</button>
	</div>	
</div>
</div>
</body>
</html>