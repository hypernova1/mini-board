<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- title -->
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

td{
  width: auto;
}
#subject{
  width: 100rem;
  height: 3rem;
  margin-left: 3rem;
  padding-left: 1rem;
  border-radius: 4px;
}

textarea{
  margin: 3rem;
  margin-top: 1rem;
  padding: 1rem;
  resize: none;
  width: 100rem;
  height: 65rem;
  border-radius: 4px;
}

#title{
  padding-left: 4rem;
  padding-bottom: 2rem;
  font-size: 2rem;
  font-weight: bold;
}

#btn-td{
  padding-left: 50rem;
}
</style>
<section>
<table>
	<tr>
		<td align="right"></td>
	</tr>
	<tr>
		<td colspan="2" height="19"></td>
	</tr>
</table>

<table>
	<tr>
		<td>
	  </td>
		<td id="title">
		  <span>글쓰기</span>
		</td>
	</tr>
</table>

<form id="writeForm" method="post" action="/reboard/write">
	<input type="hidden" name="bcode" value="${bcode}">
	<input type="hidden" name="page" value="1">
	<input type="hidden" name="key" value="">
	<input type="hidden" name="word" value="">
	
	<table>
		<tr>
			<td colspan="5">
			  <input name="subject" id="subject" type="text" value="" placeholder="제목">
				<img src="${root}/img/board/i_info.gif" width="12" eight="11" border="0" align="absmiddle" vspace="8" style="margin: 3 3 0 6">
				<font class="stext">최대 한글 75자, 영문 150자</font><br>
		  </td>
		</tr>
		<tr>
			<th>
			  <textarea name="content"></textarea>
			</th>
		</tr>
		<tr>
		   <td id="btn-td">
	        <button type="button" class="btn btn-success btn-default" id="submitBtn">등록</button>
	        <button type="button" class="btn btn-success btn-default" id="cancelBtn">취소</button>
	    </td>
		</tr>
	</table>
</form>
</section>
<%@ include file="../include/footer.jsp"%>

<script>
function writeArticle(){
  if(document.querySelector('input[name="subject"]').value == ""){
    alert("제목을 입력하세요");
    return;
  }else if(document.querySelector('textarea').value == ""){
    alert("내용을 입력하세요");
    return;
  }else{
    document.querySelector('#writeForm').action = "/reboard/write";
    document.querySelector('#writeForm').submit();
  }
}

document.querySelector('#submitBtn').addEventListener('click', function(){
  writeArticle();
});
document.querySelector('#cancelBtn').addEventListener('click', function(){
  history.back();
});
</script>
</body>
</html>