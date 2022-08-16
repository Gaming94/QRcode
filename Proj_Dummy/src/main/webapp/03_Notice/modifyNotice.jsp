<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.NoticeVO" %>
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
<title>공지사항 수정</title>
</head>
<body>
<% 
	String id = null;
	String admin = "QRCODE";
	int check = 0;
	int notiID = 0;
	id = (String)session.getAttribute("user_id");
	PrintWriter script = response.getWriter();
	if(session.getAttribute("user_id") != null) {	    
    	if(request.getParameter("notiID") != null) {
    		notiID = Integer.parseInt(request.getParameter("notiID"));
    	}else {
    		script.println("<script>");
	    	script.println("alert('유효하지 않은 글입니다.')");
	    	script.println("location.href = 'notice.jsp'");
	    	script.println("</script>");
    	}
	    if(!id.equals(admin)) {	
	    	script.println("<script>");
	    	script.println("alert('관리자 권한이 필요합니다.')");
	    	script.println("location.href = 'notice.jsp'");
	    	script.println("</script>");
	    }
	}	
	NoticeVO nvo = new NoticeDAO().getNotice(notiID);
%>
<div>
	<form method="post" action="updateNotice.jsp?notiID=<%=notiID %>">
		<table>
			<tr class="tit">
				<td style="width:10%">제목</td>
				<td><input type="text" name="title" class="intit" value="<%=nvo.getTitle()%>"></td>
			</tr>
			<tr class="cont">
				<td>내용</td>
				<td><input type="text" name="content" class="incont" value="<%=nvo.getContent()%>"></td>
			</tr>
		</table>
		<div style="line-height: 45px">
			<input class="sub" type="submit" value="수정하기">
		</div>
	</form>
</div>
</body>
</html>