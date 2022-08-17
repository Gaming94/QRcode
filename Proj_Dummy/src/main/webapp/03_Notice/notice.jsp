<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.NoticeVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="noti" class="notice.NoticeVO" scope="page" />
<jsp:setProperty name="noti" property="title" />
<jsp:setProperty name="noti" property="content" />
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	.logo{
		position: fixed;
		top : 20px;
		left : 50px;
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
	.menu_top{
		position: fixed;
		z-index : 99;
		top : 0px;
		left : 200px;
		width: 90%;
		height: 100px;
		color : white;
		overflow:hidden;
		
		padding-top : 20px;
		
		background-color : white;
		
		border: 1px solid;
		border-color : rgb(255, 255, 255);
	}	
	.menu_top ul{
		display : inline-block;
		list-style: none;
	}
	
	.menu_top li {
		top : 50px;
		width: 90PX;
		float: left;
		text-align: center;
		line-height: 30px;
	}
	
	.menu_top input {
		top : 30px;
		width: 350px;
		height: 40px;
		font-size: 13px;
		color : Black;
		outline: none;
		padding-left: 17px;
		
		background-image: url('../98_Image/Search.jpg');
		background-repeat: no-repeat;
		background-size : 35px;
		background-position: right;
		
		border-radius: 20px;
		border : 2px solid;
		border-color: rgb(255, 0, 0);
	}
	.menu_left{
		position: fixed;
		z-index : 99;
		top: 100px;
		width: 200px;
		height: 100%;
		overflow:hidden;
		
		padding-top: 30px;
		
		background-color : white;
	}
	.menu_left li {
		height: 60PX;
		text-align: left;
		list-style: none;
	}
	
	.board{
		position: fixed;
		top : 20%;
		left : 30%;
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
</style>
<title>공지사항</title>
</head>
<body>
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
	<%
		if(check == 1) {
	%>
	<div class="writebtn">
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='writeNotice.jsp';">글쓰기</button>
	</div>
	<%} %>
	<div>
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
	<div class ="board">
	<h3 class="top">공지사항</h3>
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
		NoticeDAO nodao = new NoticeDAO();
		ArrayList<NoticeVO> nvos = nodao.loadNotice();
	 	if(nvos.size() != 0) {
	 		for(int i=0; i < nvos.size(); i++) {
	 %>
	 	<tr>
	 		<td><%= nvos.get(i).getNo()%></td>
	 		<td><a href="noticeView.jsp?notiID=<%= nvos.get(i).getNo()%>">
	 			<%= nvos.get(i).getTitle()%></a></td>
	 		<td>관리자</td>
	 		<td><%= nvos.get(i).getRegdates()%></td>
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