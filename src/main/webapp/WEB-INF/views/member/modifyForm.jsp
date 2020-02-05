<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BitCamp</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootswatch.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<style>
input{
max-width: 450px
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
    width: 25%;
    height: 25%;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    z-index: 1;
}

input{
}
#modal-body button {
  margin-top: 2rem;
}

#modal-content{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: black;
}
#close {
    position: absolute;
    right: 5%;
    cursor: pointer;
}

#postCode {
  cursor: pointer;
}

</style>
<body>
<%@ include file="../include/header.jsp"%>


<!-- Container ======================================================================================= -->
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
                        <td class="text-left">
                          <input type="text" class="form-control" name="mid"placeholder="아이디" value="${member.mid}" readonly="readonly">
                        </td>
                        <th class="text-center">회원명</th>
                        <td class="text-left">
                          <input type="text" class="form-control" name="mname" placeholder="이름" value="${member.mname}">
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">생년월일</th>
                        <td class="text-left">                        
                          <input type="text" class="form-control" name="birthday" placeholder="생년월일 (ex. 1990-00-00)" value="${member.birthday}">                        
                        </td>
                        <th class="text-center">성별</th>
                        <td class="text-left">
                          <div class="radio">
                              <label>
                                  <input type="radio" name="gender" id="optionsRadios1" value="male" checked="">남자
                              </label>
                          </div>
                          <div class="radio">
                              <label>
                                  <input type="radio" name="gender" id="optionsRadios2" value="female">여자
                              </label>
                          </div>                          
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">전화번호</th>
                        <td class="text-left">
                          <input type="text" class="form-control" name="phone" placeholder="전화번호" value="${member.phone}">  
                        </td>
                        <th class="text-center">주소</th>
                        <td class="text-left">
                          <input type="text" class="form-control" name="zipcode" placeholder="우편번호" value="${member.zipcode}"> 
                          <input type="text" class="form-control" name="address" placeholder="주소" value="${member.address}"> 
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            
            <div class="pull-right">
                <button type="button" class="btn btn-success btn-default">저장</button>
            </div>

        </div>
      </div>

<!-- Footer ========================================================================================== -->
<%@ include file="../include/footer.jsp"  %>
</div>

<div id="modal-body">
   <div id="modal-wrapper">
       <div id="modal-content">
        <div>수정이 완료되었습니다.</div>
        <button type="button" class="btn btn-primary">확인</button>
       </div>
   </div>
 </div>
<script src="/js/jquery-2.1.0.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/bootswatch.js"></script>
</body>
<script src="/js/member/modifyForm.js" defer="defer"></script>
</html>