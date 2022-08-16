<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.NoticeVO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="notice" class="notice.NoticeVO" scope="page"/>
<jsp:setProperty name="notice" property="title"/>
<jsp:setProperty name="notice" property="content"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
</head>
<body>
<%
	String id = null;
	String admin = "QRCODE";
	int check = 0;
	if(session.getAttribute("user_id") != null) {
	    id = (String)session.getAttribute("user_id");
	    if(id.equals(admin)) {
	    	NoticeDAO nodao = new NoticeDAO();
	    	NoticeVO novo = new NoticeVO(notice.getTitle(),notice.getContent());
	    	nodao.addNotice(novo);
	    	PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("location.href = 'notice.jsp'");
	    	script.println("</script>");
	    } else {
	    	PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("alert('관리자 권한이 필요합니다.')");
	    	script.println("location.href = 'notice.jsp'");
	    	script.println("</script>");
	    }
	}
%>
</body>
</html>