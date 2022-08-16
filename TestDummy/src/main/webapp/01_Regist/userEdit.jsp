<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="userInfo.UserDAO" %>
<%@ page import="userInfo.UserVO" %>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정창</title>
<style>
  * {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;
  }
  
  .mainLogo {
  display : block;
  margin : auto;
  width: 40%;
  top : 150px;
  left : 50px;
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

  .id .pwd .pwd2 .name .email .tel {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
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

 <h2>회원 정보 수정</h2>
<form  method="post" action="../01_Regist/userModify.jsp?id=<%=id%>">
 <table>
   <tr>
     <td width="200"><p align="right" >아이디</td>
     <td width="400"><input   type="text" name="id" value="<%=uvo.getId() %>" disabled ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >비밀번호</td>
     <td width="400"><input   type="password" name="pwd" value="<%=uvo.getPwd() %>" >
   </td>
   </tr>
   <tr>
     <td width="200"><p align="right" >이름</td>
     <td width="400"><input   type="text" name="name" value="<%=uvo.getName() %>" ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >이메일</td>
     <td width="400"><input   type="text" name="email"  value="<%=uvo.getEmail() %>" ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >전화번호</td>
     <td width="400"><input   type="text" name="tel"  value="<%=uvo.getTel() %>" ></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >가입일</td>
     <td width="400"><input   type="text"  name="regdate" value="<%=uvo.getRegdate() %>" disabled  ></td>
   </tr>
   <tr align="center" >
    <td colspan="2" width="400"><input type="submit" value="수정하기" >
       <input type="reset" value="다시입력" > <a href="../00_Main/Main.jsp">뒤로가기</a></td>
   </tr>
 </table>
</form>
</html>
