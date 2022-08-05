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
<table>
		<tr>
			<td>글 번호</td>
			<td><%= notice.getNo() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%= notice.getTitle() %></td>
		</tr>		
		<tr>
			<td>작성일자</td>
			<td><%= notice.getRegdates() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%= notice.getContent() %></td>
		</tr>
</table>
</body>
</html>