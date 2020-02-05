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

(function(){
    if('${member.gender}' == 'female'){
       document.querySelector("#optionsRadios2").checked = 'checked';
    }
})();



 const confirm = {
            name: true,
            birth: true,
            phone: true,
            address: true
 }
 
 const obj = {
         mname: document.querySelector('input[name="mid"]').value,
         birthday: document.querySelector('input[name="birthday"]').value,
         manem: document.querySelector('input[name="mname"]').value,
         gender: document.querySelector('input[name="gender"]:checked').value,
         phone: document.querySelector('input[name="phone"]').value,
         zipcode: document.querySelector('input[name="zipcode"]').value,
         address: document.querySelector('input[name="address"]').value
 }
 
document.querySelector('.col-lg-12').addEventListener('keyup', function({target}){
    let nameValue = target.name;
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
    
    switch(nameValue){
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
     ajax('/modify', 'PUT', obj).success(function(data){
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
      document.querySelector('input[name="zipcode"]').value = code; 
      document.querySelector('input[name="address"]').value = address;
      obj.zipcode = code;
      obj.address = address;
    }
 }).open();
 confirm.address = true;
}
  const postCode = document.querySelector('input[name="zipcode"');
  postCode.addEventListener('click', openZipSearch);