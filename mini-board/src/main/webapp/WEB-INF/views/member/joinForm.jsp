<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BitCamp</title>
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/bootswatch.min.css" rel="stylesheet">
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
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
	<!-- Main Navigation ========================================================================================== -->
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">BitCamp</a>
			</div>
		</div>
	</div>

	<!-- Container ======================================================================================= -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">

				<div class="page-header">
					<h2 id="container">회원 가입하기</h2>
				</div>

				<div class="well">
					<p>회원가입을 위해 아래 내용들을 작성해 주세요.</p>
					<form method="get" action="" class="form-horizontal">
						<fieldset>
							<div class="form-group">
								<label class="col-lg-2 control-label">아이디</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" name="id" id="id" placeholder="아이디">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">이름</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" name="name" id="name" placeholder="이름">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">비밀번호</label>

								<div class="col-lg-10">
									<input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">비밀번호 확인</label>

								<div class="col-lg-10">
									<input type="password" class="form-control" id="rePwd" placeholder="비밀번호 확인">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">생년월일</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" name="birth" id="birth" placeholder="생년월일">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">성별</label>

								<div class="col-lg-10">
									<div class="radio">
										<label>
										  <input type="radio" name="gender" id="optionsRadios1" value="male" checked="checked"> 남자
										</label>
									</div>
									<div class="radio">
										<label> 
										  <input type="radio" name="gender" id="optionsRadios2" value="female"> 여자
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">전화번호</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" name="phone" id="phone" placeholder="전화번호">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">우편번호</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" name="postCode" id="postCode" placeholder="우편번호" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">주소</label>

								<div class="col-lg-10">
									<input type="text" class="form-control" name="address" id="address" placeholder="주소">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="button" class="btn btn-primary" disabled="disabled">확인</button>
									<a href="/login" class="btn btn-large btn-default">취소</a>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>

		</div>

		<!-- Footer ========================================================================================== -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<ul class="list-unstyled">
						<li class="pull-right"><a href="#top">위로 이동</a></li>
						<li><a href="#">커뮤니티 홈</a></li>
						<li><a href="#">RSS</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">도움말</a></li>
						<li><a href="#">회원탈퇴</a></li>
					</ul>
					<p>© BitCamp 2018.</p>
				</div>
			</div>
		</footer>
	</div>
  <div id="modal-body">
     <div id="modal-wrapper">
         <div id="modal-content">
          <div>가입이 완료되었습니다.</div>
          <button type="button" class="btn btn-primary">확인</button>
         </div>
     </div>
   </div>

<script src="./js/jquery-2.1.0.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/bootswatch.js"></script>
<script>
const submit = document.querySelector('.btn.btn-primary');
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
            id: 'regExp',
            name: 'regExp',
            pwd: 'regExp',
            rePwd: 'regExp',
            birth: 'regExp',
            phone: 'regExp',
            address: 'regExp'
 }
 
 const obj = {
         mid: null,
         mname: null,
         mpassword: null,
         birthday: null,
         gender: null,
         phone: null,
         zipcode: null,
         address: null
 }
 
     
document.querySelector('.well').addEventListener('keyup', function(e){
   let idValue = e.target.getAttribute('id');
   let elem = e.target;
   let value = e.target.value;
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
     case 'id':
       let warn = '';
       if(regExp.id.test(value)){
         ajax('/member/idCheck', 'POST', { mid: value }).success(function(data){
             if(!data){
                 obj.mid = value;
                 confirm.id = true;
                 warnRemover(elem);
             } else {
                 if(confirm.id != false){
                   warn = '이미 존재하는 아이디입니다.';
                   warnMaker(elem, warn);
                 }
                 confirm.id = false;
             }
         });
      } else {
          confirm.id = false;
          warn = '아이디는 4~12 자리입니다.';
          warnRemover(elem);
          warnMaker(elem, warn);
      }
       break;
     case 'name':
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
     case 'pwd':
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
         break;
     case 'birth':
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
         if(!isNaN(value)){
             obj.phone = value;
             confirm.phone = true;
             warnRemover(elem);
         } else {
             confirm.phone = false;
             const warn = '전화번호는 숫자로 이루어져야 합니다.';
             warnRemover(elem);
             warnMaker(elem, warn); 
         }
   }
   
   const form = document.querySelector('.form-horizontal');
   for(let key in confirm){
       if(confirm[key] != true){
           submit.disabled = true;
           form.method = 'get';
           form.action = '#';
           return;
       } else{
        submit.disabled = false;
        form.method = 'post';
        form.action = '/member/login';
       }
   }

})

submit.addEventListener('click', function(){
    obj.gender = document.querySelector('input[name="gender"]:checked').value;
    ajax('/member/join', 'POST', obj).success(function(data){
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
         document.querySelector('#postCode').value = code; 
         document.querySelector('#address').value = address;
         obj.zipcode = code;
         obj.address = address;
       }
     }).open();
     confirm.address = true;
   }
  const postCode = document.querySelector('#postCode');
	postCode.addEventListener('click', openZipSearch);
   
</script>
</body>
</html>