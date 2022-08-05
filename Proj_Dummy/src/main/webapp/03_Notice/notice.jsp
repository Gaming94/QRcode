<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	int size = 1;
%>	
<h2 style="text-align: center">공지사항</h2>
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
	 	if(size == 0) {
	 %>
	 	<tr>
	 		<td>등록된 글이 없습니다.</td>
	 	</tr>
	 <%
	 	} else {
	 %>
	 	<tr>
	 		<td>1</td>
	 		<td><a href="">첫번째</a></td>
	 		<td>관리자</td>
	 		<td>2022-08-04</td>
	 	</tr>
	 	<%
			}
	 	%>
	 </tbody>
	</table>
</div>
</body>
</html>