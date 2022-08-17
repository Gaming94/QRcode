<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var ="WMBtnValue" value="${'All'}" />

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" content="no-cache"/>
<title>QR Music</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="../99_Other/01_CSS/Main.css">
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
	        <a href="../01_Regist/signUp.jsp">
	        	<button type="button">회원가입</button>
        	</a>	        
	      </div>
	      </form>
	    </div>
	  </div>
	</div>	
	
	<script>
	function WMFormLoad() {
	    document.querySelector("#Kor").style.display="none";
	    document.querySelector("#Os").style.display="none";
	}
	</script>
	
</head>
<body onload="WMFormLoad()">		
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
   				<a href="../04_Board/board.jsp">음악요청</a>
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
				    <a href="../01_Regist/userInfo.jsp">내 정보 관리</a>
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
			
			<script>
			function WMShow_All() {
			    document.querySelector("#All").style.display="block";
			    document.querySelector("#Kor").style.display="none";
			    document.querySelector("#Os").style.display="none";
			}
			
			function WMShow_Kor() {
			    document.querySelector("#All").style.display="none";
			    document.querySelector("#Kor").style.display="block";
			    document.querySelector("#Os").style.display="none";
			}
			
			function WMShow_Os() {			 
			    document.querySelector("#All").style.display="none";
			    document.querySelector("#Kor").style.display="none";
			    document.querySelector("#Os").style.display="block";
			}

			</script>
			
			<button id = "WMBtn_1" onclick="WMShow_All()">전체</button>
			<button id = "WMBtn_2" onclick="WMShow_Kor()">국내</button>
			<button id = "WMBtn_3" onclick="WMShow_Os()">해외</button>
		</div>
		
		<div id = "All">
			<ul>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
			</ul>
			<ul>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=750, height=800, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_1.jpg"></button>
				</li>
			</ul>
		</div>
		<div id ="Kor">
			<ul>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
			</ul>
			<ul>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_2.jpg"></button>
				</li>
			</ul>
		</div>
		<div id = "Os">
			<ul>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
			</ul>
			<ul>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
				<li>
					<button type="button" id="img_btn" onclick="window.open('../02_MusicPlayer/MusicPlayer.html', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');"><img src="../98_Image/Music_3.jpg"></button>
				</li>
			</ul>
		</div>
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