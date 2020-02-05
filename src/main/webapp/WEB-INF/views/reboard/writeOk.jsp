<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
section {
width: 75%;
float:right;
margin-right: 15rem;
}

table{
margin: auto;
width: 100%;
}

tr{
text-align: center;
}

img{
margin: 0.5rem;
}
</style>
<c:choose>
  <c:when test="${errorMsg ne null}">
    <font color="red" size="15">${errorMsg}</font>
  </c:when>
  <c:otherwise>

<section>
<input type="hidden" id="wseq" value="${wseq}">
	<table>
		<tr>
			<td height="1" bgcolor="#e1e1e1" style="overflow: hidden; padding: 0px;"></td>
		</tr>
		<tr>
			<td><b>게시물이 등록되었습니다.</b><br>
			<br>
			<div>
			    <img src="${root}/img/board/b_wirtecf.gif" id="viewBtn" width="91" height="21"
			        border="0" align="absmiddle" alt="작성한 글 확인" hspace="10">
			    <img src="${root}/img/board/poll_listbu1.gif" id="listBtn"
			        width="62" height="21" border="0" align="absmiddle" alt="목록보기" hspace="10">
			  </div>
			</td>
		</tr>
	</table>
</section>
<br>
  </c:otherwise>
</c:choose>
<%@ include file="../include/footer.jsp"%>
</body>
<script src="/js/reboard/writeOk.js" defer="defer"></script>
</html>