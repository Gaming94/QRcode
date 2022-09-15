<%@page import="userInfo.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>아이디 중복확인</title>
</head>
<body>
  <h2>아이디 중복확인</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		UserDAO udao = new UserDAO();
		
		int result = udao.joinIdCheck(id);
		if (result == 1){
			out.print("&nbsp;사용가능한 아이디입니다.");
	%>
		<input type="button" value="아이디 사용하기" onclick="result();">
		<span style="line-height:250%"><br></span>
	<%
		} else if (result == 0){
			out.print("&nbsp;중복된 아이디입니다.");
	%>
		<span style="line-height:250%"><br></span>
	<%
		} else {
			out.print("에러 발생"); 
		}
	%>
	<fieldset>
		<form action="joinIdCheck.jsp" method="post" name="wfr">
			ID : <input type="text" name="id" value="<%=id%>">&nbsp;
			<input type="submit" value="중복확인" >
		</form>
	</fieldset>
  <script type="text/javascript">
	    function result(){
	    	opener.document.fr.id.value = document.wfr.id.value;
	    	opener.document.fr.id.readOnly=true;
	    	window.close();
	    }
  </script>
</body>
</html>