<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!-- Container ======================================================================================= -->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<!-- ★★★ Tab Panel -->
			<div id="communityList" class="tab-content">
				<!-- ★★★ 가입 커뮤니티 -->
				<div class="tab-pane fade active in" id="joined">
					<div class="page-header">
						<h2 id="container">회원목록</h2>
					</div>

					<div class="panel panel-default">
						<div class="panel-body">
							<div class="input-group">
								<input id="searchKeyword" type="text" class="form-control"
									placeholder="회원명 또는 ID"> <span class="input-group-btn">
									<button id="memberSearchBtn" type="button"
										class="btn btn-primary">검색</button>
								</span>
							</div>
						</div>
					</div>

					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">번호</th>
									<th class="text-center">ID</th>
									<th class="text-center">회원명</th>
									<th class="text-center">전화번호</th>
									<th class="text-center">가입일</th>
								</tr>
							</thead>
							<tbody class="memberList">


							</tbody>

						</table>

						<div class="row">
							<div class="col-lg-12 text-center">
								<ul class="pagination">

								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Footer ========================================================================================== -->
<%@ include file="../include/footer.jsp"%>


<script src="/js/admin/list.js" defer="defer"></script>
</body>
</html>