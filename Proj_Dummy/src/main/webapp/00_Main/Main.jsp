<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:set var="data-value" value="${ex1}" scope="page" />

<html>
<head>
<meta charset="UTF-8" content="no-cache"/>
<title>QR Music</title>
	<link href="Main.css" rel="stylesheet" type="text/css">
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
</head>
<body>		
	<div class="logo">
		<a href="Main.html">
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
   				<a href="Main.html">공지사항</a>
   			</li>
   			<li>
   				<a href="Main.html">음악요청</a>
   			</li>
   		</ul>
   		<hr>
	</div>
	
	<div class="menu_right">
		<ul>
	    	<li>
	    		<c:choose>
	    			<c:when test="${false}">
	    				<a data-toggle="modal" data-target="#exampleModal" style="cursor:hand;">로그인/회원가입</a>
	    			</c:when>
	    			<c:when test="${true}">
	    				<a data-toggle="modal" data-target="#exampleModal" style="cursor:hand;">회원정보수정</a>
	    			</c:when>
	    		</c:choose>
	   		</li>
		</ul>
	</div>
	
	<div class="menu_left">
		<ul>
			<li>
			    <img src="../98_Image/MenuIcon_1.jpg">
				<a href="Main.html">인기차트</a>
			</li>
			<li>
				<img src="../98_Image/MenuIcon_2.JPG">
				<a href="Main.html">최신음악</a>
			</li>	
			<li>
				<img src="../98_Image/MenuIcon_3.JPG">
				<a href="Main.html">장르</a>
			</li>
			<li>
				<img src="../98_Image/MenuIcon_3.JPG">
				<a href="Main.html">내 음악</a>
			</li>
			<li>
				<img src="../98_Image/MenuIcon_1.jpg">
				<a href="Main.html">테마</a>
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
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
		</ul>
		
		<ul>
			<li>
				<img src="../98_Image/DummyAlbum.jpg" alt="">
			</li>
			<li>
				<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.jsp', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img  src="../98_Image/NewJeans.jpg"></button>
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
			</li>
			<li>
				<img src="../98_Image/DummyAlbum.jpg">
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
			<li><span>6</span>리쌍</li>
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