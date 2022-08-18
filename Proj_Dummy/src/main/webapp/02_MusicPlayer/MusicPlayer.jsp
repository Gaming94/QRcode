<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"
    isELIgnored="false" %>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String songtitle = (String)request.getParameter("songtitle");
%>
    
<!DOCTYPE html>


<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Music Player</title>
  <link rel="stylesheet" href="./MusicPlayer.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>
<body>
<!-- partial:index.partial.html -->
<link href='https://fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'>
<div class="player">
	    <canvas></canvas>
		<div class="song">
			<div class="artist">리쌍</div>
			<div class="name">DummyText</div>
		</div>
		<div class="playarea">
			<div class="prevSong"></div>
			<div class="play"></div>
			<div class="pause"></div>
			<div class="nextSong"></div>
		</div>
		<div class="soundControl"></div>
		<div class="time">00:00</div>
	</div>
<!-- partial -->
  <script  src="./MusicPlayer.js"></script>

</body>
</html>