<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="bcode" value="${param.bcode}" />
<c:set var="page" value="${param.page}" />
<c:set var="key" value="${param.key}" />
<c:set var="word" value="${param.word}" />
<c:set var="seq" value="${param.seq}" />
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${root}/css/skin_purple.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${root}/js/board.js"></script>
</head>
<body>
<form id="commonForm" method="get" action="">
  <input type="hidden" id="bcode" name="bcode" value="${param.bcode}">
  <input type="hidden" id="page" name="page" value="${param.page}">
  <input type="hidden" id="key" name="key" value="${param.key}">
  <input type="hidden" id="word" name="word" value="${param.word}">
  <input type="hidden" id="seq" name="seq" value="">
</form>