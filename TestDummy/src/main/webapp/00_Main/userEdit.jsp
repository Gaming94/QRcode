<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<head>
<meta charset="UTF-8">
<title>회원 정보 수정창</title>
<style>
  .cls1 {
     font-size:40px;
     text-align:center;
   }
   table {
   		margin-left: auto;
    	margin-right: auto;
   	}
</style>
</head>
<body>
 <h1 class="cls1">회원 정보 수정창</h1>
<form  method="post" action="${contextPath}/user/userModify.do?id=${Info.id}">
 <table>
   <tr>
     <td width="200"><p align="right" >아이디</td>
     <td width="400"><input   type="text" name="id" value="${Info.id}" disabled ></td>
     
   </tr>
 <tr>
     <td width="200"><p align="right" >비밀번호</td>
     <td width="400"><input   type="password" name="pwd" value="${Info.pwd}" >
     </td>
   </tr>
   <tr>
     <td width="200"><p align="right" >이름</td>
     <td width="400"><input   type="text" name="name" value="${Info.name}" ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >이메일</td>
     <td width="400"><input   type="text" name="email"  value="${Info.email}" ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >전화번호</td>
     <td width="400"><input   type="text" name="tel"  value="${Info.tel}" ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >가입일</td>
     <td width="400"><input   type="text"  name="regdate" value="${Info.regdate}" disabled  ></td>
   </tr>
   <tr align="center" >
    <td colspan="2" width="400"><input type="submit" value="수정하기" >
       <input type="reset" value="다시입력" > </td>
   </tr>
 </table>
</form>
</html>
