<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/header.jsp"%>

	<div class="container">
		<div class="row">

			<!-- ★★★ Contents -->
			<div class="col-lg-12">
				<div class="page-header2">
					<h3>회원정보</h3>
				</div>


				<div class="table-responsive">
					<table class="table table-bordered">
						<colgroup>
							<col width="120">
							<col width="*">
							<col width="120">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center">ID</th>
								<td class="text-left">${member.mid}</td>
								<th class="text-center">회원명</th>
								<td class="text-left">${member.mname}</td>
							</tr>
							<tr>
								<th class="text-center">생년월일</th>
								<td class="text-left">${member.birthday}</td>
								<th class="text-center">성별</th>
								<td class="text-left">${member.gender}</td>
							</tr>
							<tr>
								<th class="text-center">전화번호</th>
								<td class="text-left">${member.phone}</td>
								<th class="text-center">주소</th>
								<td class="text-left">${member.address}</td>
							</tr>
						</tbody>
					</table>
				</div>


				<div class="pull-right">
					<!--button class="btn btn-success">수정</button-->
					<a href="/modify" class="btn btn-success btn-default">수정</a>
					<c:if test="${member.mid eq 'admin'}">
					<!-- <a href="#" class="btn btn-large btn-default">삭제</a> -->
  					<a href="/manage" class="btn btn-large btn-default">목록</a>
					</c:if>
				</div>

			</div>
		</div>

		<%@ include file="../include/footer.jsp"%>
	</div>

	<script src="/js/jquery-2.1.0.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bootswatch.js"></script>
</body>
</html>