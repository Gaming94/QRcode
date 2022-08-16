<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.NoticeVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 삭제</title>
</head>
<body>
<% 
	String id = null;
		String admin = "QRCODE";
		PrintWriter script = response.getWriter();
		if(session.getAttribute("user_id") != null) {
		    id = (String)session.getAttribute("user_id");
		}
		int notiID = 0;
		if(id.equals("QRCODE")){
			if(request.getParameter("notiID") != null) {
				notiID = Integer.parseInt(request.getParameter("notiID"));
				NoticeVO novo = new NoticeDAO().getNotice(notiID);
				NoticeDAO nodao = new NoticeDAO();
				nodao.dropNotice(notiID);			
				script.println("<script>");
				script.println("alert('삭제되었습니다.')");
				script.println("location.href = 'notice.jsp'");
				script.println("</script>");
			}
		} else {
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>