<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음악요청</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../99_Other/01_CSS/Menu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">로그인 창</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <form action="../01_Regist/login.jsp" method="post">
	      <div class="modal-body">	       
	        <table>
	    		<tr>
	       			<td><p>아이디</td>
	       			<td><input type="text" name="id"></td>
	    		</tr>
	    		<tr>
	       			<td><p>비밀번호</td>
	       			<td><input type="password" name="pwd"></td>
	       		</tr>
	       	</table>	       	
	      </div>
	      <div class="modal-footer">
	        <button class="logbtn" type="submit">로그인</button>
	        <a href="../01_Regist/signUp.jsp">
	        	<button class="logbtn" type="button">회원가입</button>
        	</a>	        
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
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
		else if(session.getAttribute("user_id") == null)
			id = null;	
		%>	
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
	
	<div class="menu_right">
			<ul>
			<% if ( id == null) {%>
		    	<li>	    		
		    		 <a data-toggle="modal" data-target="#exampleModal" style="cursor:hand;">로그인/회원가입</a>
		    	</li>
		    <%} else if (id != null) {
		      if (check == 1) {
		    %>
		    	<li>
				    <%=id %>님 환영합니다
				</li>
				<li>
				    <a href="../01_Regist/userInfo.jsp">내 정보 관리</a>
				</li>
				<li>
				    <a href="../01_Regist/logout.jsp">로그아웃</a>
				</li>
			<%} else if(check == 2) {%>
				<li>
				    관리자님 환영합니다
				</li>
				<li>
				    <a href="../01_Regist/userInfo.jsp">회원정보</a>
				</li>
				<li>
				    <a href="../01_Regist/logout.jsp">로그아웃</a>
				</li>
				<%}} %>
			</ul>
	</div>
<div class="back">	
	<div class="board">
	<h3 class="top">음악요청</h3>
	<%
		if(session.getAttribute("user_id") == null) {
			id = null;	
			PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("alert('회원 권한이 필요합니다.')");
	    	script.println("location.href = '../00_Main/Main.jsp'");
	    	script.println("</script>");
		}
		if(check == 1 || check == 2) {
	%>
	<div class="writebtn">
		<button type="button" class="logbtn" onclick="location.href='writeBoard.jsp';">글쓰기</button>
	</div>
	<%} %>	
	<br>
	<table class="tb">
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
	 <%} %>
	 </tbody>
	</table>
	<div class="sub">
		<br>
		<button type="button" class="logbtn" onclick="location.href='../00_Main/Main.jsp';">뒤로가기</button>
	</div>	
</div>
</div>
</body>
</html>