<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />     
<!DOCTYPE html>
<html>
<head>
<style>
	head, body {
    	background: #f2f3f7;
    	font-size: 15px; 
    	font-weight: 400; 
    	color: #3a3635;
    }
   	table {
   		width: 400px;
   		height: 500px;
   		border-style: solid; 
   		border-color: #bdc6c9;
   		border-width: 0.3px 0.3px;
   		background: #fff;
   		margin-left: auto;
    	margin-right: auto;
   	}
   	.jb-th-1 {
    	width: 200px;
  	}
   	td {
   		width: 400px;
   	}
   	p{
   		float: right;
   	}
   	.btn-5 {
	  width: 350px;
	  height: 65px;
	  line-height: 42px;
	  padding: 0;
	  border: none;
	  background: rgb(255,27,0);
	  background: linear-gradient(0deg, rgba(255,27,0,1) 0%, rgba(251,75,2,1) 100%);
	  color: white;
	  font-size: 130%;
	}
	.btn-5:hover {
	  color: white;
	  background: rgb(255,35,5);
	  box-shadow: none;
	}
	.btn-5:before,
	.btn-5:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #f0094a;
	  box-shadow:
	   -1px -1px 5px 0px #fff,
	   7px 7px 20px 0px #0003,
	   4px 4px 5px 0px #0002;
	  transition:400ms ease all;
	}
	.btn-5:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.btn-5:hover:before,
	.btn-5:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	.mainLogo {
		display : block;
        margin : auto;
		width: 10%;
		top : 150px;
		left : 50px;
	}
</style>
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
<form method="post"   action="${contextPath}/user/userJoin.do">
<img class="mainLogo" src="../98_Image/QRMusic_MainLogo.jpg" >
<h1  style="text-align:center">회원 가입창</h1>
<table>
    <tr>
       <td><p>아이디</td>
       <td><input type="text" name="id"></td>
    </tr>
    <tr>
       <td><p>비밀번호</td>
       <td><input type="password"  name="pwd" id="PWD" onchange="check_pwd()"></td>
    </tr>
    <tr>
       <td><p>비밀번호 확인</td>
       <td><input type="password" name="pwd2" id="PWD2" onchange="check_pwd()">&nbsp;<span id="check"></span></td>
    </tr>
    <tr>
       <td><p>이름</td>
       <td><input type="text"  name="name"></td>
    </tr>
    <tr>
       <td><p>이메일</td>
       <td><input type="text"  name="email"></td>
    </tr>
    <tr>
       <td><p>전화번호</td>
       <td><input type="text"  name="tel"></td>
    </tr>
    <tr>
       <td colspan="2" align=center>
	       <input class="custom-btn btn-5" width=400 type="submit" value="가입하기">
       </td>
    </tr>
    <tr>
		<td colspan="2" align=center>
			 <a href="../00_Main/Main.html"><button type="button" class="custom-btn btn-5" width=400>가입취소</button></a>
		</td>
    </tr>
</table>
</form>
</body>
</html>
