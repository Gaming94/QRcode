<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link rel="stylesheet" href="../99_Other/01_CSS/Write.css">
</head>
<body>
	<div class="logo">
		<a href="../00_Main/Main.jsp">
			<img src="../98_Image/QRMusic_MainLogo.jpg" width="70">
		</a>
	</div>
	<div class="back">	
	<div class="board">
	<h2 class="top">공지사항 작성</h2>
	<form action="write.jsp" method="post">
	<table class="tb">
		<tr class="tit">
			<td style="width:10%">제목</td>
			<td><input type="text" name="title" class="intit"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content" class="incont"></td>
		</tr>
	</table>
	<br>
	<div class="sub">
		<input class="logbtn" type="submit" value="글쓰기">
		<button type="button" class="logbtn" onclick="location.href='notice.jsp';">목록으로</button>
	</div>
	</form>
	</div>
	</div>
</body>
</html>