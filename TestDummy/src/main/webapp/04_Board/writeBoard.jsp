<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
		line-height: 45px;
	}
</style>
<title>음악요청 작성</title>
</head>
<body>
	<h2>공지사항 작성</h2>
	<form action="bWrite.jsp" method="post">
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
	<div class="sub">
		<input class="btn btn-outline-secondary btn-sm" type="submit" value="글쓰기">
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='board.jsp';">목록으로</button>
	</div>
	</form>
</body>
</html>