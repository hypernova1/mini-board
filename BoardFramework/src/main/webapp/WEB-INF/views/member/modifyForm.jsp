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
                          <input type="text" class="form-control" placeholder="아이디" value="${member.mid}" readonly="readonly">
                        </td>
                        <th class="text-center">회원명</th>
                        <td class="text-left">
                          <input type="text" class="form-control" id="mname" placeholder="이름" value="${member.mname}">
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">생년월일</th>
                        <td class="text-left">                        
                          <input type="text" class="form-control" id="birthday"placeholder="생년월일 (ex. 1990-00-00)" value="${member.birthday}">                        
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
                          <input type="text" class="form-control" id="phone" placeholder="전화번호" value="${member.phone}">  
                        </td>
                        <th class="text-center">주소</th>
                        <td class="text-left">
                          <input type="text" class="form-control" id="zipcode" placeholder="우편번호" value="${member.zipcode}"> 
                          <input type="text" class="form-control" id="address" placeholder="주소" value="${member.address}"> 
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            
            <div class="pull-right">
                <button type="button" class="btn btn-success btn-default">저장</button>
                <c:if test="${member.mid eq 'admin'}">
                  <a href="./list.html" class="btn btn-large btn-default">목록</a>
                </c:if>
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


<script src="js/jquery-2.1.0.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootswatch.js"></script>
<script>
(function(){
    if('${member.gender}' == 'female'){
       document.querySelector("#optionsRadios2").checked = 'checked';
    }
})()
</script>
<script>
const submit = document.querySelector('.btn-success');
function ajax(url, method, obj){
   return $.ajax({
     url: url,
     type: method,
     contentType: 'application/json;charset=utf-8',
     dataType: 'json',
     data: JSON.stringify(obj),
   })
 }

 const confirm = {
            name: true,
            birth: true,
            phone: true,
            address: true
 }
 
 const obj = {
         mname: '${member.mname}',
         birthday: '${member.birthday}',
         gender: '${member.gender}',
         phone: '${member.phone}',
         zipcode: '${member.zipcode}',
         address: '${member.address}'
 }
 
document.querySelector('.col-lg-12').addEventListener('keyup', function({target}){
    let idValue = target.id;
    let elem = target;
    let value = target.value;
    const regExp = {
            id: /^[a-z0-9_]{4,12}$/,
            name: /^[가-힣]{2,4}$/,
            pwd: /^[a-zA-Z0-9]{8,16}$/,
            birth: /^[1-2]{1}[0-9]{3}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}$/,
            phone: /(\d{3}).*(\d{3}).*(\d{4})/
    }
    
    function warnRemover(elem){
        if(elem.parentElement.children[0].className == 'warn'){
          elem.parentElement.children[0].remove();
        }
        elem.style.borderColor = 'blue';
    }
    
    function warnMaker(elem, warn) {
        const span = document.createElement('span');
        span.className = 'warn';
        span.append(warn);
        elem.parentElement.prepend(span);
        elem.style.borderColor = 'red';
    }
    
    switch(idValue){
      case 'mname':
          if(regExp.name.test(value)){
              obj.mname = value;
              warnRemover(elem);
              confirm.name = true;
          } else {
              const warn = '이름형식이 맞지 않습니다.'
              warnRemover(elem);
              warnMaker(elem, warn);
              confirm.name = false;
          }
          break;
      /* case 'pwd':
          if(regExp.pwd.test(value)) {
              obj.mpassword = value;
              warnRemover(elem);
              confirm.pwd = true;
          } else {
              const warn = '비밀번호는 영문, 숫자 조합 8~16자리 입니다.';
              warnRemover(elem);
              warnMaker(elem, warn);
              confirm.pwd = false;
          }
          break;
      case 'rePwd':
          if(document.querySelector('#pwd').value == value){
              confirm.rePwd = true;
              warnRemover(elem);
          } else {
              confirm.rePwd = false;
              const warn = '비밀번호가 일치하지 않습니다.';
              warnRemover(elem);
              warnMaker(elem, warn);
          }
          break; */
      case 'birthday':
          if(regExp.birth.test(value)){
              obj.birthday = value;
              confirm.birth = true;
              warnRemover(elem);
          } else {
              confirm.birth = false;
              const warn = '날짜 형식은 0000-00-00입니다.';
              warnRemover(elem);
              warnMaker(elem, warn);
          }
          break;
      case 'phone':
          if(!isNaN(value) && value != ''){
              obj.phone = value;
              confirm.phone = true;
              warnRemover(elem);
          } else {
              confirm.phone = false;
              const warn = '전화번호는 숫자로 이루어져야 합니다.';
              warnRemover(elem);
              warnMaker(elem, warn); 
          }
          break;
      case 'address':
          obj.address = value;
    }
    
    for(let key in confirm){
        if(confirm[key] != true){
            submit.disabled = true;
            return;
        } else{
         submit.disabled = false;
        }
    }

 });

 submit.addEventListener('click', function(){
     obj.gender = document.querySelector('input[name="gender"]:checked').value;
     ajax('/member/modify', 'PUT', obj).success(function(data){
         if(data){
          document.querySelector('#modal-body').style.display = "block";
         }
     });
  });
  
  const modalBtn = document.querySelector('#modal-body button');
  modalBtn.addEventListener('click', function(){
      location.href = './login';
  })

</script>
<script>
function openZipSearch() {
     new daum.Postcode({
       oncomplete: function(data) {
         let code = data.zonecode;
         let address = data.address + ' ' + data.buildingName;
         document.querySelector('#zipcode').value = code; 
         document.querySelector('#address').value = address;
         obj.zipcode = code;
         obj.address = address;
       }
     }).open();
     confirm.address = true;
   }
  const postCode = document.querySelector('#zipcode');
  postCode.addEventListener('click', openZipSearch);
</script>
</body>
</html>