<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
section {
width: 85%;
margin-right: 3%;
float:right;
}

table{
width: 100%;
margin: auto;
}
p{
min-height: 300px;
text-align: left;
padding: 2rem;
}
#text-td{
text-align: center;
}
#modify-td{
text-align: right;
}
textarea{
  border-radius: 4px;
  padding: 4px;
  margin-bottom: 1.5rem;
}
tr div{
text-align: center;
}
button, .btn1{
  all: unset;
  cursor: pointer;
  padding: 3px;
  border: 1px solid #b2bec3;
  border-radius: 4px;
  background: #dfe6e9;
}

.btn2 {
  cursor: pointer;
}

#modal-body{
    display: none;
    position: fixed;
    top: 0%;
    width: 100%;
    height: 100%;
    text-align: center;
    background:rgba(0, 0, 0, 0.6)

}
#modal-wrapper {
    position: fixed;
    background: white;
    padding: 2em;
    border: 1px solid black;
    border-radius: 5px;
    width: 20%;
    height: 18%;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    z-index: 1;
}

#modal-body button {
  margin-top: 2rem;
}

#modal-content{
    font-size: 1.5rem;
    font-weight: bold;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: black;
}
#modal-content>div{
font-size: 1.5rem;
font-weight: bold;
    }
</style>
<c:if test="${article eq null}">
<script>
alert('잘못된 접근');
</script>
</c:if>
<c:if test="${article ne null}">
<section>
<form name="bbsForm" id="bbsbbs" method="post">
	<table>
			<tr>
				<td>
				  <label class="newPage">최신목록</label>
				  <font color="#c5c5c5">|</font>
				  <label class="movePage">목록</label>
				  <font color="#c5c5c5">|</font>
				  <a href="javascript:goBbsRead();">
				    <img src="/img/board/icon_up.gif" border="0" align="absmiddle" hspace="3">윗글
				  </a>
				  <font color="#c5c5c5">|</font>
				  <a href="javascript:goBbsRead();">아랫글
				    <img src="/img/board/icon_down.gif" border="0" align="absmiddle" hspace="3">
				  </a>
			  </td>
        <td id="modify-td">
          <c:if test="${sessionScope.mid eq article.id}">
            <img src="/img/board/btn_modify.gif" class="modifyBtn btn2" border="0" align="absmiddle" alt="글수정">
            <img src="/img/board/btn_delete.gif" class="deleteBtn btn2" border="0" align="absmiddle" alt="글삭제">
          </c:if>
        </td>
			</tr>
			<tr>
				<td></td>
			</tr>
	</table>
</form>
	<table>
		<tr>
			<td class="bg_board_title_02" colspan="2" height="2" style="overflow: hidden; padding: 0px"></td>
		</tr>
		<tr height="28">
			<td class="bg_board_title" colspan="2" style="padding-left: 14px">
				<b><font class="text"> ${article.subject} </font></b>
			</td>
		</tr>
		<tr>
			<td class="bg_board_title_02" colspan="2" height="1" style="overflow: hidden; padding: 0px"></td>
		</tr>
		<tr height="26">
			<td width="70%"><font class="stext">번호:</font>
				<font class="text_commentnum">${article.seq}</font> &nbsp;
				<font class="stext">글쓴이 :</font>
				<a href="javascript:;" onClick="showSideView();" class="link_board_02">${article.name}</a>
				<br>
			</td>
			<td style="padding-right: 14px" nowrap class="stext">조회 :
		    <font class="text_commentnum">${article.hit}</font> &nbsp; 스크랩 :
		    <font class="text_commentnum">0</font> &nbsp; 날짜 :
		    <font class="text_commentnum">${article.logtime}</font>
			</td>
		</tr>
		<tr>
			<td class="bg_board_title_02" colspan="2" height="1" style="overflow: hidden; padding: 0px"></td>
		</tr>
	</table>

	<table>
		<tr valign="top">
			<td>
				<div><p>${article.content}</p></div>
			</td>
			<td nowrap valign="top" align="right" style="padding-left: 0px">
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<td class="bg_board_title_02" height="1"
				style="overflow: hidden; padding: 0px"></td>
		</tr>
	</table>

	<!-- 하단 페이징 -->
	<table>
		<tr>
			<td colspan="3" height="5" style="padding: 0px"></td>
		</tr>
		<tr valign="top">
			<td align="right" nowrap>
			  <label class="newPage">최신목록</label>
			  <font color="#c5c5c5">|</font>
			  <label class="movePage">목록</label>
			  <font color="#c5c5c5">|</font>
			  <img src="${root}/img/board/icon_up.gif" border="0" align="absmiddle" hspace="3">윗글 
			  <font color="#c5c5c5">|</font>
			  <a href="javascript:goBbsRead();">아랫글
			    <img src="${root}/img/board/icon_down.gif" border="0" align="absmiddle" hspace="3">
			  </a>
			</td>
		</tr>
	</table>
	<br>
	<table>
		<tr>
			<td id="text-td" colspan="4"><textarea id="mcontent" style="resize: none;" rows="3" cols="200"></textarea>
				<button type="button" id="memoBtn">작성</button>
		  </td>
		</tr>
		<tbody id="memoview"></tbody>
	</table>
</section>
  <div id="modal-body">
     <div id="modal-wrapper">
         <div id="modal-content">
          <div>삭제하시겠습니까?</div>
          <button type="button" class="btn btn-primary" id="submit">확인</button>
          <button type="button" class="btn btn-primary" id="cancel">취소</button>
         </div>
     </div>
  </div>
</c:if>
<%@ include file="../include/footer.jsp"%>
<script src="/js/reboard/view.js" defer="defer"></script>
</body>
</html>