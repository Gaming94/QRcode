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
<link rel="stylesheet" href="../99_Other/01_CSS/Write.css">
<title>공지사항 수정</title>
</head>
<body>
	<div class="logo">
		<a href="../00_Main/Main.jsp">
			<img src="../98_Image/QRMusic_MainLogo.jpg" width="70">
		</a>
	</div>
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
<div class="back">	
	<div class="board">
	<h2 class="top">공지사항 수정</h2>
	<form method="post" action="updateNotice.jsp?notiID=<%=notiID %>">
		<table class="tb">
			<tr class="tit">
				<td style="width:10%">제목</td>
				<td><input type="text" name="title" class="intit" value="<%=nvo.getTitle()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="content" class="incont" value="<%=nvo.getContent()%>"></td>
			</tr>
		</table>
		<div class="sub">
			<input type="submit" value="수정하기">
			<button type="button" class="logbtn" onclick="location.href='notice.jsp';">목록으로</button>
		</div>
	</form>
	</div>
</div>
</body>
</html>