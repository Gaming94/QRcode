<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" 
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  
<%
request.setCharacterEncoding("UTF-8");
%>    
<html>
<head>
<c:choose>
   <c:when test='${msg=="userJoined"}'>
      <script>
         window.onload=function(){
            alert("회원을 등록했습니다.");
         }
      </script>
   </c:when>
   <c:when test='${msg=="userModified"}'>
      <script>
        window.onload=function(){
          alert("회원 정보를 수정했습니다.");
        }
      </script>
   </c:when>
   <c:when test= '${msg=="userDropout"}'>
      <script>
         window.onload=function(){
            alert("회원 정보를 삭제했습니다.");
        } 
      </script>
</c:when>
</c:choose>
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
<c:choose>
    <c:when test="${empty userList}" >
      <tr>
        <td colspan=8>
          <b>등록된 회원이 없습니다.</b>
       </td>  
      </tr>
   </c:when>  
   <c:when test="${!empty userList}" >
      <c:forEach  var="user" items="${userList}" >
        <tr align="center">
          <td>${user.id}</td>
          <td>${user.pwd}</td>
          <td>${user.name}</td>
          <td>${user.email}</td>    
          <td>${user.tel}</td>    
          <td>${user.regdate}</td>
          <td><a href="${contextPath}/user/userEdit.do?id=${user.id}">수정</a></td>
		  <td><a href="${contextPath}/user/dropOut.do?id=${user.id}">삭제</a></td>               
       </tr>
     </c:forEach>
</c:when>
</c:choose>
   </table>  
 <!--<a href="${contextPath}/user/signUp.do"><p class="cls2">회원 추가하기</p></a> -->
 <br>
 <div align="center">
 	<input class="cls2" type="button" value="뒤로가기" onclick="history.back();"/>
 </div>
</body>
</html>