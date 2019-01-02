<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="bcode" value="${param.bcode}" />
<c:set var="page" value="${param.page}" />
<c:set var="key" value="${param.key}" />
<c:set var="word" value="${param.word}" />
<c:set var="seq" value="${param.seq}" />
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/bootswatch.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/skin_purple.css" type="text/css">
<link rel="stylesheet" href="/css/header.css">
</head>
<script src="/js/jquery-2.1.0.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/bootswatch.js"></script>
<script src="/js/board.js" defer="defer"></script>
<body>
  <input type="hidden" id="mno" value="${sessionScope.mno}">
  <input type="hidden" id="mid" value="${sessionScope.mid}">
	<form id="commonForm" method="get" action="">
		<input type="hidden" id="bcode" name="bcode" value="${param.bcode}">
		<input type="hidden" id="page" name="page" value="${param.page}">
		<input type="hidden" id="key" name="key" value="${param.key}">
		<input type="hidden" id="word" name="word" value="${param.word}">
		<input type="hidden" id="seq" name="seq" value="${article.seq}">
	</form>
	<div class="navbar navbar-default navbar-absolute-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/mypage">BitCamp</a>
			</div>
			<div class="navbar-collapse collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
						<c:if test="${sessionScope.mid eq 'admin'}">
							<li class="">
							  <a href="/manage">회원관리</a>
							</li>
						</c:if>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a id="logout" data-mid="${sessionScope.mid}">로그아웃 (${sessionScope.mid})</a></li>
					<li class="dropdown">
						<!-- <a href="#" class="dropdown-toggle" data-toggle="dropdown">설정 <b class="caret"></b></a> -->
						<ul class="dropdown-menu">
							<li><a href="#">개인정보</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
  <div id="accordion-wrap">
	  <ul id="accordion" class="accordion"></ul>
  </div>