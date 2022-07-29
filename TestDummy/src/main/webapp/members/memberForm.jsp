<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />     
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>회원 가입창</title>
</head>
<script>
	function check_pwd(){ 
    	var PWD = document.getElementById('PWD').value;
    	
        if(document.getElementById('PWD').value !='' && document.getElementById('PWD2').value!=''){
            if(document.getElementById('PWD').value==document.getElementById('PWD2').value){
                document.getElementById('check').innerHTML='OK'
                document.getElementById('check').style.color='blue';
            }
            else{
                document.getElementById('check').innerHTML='비밀번호 불일치.';
                document.getElementById('check').style.color='red';
            }
        }
    }
</script>
<body>
<form method="post"   action="${contextPath}/member/addMember.do">
<h1  style="text-align:center">회원 가입창</h1>
<table  align="center">
    <tr>
       <td width="200"><p align="right">아이디</td>
       <td width="400"><input type="text" name="id"></td>
    </tr>
    <tr>
        <td width="200"><p align="right">비밀번호</td>
        <td width="400"><input type="password"  name="pwd" id="PWD" onchange="check_pwd()"></td>
    </tr>
    <tr>
        <td width="200"><p align="right">비밀번호 확인</td>
         <td><input type="password" name="pwd2" id="PWD2" onchange="check_pwd()">&nbsp;<span id="check"></span></td>
    </tr>
    <tr>
        <td width="200"><p align="right">이름</td>
        <td width="400"><p><input type="text"  name="name"></td>
    </tr>
    <tr>
        <td width="200"><p align="right">이메일</td>
        <td width="400"><p><input type="text"  name="email"></td>
    </tr>
    <tr>
        <td width="200"><p align="right">전화번호</td>
        <td width="400"><p><input type="text"  name="tel"></td>
    </tr>
    <tr>
        <td width="200"><p>&nbsp;</p></td>
        <td width="400">
	       <input type="submit" value="가입하기">
	       <input type="reset" value="다시입력">
       </td>
    </tr>
</table>
</form>
</body>
</html>
