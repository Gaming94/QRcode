<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" content="no-cache"/>
<title>QR Music</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">로그인 창</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <form action="../01_Regist/login.jsp" method="post">
	      <div class="modal-body">	       
	        <table>
	    		<tr>
	       			<td><p>아이디</td>
	       			<td><input type="text" name="id"></td>
	    		</tr>
	    		<tr>
	       			<td><p>비밀번호</td>
	       			<td><input type="password" name="pwd"></td>
	       		</tr>
	       	</table>	       	
	      </div>
	      <div class="modal-footer">
	        <button type="submit">로그인</button>
	        <a href="../01_Regist/signUp.jsp"><button type="button">회원가입</button></a>	        
	      </div>
	      </form>
	    </div>
	  </div>
	</div>	
	
	<style>
	body {	
	  padding: 0px;
	  margin: 0px;
	}
	
	.LPImg {
		position:absolute;
		top : 500px;
		left : 550px;
		width  : 100px;
		height : 100px;
	}
	
	.LPImg img:hover {
		transition : transform 7s;
		transform:rotate(360deg);
	}
	
	.logo{
		position: fixed;
		top : 20px;
		left : 50px;
	}
	
	.menu_top{
		position: fixed;
		z-index : 99;
		top : 0px;
		left : 200px;
		width: 90%;
		height: 100px;
		color : white;
		overflow:hidden;
		
		padding-top : 20px;
		
		background-color : white;
		
		border: 1px solid;
		border-color : rgb(255, 255, 255);
	}
	
	li{list-style:none}
	
	.menu_top ul{
		display : inline-block;
	}
	
	.menu_top li {
		top : 50px;
		width: 90PX;
		float: left;
		text-align: center;
		line-height: 30px;
	}
	
	.menu_top input {
		top : 30px;
		width: 350px;
		height: 40px;
		font-size: 13px;
		color : Black;
		outline: none;
		padding-left: 17px;
		
		background-image: url('../98_Image/Search.jpg');
		background-repeat: no-repeat;
		background-size : 35px;
		background-position: right;
		
		border-radius: 20px;
		border : 2px solid;
		border-color: rgb(255, 0, 0);
	}
	
	.menu_left{
		position: fixed;
		z-index : 99;
		top: 100px;
		width: 200px;
		height: 100%;
		overflow:hidden;
		
		padding-top: 30px;
		
		background-color : white;
	}
	
	.menu_left li {
		height: 60PX;
		text-align: left;
	}
	
	.menu_right{
		position : fixed;
		z-index : 99;
		top : 10px;
		right : 30px;
		width : 200px;		
	}
	
	.menu_right li {
		top : 0px;
		width: 130PX;
		float: left;
		text-align: center;
		line-height: 25px;
	}
	
	.Weekend_Music{
		position: absolute;
		z-index : 1;
		top : 110px;
		left : 198px;
		width : 90%;
		height : 600px;
		background: rgb(223, 229, 232);
	}
	
	.Weekend_Music li{
		padding-left: 10px;
		padding-right: 50px;
		display: inline-block;
	}
	
	.Weekend_Music button{
		border : none;
		outline: none;
  		box-shadow: none;
  		background-color: rgb(223, 229, 232);
	}
	
	.Weekend_Music img:hover{
		transform : scale(1.1);
		z-index: 100;
		transition: transform.1s
	}
	
	.weekend_Music button:focus,
	button:active {
  		outline: none;
  		box-shadow: none;
	}
	
	.MusicChart{
		position : absolute;
		z-index : 1;
		top : 720px;
		left : 202px;
		width : 40%;
		height : 600px;
		background: #fff;
	}
	
	.MusicChart ul{
		position: relative;
		background: #fff;
	}
	
	.MusicChart ul li{
		list-style : none;
		padding : 10px;
		widows: 80%;
		background: #fff;
		box-shadow: 0 5px 25px rgba(0, 0, 0, .1);
		transition : transform 0.5s;
	}
	
	.MusicChart ul li:hover{
		transform : scale(1.07);
		z-index: 100;
		background: #25bcff;
		box-shadow: 0 5px 25px rgba(0, 0, 0, .2); 
		color : #fff;
	}
	
	.MusicChart ul li span{
		width : 20px;
		height: 20px;
		text-align: center;
		line-height: 20px;
		background: #25bcff;
		color : #fff;
		display : inline-block;
		border-radius: 50%;
		margin-right : 20px;
		font-size: 12px;
		font-weight: 600;
	}
	
	.MusicVideo{
		position : absolute;
		z-index : 1;
		top : 720px;
		left : 1120px;
		width : 40%;
		height : 600px;
		background : #fff;
	}
	
	.text{
		padding-top : 15px;
		padding-left : 30px;
	}
	
	h2{
		display: inline-block;
	}
	
	.text p{
		display: inline-block;
		padding-left: 20px;
	}
	
	a{
		color : Black;
		font-size : 15px;
		text-decoration:none;
	}
	
	a:link {
		color : Black;
		text-decoration:none;
	}
	
	a:visited {
		color : Black;
		text-decoration:none;
	}
	
	a:hover{
		color : Gray;
		text-decoration:none;
		cursor : pointer;
	}
	
	#jstext {
	  	font-size: 15px;
	}
	
	@font-face{
		font-family: 'CookieRun';
		src: url('../99_Other/00_Font/CookieRun-Regular.woff') format('woff');
	}
	
	@font-face {
	    font-family: 'CookieRun';
	    src: url('../99_Other/00_Font/CookieRun-Regular.ttf') format('truetype');
	}
	
	@font-face {
	    font-family: 'CookieRun';
	    src: url('../99_Other/00_Font/CookieRun-Regular.ttf') format('openetype');
	}
		
	</style>
