<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
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
		line-height: 45px
	}
</style>

<title>음악요청 보기</title>
</head>
<body>
	<%
		String id = null;
		String admin = "QRCODE";
		int check = 0;
		PrintWriter script = response.getWriter();
		if(session.getAttribute("user_id") != null) {
		    id = (String)session.getAttribute("user_id");
		}
		else if(session.getAttribute("user_id") == null) {
			id = null;	
	    	script.println("<script>");
	    	script.println("alert('회원 권한이 필요합니다.')");
	    	script.println("location.href = '../00_Main/Main.jsp'");
	    	script.println("</script>");
		}
		int bID = 0, bID2 = 0;		
		if(request.getParameter("bID") != null) {
			bID = Integer.parseInt(request.getParameter("bID"));
			bID2 = Integer.parseInt(request.getParameter("bID2"));
		} else{
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		BoardVO board = new BoardDAO().getReply(bID, bID2);		
	%>
	<h2><%= board.getTitle() %></h2>
	<table>
		<tr>
			<td class="tit">글 번호</td>
			<td><%= board.getNo() %></td>
		</tr>
		<tr>
			<td class="tit">답변 번호</td>
			<td><%= board.getPno() %></td>
		</tr>
		<tr>
			<td class="tit">제목</td>
			<td><%= board.getTitle() %></td>
		</tr>	
		<tr>
			<td class="tit">작성자</td>
			<td><%= board.getId() %></td>
		</tr>	
		<tr>
			<td class="tit">작성일자</td>
			<td><%= board.getRegdate() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%= board.getContent() %></td>
		</tr> 
	</table>
	<div class="sub" style="">
	<% if((id.equals(admin)) || (id.equals(board.getId()))) {%>
		<a href="writeReply.jsp?bID=<%=bID%>&bID2=<%=bID2%>">답글</a>
		<a onclick="return confirm('정말 삭제하시겠습니까?')" href="dropReply.jsp?bID=<%=bID%>&bID2=<%=bID2%>">삭제</a>
		<a href="modifyReply.jsp?bID=<%=bID%>&bID2=<%=bID2%>">수정</a>
		<%} %>
		<button type="button" onclick="location.href='board.jsp';">목록</button>
	</div>
</body>
</html>