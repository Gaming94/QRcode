<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QR Music Player</title>
	<script src="MusicPlayer.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<style>
	/* ROBOTO */

	@import url(https://fonts.googleapis.com/css?family=Roboto:400,300,500);
	body {
	  background: url('../98_Image/Music_1.jpg') no-repeat center center fixed;
	  -webkit-background-size: cover;
	  -moz-background-size: cover;
	  -o-background-size: cover;
	  background-size: cover;
	  /* IE ...BECAUSE FY THATS WHY */
	  
	  filter: progid: DXImageTransform.Microsoft.AlphaImageLoader(src='.myBackground.jpg', sizingMethod='scale');
	  -ms-filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='myBackground.jpg', sizingMethod='scale')";
	}
	
	#overlay {
	  position: absolute;
	  top: 0;
	  left: 0;
	  background: rgba(0, 0, 0, 0.3);
	  width: 100%;
	  height: 100%;
	  z-index: -1;
	}
	
	header {
	  width: 100%;
	  margin: 0 auto;
	}
	
	#menu-bar {
	  cursor: pointer;
	  /* not a real menu */
	  
	  margin-top: 40px;
	  margin-left: 40px;
	  width: 40px;
	}
	
	#menu-bar span {
	  width: 100%;
	  height: 4px;
	  float: left;
	  margin-bottom: 6px;
	  background: #FFF;
	}
	
	#song-info {
	  width: 400px;
	  margin: 0 auto;
	  text-align: center;
	}
	
	#song-info h1 {
	  font-family: Roboto;
	  font-weight: 500;
	  color: #FFF;
	  font-size: 46px;
	}
	
	#song-info p {
	  font-family: Roboto;
	  font-weight: 400;
	  color: #FFF;
	  font-size: 26px;
	  margin-top: -30px;
	}
	
	#search {
	  float: right;
	  width: 80px;
	  position: absolute;
	  top: 40px;
	  right: 40px;
	  color: #FFF;
	  cursor: pointer;
	}
	
	#content {
	  position: fixed;
	  z-index: 100;
	  bottom: 0;
	  left: 0;
	  width: 100%;
	  height: 120px;
	  background: #FFF;
	  -webkit-box-shadow: 0px -12px 80px -5px rgba(0, 0, 0, 0.75);
	  -moz-box-shadow: 0px -12px 80px -5px rgba(0, 0, 0, 0.75);
	  box-shadow: 0px -12px 80px -5px rgba(0, 0, 0, 0.75);
	}
	/*
	CLEAN THAT BITCH
	*/
	
	input[type=range] {
	  -webkit-appearance: none;
	  width: 100%;
	}
	
	input[type=range]::-webkit-slider-thumb {
	  -webkit-appearance: none;
	}
	
	input[type=range]:focus {
	  outline: none;
	}
	
	input[type=range]::-ms-track {
	  width: 100%;
	  cursor: pointer;
	  background: transparent;
	  border-color: transparent;
	  color: transparent;
	}
	
	#content #range {
	  width: 100%;
	  margin-top: -10px;
	}
	/*
	RESTYLE THAT BITCH
	*/
	
	input[type=range]::-webkit-slider-thumb {
	  -webkit-appearance: none;
	  height: 28px;
	  width: 28px;
	  border-radius: 50px;
	  background: #EF6C00;
	  cursor: pointer;
	  margin-top: -14px;
	  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5);
	  -webkit-transition: all 0.2s;
	  -moz-transition: all 0.2s;
	  transition: all 0.2s;
	}
	
	input[type=range]::-webkit-slider-thumb:active {
	  height: 38px;
	  width: 38px;
	  margin-top: -18px;
	}
	
	input[type=range]::-moz-slider-thumb:active {
	  height: 38px;
	  width: 38px;
	  margin-top: -18px;
	}
	
	input[type=range]::-ms-slider-thumb:active {
	  height: 38px;
	  width: 38px;
	  margin-top: -18px;
	}
	
	input[type=range]::-moz-range-thumb {
	  height: 28px;
	  width: 28px;
	  border-radius: 50px;
	  background: #EF6C00;
	  cursor: pointer;
	  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5);
	}
	
	input[type=range]::-ms-thumb {
	  height: 28px;
	  width: 28px;
	  border-radius: 50px;
	  background: #EF6C00;
	  cursor: pointer;
	  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5);
	}
	
	input[type=range]::-webkit-slider-runnable-track {
	  width: 100%;
	  height: 8px;
	  cursor: pointer;
	  background: #EF6C00;
	}
	
	input[type=range]:focus::-webkit-slider-runnable-track {
	  background: #EF6C00;
	}
	
	input[type=range]::-moz-range-track {
	  width: 100%;
	  height: 8px;
	  cursor: pointer;
	  background: #EF6C00;
	}
	
	input[type=range]::-ms-track {
	  width: 100%;
	  height: 8px;
	  cursor: pointer;
	  background: #EF6C00;
	}
	
	input[type=range]::-ms-fill-lower {
	  width: 100%;
	  height: 8px;
	  cursor: pointer;
	  background: #EF6C00;
	}
	
	input[type=range]:focus::-ms-fill-lower {
	  background: #EF6C00;
	}
	
	input[type=range]::-ms-fill-upper {
	  width: 100%;
	  height: 8px;
	  cursor: pointer;
	  background: #EF6C00;
	}
	
	input[type=range]:focus::-ms-fill-upper {
	  background: #EF6C00;
	}
	/*
	 OK, I NEED TO CALM DOWN
	*/
	
	#content #time {
	  float: left;
	  position: absolute;
	  left: 30px;
	  bottom: 30px;
	}
	
	#content #time p {
	  color: #000;
	  font-family: Roboto;
	  font-weight: normal;
	  font-size: 21px;
	}
	
	#content #total-time {
	  float: left;
	  position: absolute;
	  right: 30px;
	  bottom: 30px;
	}
	
	#content #total-time p {
	  color: #000;
	  font-family: Roboto;
	  font-weight: normal;
	  font-size: 21px;
	}
	
	#content #buttons {
	  width: 100%;
	  margin: 0 auto;
	  text-align: center;
	  height: 120px;
	}
	
	#content #buttons i {
	  cursor: pointer;
	  padding-left: 50px;
	  line-height: 120px;
	}
	/*
	FINALLY
	*/
	
	footer {
	  position: absolute;
	  bottom: 180px;
	  left: 0px;
	  width: 100%;
	}
	
	footer #repeat {
	  float: left;
	  position: absolute;
	  left: 40px;
	  font-size: 48px;
	  bottom: 10px;
	  color: #FFF;
	  cursor: pointer
	  /* not a button */
	}
	
	footer #random {
	  float: left;
	  position: absolute;
	  right: 40px;
	  font-size: 48px;
	  bottom: 10px;
	  color: #FFF;
	  cursor: pointer;
	  /* not a button */
	}
	
	#tip {
	  position: absolute;
	  display: none;
	  box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.3);
	  background: #EF6C00;
	  padding: 10px;
	  font-family: Roboto;
	  font-weight: normal;
	  font-size: 36px;
	  color: #FFF;
	  top: -90px;
	  border-radius: 2px;
	}
	
	</style>
</head>
<body>
	<div id="overlay"></div>
	<header>
	  <div id="menu-bar">
	    <span></span>
	    <span></span>
	    <span></span>
	  </div>
	  
	  <div id="song-info">
	    <h1>Song name</h1>
	    <p>Song artist</p>
	  </div>
	  
	  <div id="search">
	    <i class="fa fa-search fa-2x"></i>
	  </div>
	</header>
	
	<div id="content">
	  <div id="range">
	    <input type="range" id="range-val" value="0" min="0" max="143">
	    <div id='tip'>Some tip</div>
	  </div>
	  <div id="time">
	    <p>0:00</p>
	  </div>
	  <div id="buttons">
	    <i class="fa fa-step-backward fa-3x"></i>
	    <i class="fa fa-pause fa-3x step"></i>
	    <i class="fa fa-step-forward fa-3x"></i>
	  </div>
	  <div id="total-time">
	    <p>2:23</p>
	  </div>
	</div>
	
	<footer>
	  <div id="repeat">
	    <i class="fa fa-repeat"></i>
	  </div>
	  <div id="random">
	    <i class="fa fa-random"></i>
	  </div>
	</footer>
</body>
</html>