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
	<img class="mainLogo" src="../98_Image/QRMusic_MainLogo.jpg">
	<h3 class="top">공지사항</h3>
	<%
		if(check == 1) {
	%>
	<div class="writebtn">
		<a href="writeNotice.jsp"><button>글쓰기</button></a>
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
		NoticeDAO nodao = new NoticeDAO();
		ArrayList<NoticeVO> nvos = nodao.loadNotice();
	 	if(nvos != null) {
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
</div>
</body>
</html>