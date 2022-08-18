<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="userInfo.UserDAO" %>
<%@ page import="userInfo.UserVO" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>회원 정보 수정창</title>
<style>
  * {
  margin: auto;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;
  }
  
  .mainLogo {
  display : block;
  margin : auto;
  width: 5%;
  top : 150px;
  left : 50px;
  }

  body {
  background-image:#34495e;
  }
  
  div {
  width: 300px;
  }

</style>
</head>
<body>
<%
	String id = null;
	PrintWriter script = response.getWriter();
	if(request.getParameter("id") != null) {
		id = (String)request.getParameter("id");		
	}
	else {
		script.println("<script>");
    	script.println("alert('잘못된 접근입니다.')");
    	script.println("location.href = '../00_Main/Main.jsp'");
    	script.println("</script>");
	}
	UserVO uvo = new UserDAO().loadUserinfo(id);
%>
<img class="mainLogo" src="../98_Image/QRMusic_MainLogo.jpg" >
 <br>
 <h1 class="h3 mb-3 fw-normal" align="center">정보 수정</h1>
 <br>
<form method="post" class="form-signin" action="../01_Regist/userModify.jsp?id=<%=id%>">
  <div class="mb-3">
     <label th:for="username">아이디</label>
     <input type="text" name="id" class="form-control" value="<%=uvo.getId() %>" disabled >
  </div>
  <div class="mb-3">
     <label th:for="password">비밀번호</label>
     <input type="password" name="pwd" class="form-control" value="<%=uvo.getPwd() %>" >
  </div>
   <div class="mb-3">
     <label th:for="nickname">이름</label>
     <input type="text" name="name" class="form-control" value="<%=uvo.getName() %>" >
   </div>
   <div class="mb-3">
     <label th:for="email">이메일</label>
     <input type="text" name="email" class="form-control" value="<%=uvo.getEmail() %>" >
   </div>
   <div class="mb-3">
     <label th:for="tel">전화번호</label>
     <input type="text" name="tel" class="form-control" value="<%=uvo.getTel() %>" >
   </div>
   <div class="mb-3">
     <label th:for="tel">가입일</label>
     <input type="text" name="regdate" class="form-control" value="<%=uvo.getRegdate() %>" disabled  >
   </div>
   <div>
       <input type="submit" class="btn btn-primary btn-sm" value="수정하기" >
       <input type="reset" class="btn btn-outline-secondary btn-sm" value="다시입력" >
       <input type="button" class="btn btn-outline-secondary btn-sm" value="뒤로가기" onclick="history.back();"/>
   </div>
</form>
</html>
