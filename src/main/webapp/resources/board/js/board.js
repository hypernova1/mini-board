let listpath,
viewpath,
writepath,
replypath,
modifypath,
deletepath;

function initVars(control){
  listpath = control + "/list";
  viewpath = control + "/view";
  writepath = control + "/write";
  replypath = control + "/reply";
  modifypath = control + "/modify";
  deletepath = control + "/delete";
}

function ajax(url, method, obj){
    return $.ajax({
      url: url,
      type: method,
      contentType: 'application/json;charset=utf-8',
      dataType: 'json',
      data: obj,
    })
}
  
document.querySelector('#logout').addEventListener('click', function(){
    ajax('/member/logout','post', {}).success(function(data){
        location.href = "/login";
    })
    
})


class Accordion {
  constructor(options){
    // 기본 옵션과 사용자 옵션을 병합
    this.config = Accordion.mergeConfig(options);
    this.$accordion = document.querySelector(this.config.selector);

    this.init();
    this.$accordion.addEventListener('click', this.toogle.bind(this));
  }

  static mergeConfig(options){
    const config = {
      selector: '#accordion',
      multi: true
    };

    return { ...config, ...options }
  }

  init(){
    // active 클래스가 지정된 li 요소
    const $ActiveSubmenu = this.$accordion.querySelector('.active .submenu');
    
    // active 클래스가 지정된 li 요소를 노출시킴
    if($ActiveSubmenu) $ActiveSubmenu.style.height = $ActiveSubmenu.scollHeight + 'px';
  }

  toogle(event){
    if (!event.target.classList.contains('menu')) return;
    //click 이벤트를 발생시킨 <div class="menu"> 요소의 부모요소인 li 요소
    const $targetItem = event.target.parentNode;

    // 멀티 오픈을 허용하지 않으면 타깃 이외의 모든 submenu를 클로즈한다.
    if (!this.config.multi) {
      [].filter.call(
        this.$accordion.childNodes,
        li => li.nodeType === Node.ELEMENT_NODE && li !== $targetItem && li.classList.contains('active')
      ).forEach(li => {
        li.classList.remove('active');
        li.querySelector('.submenu').style.height = '0';
      });
    }
    // 타깃 li 요소의 active class를 토글한다.
    $targetItem.classList.toggle('active');
    // 타깃 li 요소의 submenu
    const $submenu = $targetItem.querySelector('.submenu');
    // 타깃 li 요소의 submenu를 토글한다.
    $submenu.style.height = $targetItem.classList.contains('active') ? $submenu.scrollHeight + 'px' : '0'; 

  }
}

window.addEventListener('load', function(){
  ajax('/category', 'GET').success(function(data){
    let prevMain = '';
    let render = '';
    for(let i = 0; i < data.length; i++){
      if(prevMain != data[i].cname){
          render += '<li class="active">'
          render += '<div class="menu">' + data[i].cname + '</div>'
          render += '<ul class="submenu">'
      }
      render += '<li><a href="/'+ data[i].control + '/list?bcode=' + data[i].bcode + '&page=1&key=&word=">' + data[i].bname + '</a></li>'
      
      if(i == data.length -1 || data[i].cname != data[i + 1].cname){
        render += '</ul>'
        render += '</div>'
        render += '</li>';
      }
      prevMain = data[i].cname;
    }
    render += '</div>'
    
    document.querySelector('#accordion').innerHTML = render;
    
  })
})

const accordion = new Accordion({multi: false});