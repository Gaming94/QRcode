<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" 
%>
<%@ page import="userInfo.UserDAO" %>
<%@ page import="userInfo.UserVO" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <meta  charset="UTF-8">
   <title>회원 정보 출력창</title>
<style>
     .cls1 {
       font-size:40px;
       text-align:center;
     }
    
     .cls2 {
       font-size:20px;
       text-align:center;
     }
     
	.mainLogo {
	  display : block;
	  margin : auto;
	  width: 10%;
	  top : 150px;
	  left : 50px;
	}
     
    table {
	  font-family: arial, sans-serif;
	  border-collapse: collapse;
	  width: 85%;
	}

	td, th {
	  border: 1px solid #dddddd;
	  text-align: center;
	  padding: 8px;
	}

	tr:nth-child(even) {
	  background-color: #dddddd;
	}
</style>
</head>
<body>
<img class="mainLogo" src="../98_Image/QRMusic_MainLogo.jpg" >
 <p class="cls1">회원정보</p>
   <table align="center" border="1" >
      <tr align="center" bgcolor="lightgreen">
         <td width="7%" ><b>아이디</b></td>
         <td width="7%" ><b>비밀번호</b></td>
         <td width="7%" ><b>이름</b></td>
         <td width="7%"><b>이메일</b></td>         
         <td width="7%"><b>전화번호</b></td>
         <td width="7%" ><b>가입일</b></td>
         <td width="7%" ><b>수정</b></td>
		 <td width="7%" ><b>삭제</b></td>         
   </tr>
   <%
   	String id = (String)session.getAttribute("user_id");
   	String admin = "QRCODE";
   	UserDAO dao = new UserDAO();
   	ArrayList<UserVO> uvos = dao.loadUser();
   	UserVO uvo = dao.loadUserinfo(id);
   	if (id.equals(admin)) {
   		for(int i=0; i < uvos.size(); i++) {
   	%>
        <tr align="center">
          <td><%= uvos.get(i).getId() %></td>
          <td><%= uvos.get(i).getPwd() %></td>
          <td><%= uvos.get(i).getName() %></td>     
          <td><%= uvos.get(i).getEmail() %></td>    
          <td><%= uvos.get(i).getTel() %></td>    
          <td><%= uvos.get(i).getRegdate() %></td>
          <td><button type="button" class="btn btn-primary btn-sm"  onclick="location.href='userEdit.hsp?id=<%= uvos.get(i).getId() %>';">수정</button></td>
		  <td><a class="btn btn-danger btn-sm" role="button"  onclick="return confirm('정말 삭제하시겠습니까?')" href="dropUser.jsp?id=<%= uvos.get(i).getId() %>">삭제</a></td>               
       </tr>
     <%}} else { %>
     <tr align="center">
     	  <td><%=uvo.getId() %></td>
          <td><%=uvo.getPwd() %></td>
          <td><%=uvo.getName() %></td>     
          <td><%=uvo.getEmail() %></td>    
          <td><%=uvo.getTel() %></td>    
          <td><%=uvo.getRegdate() %></td>
          <td><button type="button" class="btn btn-primary btn-sm"  onclick="location.href='userEdit.jsp?id=<%=id%>';">수정</button></td>
		  <td><a class="btn btn-danger btn-sm" role="button" onclick="return confirm('정말 삭제하시겠습니까?')" href="dropUser.jsp?id=<%=id%>">삭제</a></td>               
       </tr>
     <%} %>
   </table>
<br>  
 <div class="cls2">
 	<input class="btn btn-outline-secondary" type="button" value="뒤로가기" onclick="history.back();"/>
 </div>
</body>
</html>