</head>
<body>		
	<div class="logo">
		<a href="Main.jsp">
			<img src="../98_Image/QRMusic_MainLogo.jpg" width="70">
		</a>
	</div>

	<div class="menu_top">
      <div>
	      <form>
		      	<input type="text">
	      </form>
      </div>
  		<ul>
   			<li>
   				<a href="../03_Notice/notice.jsp">공지사항</a>
   			</li>
   			<li>
   				<a href="Main.jsp">음악요청</a>
   			</li>
   		</ul>
   		<hr>
	</div>
	<%
		String id = null;
		String admin = "QRCODE";
		int check = 0;
		if(session.getAttribute("user_id") != null) {
	    	id = (String)session.getAttribute("user_id");	
	    	if(id.equals(admin))
	    		check = 1;
	    	else
	    		check = 0;
		}
		if(session.getAttribute("user_id") == null)
			id = null;
    %>	
	<div class="menu_right">
			<ul>
			<% if ( id == null) {%>
		    	<li>	    		
		    		 <a data-toggle="modal" data-target="#exampleModal" style="cursor:hand;">로그인/회원가입</a>
		    	</li>
		    <%} else if (id != null) {
		      if (check == 0) {
		    %>
		    	<li>
				    <%=id %>님 환영합니다
				</li>
				<li>
				    <a href="../01_Regist/logout.jsp">로그아웃</a>
				</li>
			<%} else if(check == 1) {%>
				<li>
				    관리자님 환영합니다
				</li>
				<li>
				    <a href="../user/userInfo.do">회원정보</a>
				</li>
				<li>
				    <a href="../01_Regist/logout.jsp">로그아웃</a>
				</li>
				<%}} %>
			</ul>
	</div>
	<div class="menu_left">
		<ul>
			<li>
			    <img src="../98_Image/MenuIcon_1.jpg">
				<a href="Main.jsp">인기차트</a>
			</li>
			<li>
				<img src="../98_Image/MenuIcon_2.JPG">
				<a href="Main.jsp">최신음악</a>
			</li>	
			<li>
				<img src="../98_Image/MenuIcon_3.JPG">
				<a href="Main.jsp">장르</a>
			</li>
			<li>
				<img src="../98_Image/MenuIcon_3.JPG">
				<a href="Main.jsp">내 음악</a>
			</li>
			<li>
				<img src="../98_Image/MenuIcon_1.jpg">
				<a href="Main.jsp">테마</a>
			</li>
		</ul>
	</div>
	
	<div class="Weekend_Music">
		<div class="text">
			<h2>최신 음악</h2>
			<a>전체</a>
			<a>해외</a>
			<a>국내</a>
		 
		</div>

		<ul>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_4.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
			</li>
		</ul>
		
		<ul>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_4.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
			</li>
		</ul>
		
	</div>
	
	<div class = "MusicChart">
		<div class = "text">
		<h2>실시간 곡 차트</h2>
		<script>
			let today = new Date();   
			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1;  // 월
			let date = today.getDate();  // 날짜
			let day = today.getDay();  // 요일
	
			document.write('<p id = "jstext">' + year + '년' + month + '월 ' + date + '일' + '</p>')
		</script>
		<hr>
		</div>
		<ul>
			<li><span>1</span>연애소설</li>
			<li><span>2</span>1분1초</li>
			<li><span>3</span>발레리노</li>
			<li><span>4</span>에픽하이</li>
			<li><span>6</span>TomBoy</li>
			<li><span>7</span>리쌍</li>
			<li><span>8</span>리쌍</li>
			<li><span>9</span>리쌍</li>
			<li><span>10</span>다듀</li>
		</ul>
	</div>	
	
	<div class = "MusicVideo">
		<div class = "text">
			<h2>뮤직 비디오</h2>
		</div>
		<iframe width="360" height="210" src="https://www.youtube.com/embed/Jh4QFaPmdss" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<iframe width="360" height="210" src="https://www.youtube.com/embed/pTD9Jysi3_g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<iframe width="360" height="210" src="https://www.youtube.com/embed/dYIT_jeUBKg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<iframe width="360" height="210" src="https://www.youtube.com/embed/8dJyRm2jJ-U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>

</body>
</html>