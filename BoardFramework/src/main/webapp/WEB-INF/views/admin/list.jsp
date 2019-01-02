<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
#btn-box {
   text-align: center;
}

.delete-btn {
   all: unset;
   cursor: pointer;
   border: 1px solid #adb5bd;
   border-radius: 4px;
   padding: 3px;
}

.delete-btn:hover {
   background: #adb5bd;
   color: white;
   transition: all 0.5s;
}

td {
   font-size: 1.5rem;
   text-align: center;
}
#modal-body {
   display: none;
   position: fixed;
   top: 0%;
   width: 100%;
   height: 100%;
   text-align: center;
   background: rgba(0, 0, 0, 0.6);
}

pagination>.active{
  z-index: 0;
}

#modal-wrapper {
   position: fixed;
   background: white;
   padding: 2em;
   border: 1px solid black;
   border-radius: 5px;
   width: 25%;
   height: 25%;
   left: 50%;
   top: 50%;
   transform: translate(-50%, -50%);
   z-index: 1;
}

#modal-body button {
   margin-top: 2rem;
}

#modal-content {
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   color: black;
}
</style>

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
                           <th class="text-center">관리</th>
                        </tr>
                     </thead>
                     <tbody class="memberList">
                     </tbody>
                  </table>
                  <div class="row">
                     <div class="col-lg-12 text-center">
                        <ul class="pagination"></ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<div id="modal-body">
   <div id="modal-wrapper">
      <div id="modal-content">
         <div>삭제하시겠습니까?</div>
         <button type="button" class="btn btn-primary">확인</button>
         <button id="deleteCancle" type="button" class="btn btn-primary">취소</button>
      </div>
   </div>
</div>

<%@ include file="../include/footer.jsp"%>


<script src="/js/admin/list.js" defer="defer"></script>
</body>
</html>