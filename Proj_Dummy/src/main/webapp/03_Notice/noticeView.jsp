<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.NoticeVO" %>
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
		width: 20%;
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

<title>공지사항 보기</title>
</head>
<body>
	<%
		int notiID = 0;
		String id = null;
		String admin = "QRCODE";
		if(session.getAttribute("user_id") != null) {
			id = (String)session.getAttribute("user_id");
		}
		else {
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
	
	<div class="sub" style="line-height: 45px">
		<%
		if(id.equals(admin)) {
		%>
		<a class="btn btn-outline-danger btn-sm" role="button"  onclick="return confirm('정말 삭제하시겠습니까?')" href="dropNotice.jsp?notiID=<%=notiID%>">삭제</a>
		<a class="btn btn-outline-primary btn-sm" role="button"  href="modifyNotice.jsp?notiID=<%=notiID%>">수정</a>
		<%} %>
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='notice.jsp';">목록</button>
	</div>
</body>
</html>