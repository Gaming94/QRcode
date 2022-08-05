<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
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
<title>공지글</title>
</head>
<body>
	<table>
		<tr class="tit">
			<td style="width:10%">제목</td>
			<td></td>
		</tr>
		<tr class="cont">
			<td>내용</td>
			<td></td>
		</tr>
	</table>
	<div style="line-height: 45px">
		<a href="notice.jsp">목록</a>
	</div>
</body>
</html>