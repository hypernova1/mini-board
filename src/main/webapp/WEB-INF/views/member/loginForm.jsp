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
<style type="text/css">
body {
	padding-top: 100px;
	padding-bottom: 40px;
	background-color: #ecf0f1;
}

.login-header {
	max-width: 400px;
	padding: 15px 29px 25px;
	margin: 0 auto;
	background-color: #2c3e50;
	color: white;
	text-align: center;
	-webkit-border-radius: 15px 15px 0px 0px;
	-moz-border-radius: 15px 15px 0px 0px;
	border-radius: 15px 15px 0px 0px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.login-footer {
	max-width: 400px;
	margin: 0 auto 20px;
	padding-left: 10px;
}

.form-signin {
	max-width: 400px;
	padding: 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	-webkit-border-radius: 0px 0px 15px 15px;
	-moz-border-radius: 0px 0px 15px 15px;
	border-radius: 0px 0px 15px 15px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 15px;
}

.form-signin input[type="text"], .form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

.form-btn {
	text-align: center;
	padding-top: 20px;
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
</style>
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container">

		<!-- header -->
		<div class="login-header">
			<h2 class="form-signin-heading">BitCamp</h2>
		</div>

		<!-- form -->
		<form class="form-signin" action="./list.html">
			<input type="text" class="form-control" id="inputEmail" placeholder="아이디">
			<input type="password" class="form-control" id="inputPassword" placeholder="비밀번호">

			<div class="row form-btn">
				<button type="button" class="btn btn-large btn-warning" id="loginBtn">로그인</button>
				<a href="/join" class="btn btn-large btn-default">회원가입</a>
			</div>
		</form>
	</div>
	
  <div id="modal-body">
    <div id="modal-wrapper">
        <div id="modal-content">
          <div>정확하지 않은 정보입니다.</div>
          <button type="button" class="btn btn-primary">확인</button>
        </div>
    </div>
   </div>

	<script src="js/jquery-2.1.0.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootswatch.js"></script>
	<script>
	const btn = document.querySelector("#loginBtn");
	const idInput = document.querySelector('#inputEmail');
	const pwdInput = document.querySelector("#inputPassword");
	
	document.querySelector('.form-signin').addEventListener('keyup', function(){
	  if(idInput.value == '' || pwdInput.value == ''){
	      btn.disabled = true;
	  } else {
	      btn.disabled = false;
	  }
	})
	
	document.querySelector('#modal-content>button').addEventListener('click', function(){
	    document.querySelector('#modal-body').style.display = 'none';
	})
	
  btn.addEventListener('click', function () {

      const mid = idInput.value;
      const mpassword = pwdInput.value;

      if (mid != "" && mpassword != "") {
          $.ajax({
              url : '/member/login',
              type : 'POST',
              data : {
                  mid : mid,
                  mpassword : mpassword
              },
              success : function (data) {
                  if (data) {
                     location.href = '/mypage';
                  } else {
                     document.querySelector('#modal-body').style.display = "block";
                  }
              }

          })
      }
  });
    </script>

</body>
</html>