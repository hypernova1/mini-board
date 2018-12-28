<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#logout{
  cursor: pointer;
}
</style>
<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">BitCamp</a>
        </div>
        <div class="navbar-collapse collapse navbar-responsive-collapse">
            <ul class="nav navbar-nav">
              <li class="">
                  <a href="/board/main" class="" data-toggle="">게시판</a>
        <c:if test="${member.mid eq 'admin'}">
                <li class="active">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">회원관리</a>
                  <ul class="dropdown-menu">
                        <li><a href="#">회원등록</a></li>
                        <li><a href="#">회원목록</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">미디어관리</a>
                  <ul class="dropdown-menu">
                        <li><a href="#">미디어등록</a></li>
                        <li><a href="#">미디어목록</a></li>
                    </ul>
                </li>
                <li><a href="#">대출관리</a></li>
                <li><a href="#">공지사항</a></li>
        </c:if>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a id="logout">로그아웃 (${member.mid})</a></li>
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
<script>
function ajax(url, method, obj){
    return $.ajax({
      url: url,
      type: method,
      contentType: 'application/json;charset=utf-8',
      dataType: 'json',
      data: JSON.stringify(obj),
    })
  }
  
document.querySelector('#logout').addEventListener('click', function(){
    ajax('/member/logout','post', {}).success(function(data){
        location.href = "/login";
    })
    
})
</script>
