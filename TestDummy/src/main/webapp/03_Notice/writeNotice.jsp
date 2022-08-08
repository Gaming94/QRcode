<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
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
<title>공지사항 작성</title>
</head>
<body>
	<h2>공지사항 작성</h2>
	<form action="write.jsp" method="post">
	<table>
		<tr class="tit">
			<td style="width:10%">제목</td>
			<td><input type="text" name="title" class="intit"></td>
		</tr>
		<tr class="cont">
			<td>내용</td>
			<td><input type="text" name="content" class="incont"></td>
		</tr>
	</table>
	<div style="line-height: 45px">
		<input class="sub" type="submit" value="글쓰기">
	</div>
	</form>
</body>
</html>