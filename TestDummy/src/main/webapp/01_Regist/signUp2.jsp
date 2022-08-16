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
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;
}

 body {
  background-image:#34495e;
}

.joinForm {
  position:absolute;
  width:400px;
  height:700px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

 h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}


.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pwd {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pwd2 {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.cellphoneNo {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40px;
  transform: translateX(-40px);
  margin-bottom: 40px;
  width:400px;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0s;
  display:inline-block;
  
}

.btn:hover {
  background-position: center;
}

.mainLogo {
  display : block;
  margin : auto;
  width: 40%;
  top : 150px;
  left : 50px;
	}

</style>
   <meta charset="UTF-8">
   <title>회원 가입창</title>
</head>
<script>
function check_pwd(){ 
	var pwd = document.getElementById('pwd').value;
	var pwd2 = document.getElementById('pwd2').value;
	var ch = document.getElementById('check');
	
	 if(pwd !='' && pwd2 !=''){
         if(pwd == pwd2){
        	 ch.innerHTML='비밀번호가 일치합니다.'
        		 ch.style.color='blue';
         }
         else{
        	 ch.innerHTML='비밀번호가 일치하지 않습니다.';
        	 ch.style.color='red';
        	
        }
    }
}
</script>
<body>
<form method="post" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;" action="${contextPath}/user/userJoin.do">
<img class="mainLogo" src="../98_Image/QRMusic_MainLogo.jpg" >

       
       <h2>회원가입</h2>
      <div class="textForm">
        <input name="loginId" type="text" class="id" placeholder="아이디">
      </div>
      <div class="textForm">
        <input name="pwd" type="password" class="pwd" id="pwd" placeholder="비밀번호" onchange="check_pwd()">
      </div>
       <div class="textForm">
        <input name="pwd2" type="password" class="pwd2" id="pwd2" placeholder="비밀번호 확인" onchange="check_pwd()"><span id="check"></span>
      </div>
      <div class="textForm">
        <input name="name" type="text" class="name" placeholder="이름">
      </div>
       <div class="textForm">
        <input name="email" type="text" class="email" placeholder="이메일">
      </div>
      <div class="textForm">
        <input name="cellphoneNo" type="tel" class="cellphoneNo" placeholder="전화번호">
      </div>
      <input type="submit" class="btn" value="회원가입"/>
      <input type="submit" class="btn" value="취소하기" onclick="location.href='../00_Main/Main.jsp'"/>
    </form>
</body>
</html>
