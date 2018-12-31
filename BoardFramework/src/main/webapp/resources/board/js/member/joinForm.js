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
         } break;
     case 'address2':
         if(value){
             confirm.address = true;
             warnRemover(elem);
         } else{
             confirm.address = false;
             const warn = '주소를 입력해주세요.';
             warnRemover(elem);
             warnMaker(elem, warn); 
         } break;
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
    obj.address += ' ' + document.querySelector('#address2').value;
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
}
const postCode = document.querySelector('#postCode');
postCode.addEventListener('click', openZipSearch);
   