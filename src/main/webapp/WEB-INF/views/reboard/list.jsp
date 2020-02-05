<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
section {
  padding-right: 1.5rem;
  float: right;
  width: 88%;
  float:right;
  margin: 10px 0px;
}
table{
  width: 100%;
}
.posting td{
  height: 30px;
}
.posting{
  cursor: pointer;
}
.posting:hover{
  background: #f5f6fa;
  transition: all 0.5s;
}
.writeBtn{
  cursor:pointer;
}
</style>


<%@ include file="../include/header.jsp" %>
<!-- title start -->
<section>
	<table>
		<tr>
			<td>
			  <img src="/img/board/m_icon_board.gif" width="9" 
			   height="9" border="0" align="absmiddle" style="margin-top: -2px">
				<b>자유게시판</b> &nbsp;
				<font style="font-size: 8pt">|</font>&nbsp; 자유로운 글을 올리는 공간입니다 <br>
		  </td>
			<td align="right"></td>
		</tr>
		<tr>
			<td colspan="2" height="19"></td>
		</tr>
	</table>
	<!-- title end -->

	<!-- bbs start -->
	<table border="0" cellpadding="0" cellspacing="0">
		<tr valign="bottom">
				<td style="padding-left: 6px" valign="bottom">새글 <b>
				  <font class="text_acc_02">${navigator.newArticleCount}</font>
				</b> / 전체 
				<font class="text_acc_02">${navigator.totalArticleCount}</font>
			</td>
			<td width="300" nowrap>
				<div align="right"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="5" style="padding: 0px"></td>
		</tr>
	</table>

	<form name="listForm" method="post" style="margin: 0px">
		<table>
			<tr>
				<td class="bg_board_title_02" height="2" colspan="11" style="overflow: hidden; padding: 0px"></td>
			</tr>
			<tr class="bg_board_title" align="center" height="28">
				<th nowrap style="text-align:center;">번호</th>
				<td nowrap class="board_bar" style="padding: 0px">|</td>
				<th nowrap style="text-align:center;"colspan="2" width="300px">제목</th>
				<td nowrap class="board_bar" style="padding: 0px">|</td>
				<th style="text-align:center;"nowrap>글쓴이</th>
				<td nowrap class="board_bar" style="padding: 0px">|</td>
				<th style="text-align:center;"nowrap>조회</th>
				<td nowrap class="board_bar" style="padding: 0px">|</td>
				<th style="text-align:center;"nowrap>날짜</th>
			</tr>
			<tr>
				<td class="bg_board_title_02" height="1" colspan="11"
					style="overflow: hidden; padding: 0px"></td>
			</tr>

			<c:forEach var="article" items="${articlelist}">
				<tr class="posting">
					<td align="center" class="text_gray">${article.seq}</td>
					<td></td>
					<td class="post-title" style="word-break: break-all;">
					  <img src="/img/board/blank.gif" height="1" width="${article.lev * 10}" style="padding-left: 1.5rem;"> 
						${article.subject}&nbsp;&nbsp;&nbsp;
				  </td>
					<td></td>
					<td nowrap class="onetext" style="padding-right: 5px"></td>
					<td style="word-break: break-all;">
					  <a href="javascript:;" onClick="showSideView();" class="link_board_04">${article.name}</a>
					</td>
					<td></td>
					<td align="center" class="text_gray">${article.hit}</td>
					<td></td>
					<td align="center" class="text_gray">${article.logtime}</td>
				</tr>

				<tr>
					<td bgcolor="#ededed" height="1" colspan="11" style="overflow: hidden; padding: 0px"></td>
				</tr>
			</c:forEach>

			<tr>
				<td class="bg_board_title_02" height="1" colspan="11"
					style="overflow: hidden; padding: 0px"></td>
			</tr>
		</table>
	</form>
	<!-- bbs end -->

	<!-- 하단 페이징 -->
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="3" height="5"></td>
		</tr>
		<tr valign="top">
			<td nowrap><img src="/img/board/btn_write_01.gif"
				class="writeBtn" width="64" height="22" border="0" align="absmiddle" alt="글쓰기"></td>
			<td align="center">
				<!--PAGE--> ${navigator.navigator}
			</td>
			<td nowrap class="stext"><b>${navigator.pageNo}</b> /
				${navigator.totalPageCount} pages</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="3" height="10"></td>
		</tr>
		<tr>
			<td width="50%"></td>
			<td nowrap>
				<select id="skey" name="key" class="inp">
					<option value="subject">글제목
					<option value="name">글쓴이
					<option value="seq">글번호
				</select>
				<span>
				  <input type="text" id="sword" name="word" size="22" class="inp" style="margin-top: -19px;">
				</span>
				<img src="/img/board/sbtn_s.gif" width="32" height="18" border="0" align="absmiddle" alt="검색" id="searchBtn">
			</td>
			<td width="50%" align="right">
			  <a href="#">
			    <img src="/img/board/sbtn_top.gif" width="24" height="11" align="absmiddle" alt="TOP">
			  </a>
			  <br>
			</td>
		</tr>
	</table>
</section>
<%@ include file="../include/footer.jsp" %>
<script src="/js/reboard/list.js" defer="defer"></script>
</body>
</html>