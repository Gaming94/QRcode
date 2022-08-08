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
<title>공지사항 보기</title>
</head>
<body>
	<%
		int notiID = 0;
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
	<h2><%= notice.getTitle() %></h2>
	<table>
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
	<div style="line-height: 45px">
		<button type="button" class="sub" onclick="location.href='notice.jsp';">목록</button>
	</div>
</body>
</html>