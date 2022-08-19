<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.NoticeVO" %>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../99_Other/01_CSS/View.css">
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
		    	check = 1;
		    else
		    	check = 0;
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
		      if (check == 0) {
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
			<%} else if(check == 1) {%>
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
	<%
		int notiID = 0;
		if(session.getAttribute("user_id") == null) {
			id = "nonmember";
		}
		if(request.getParameter("notiID") != null) {
			notiID = Integer.parseInt(request.getParameter("notiID"));
		}
		if(notiID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
		}
		NoticeVO notice = new NoticeDAO().getNotice(notiID);	
	%>
	
	<div class="back">
	<div class="board">
	<h2><%= notice.getTitle() %></h2>
	<table class="tb">
		<tr>
			<td class="tit">글 번호</td>
			<td><%= notice.getNo() %></td>
		</tr>
		<tr>
			<td class="tit">제목</td>
			<td><%= notice.getTitle() %></td>
		</tr>		
		<tr>
			<td class="tit">작성일자</td>
			<td><%= notice.getRegdates() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%= notice.getContent() %></td>
		</tr>
	</table>	
	<div class="sub">
	<br>
		<%
		if(id.equals(admin)) {
		%>
		<a class="logbtn-danger" role="button"  onclick="return confirm('정말 삭제하시겠습니까?')" href="dropNotice.jsp?notiID=<%=notiID%>">삭제&nbsp;</a>
		<a class="logbtn-primary" role="button"  href="modifyNotice.jsp?notiID=<%=notiID%>">수정&nbsp;</a>
		<%} %>
		<button type="button" class="logbtn" onclick="location.href='notice.jsp';">목록&nbsp;</button>
	</div>
	</div>
	</div>
</body>
</html>