function ajax(url, method, obj){
    return $.ajax({
      url: url,
      type: method,
      contentType: 'application/json;charset=utf-8',
      dataType: 'json',
      data: JSON.stringify(obj),
    });
}

window.addEventListener('load', getMemberList());

function getMemberList(keyword, page) {
  var searchKeyword = keyword;
  var listPage = page;

  if (!page) {
    var listPage = "1";
  }

  if (!searchKeyword) {
    searchKeyword = 'none/';
  } else{
    searchKeyword = searchKeyword + "/";
  }

  $.getJSON("/manage/" + searchKeyword + listPage, function (data) {
	var memberId = $("#logout").attr("data-mid");
    var searchKeyword = $("#searchKeyword").val();
    str = "";
    $(data.list).each(function () {
    	if(memberId != this.mid){    		
    		str += "<tr>";
    		str += "  <td class='text-center'>" + this.mno + "</td>";
    		str += "  <td>" + this.mid + "</td>";
    		str += "  <td><a href=''>" + this.mname + "</a></td>";
    		str += "  <td>" + this.phone + "</td>";
    		str += "  <td>" + this.regdate + "</td>";
    		str += "  <td id='btn-box'>"
    		str += "    <button type='button' class='delete-btn'>삭제</button>"
    		str += "  </td>"
    		str += "</tr>";
    	}
    });

    if ($(data.list).length == 0) {
      str += "<tr>";
      str += "  <td colspan='5' class='text-center'>가입한 회원이 없습니다.</td>";
      str += "</tr>";
    }

    $(".memberList").html(str);
    memberListPaging(data.pm);
    
    $('.delete-btn').on('click', function({target}){
        let mno = $(this).parents('tr').children().first().text();
        const modal = $('#modal-body')
        modal.css('display', 'block');
        $('.pagination>.active').css('z-index', '0');
        $('#modal-body button').click(function({target}){
        	
        	if($(this).attr("id") == 'deleteCancle'){
        		modal.css('display', 'none');
        		return false;
        	}
        	
            ajax('manage', 'DELETE', {
                mno: mno,
            }).success(function(data){
                if(data){
                    modal.css('display', 'none');
                    getMemberList(keyword, page);
                }
            });
        })
        
    })
  });
}

/* memberList 페이징 */
function memberListPaging(pm) {
  var str = "";
  if (pm.prev) {
    str += "<li><a href = '" + (pm.startPage - 1) + "'> << </a></li>";
  }
  for (var i = pm.startPage, len = pm.endPage; i < len + 1; i++) {
    if (pm.cri.page == i) {
      str += "<li class='active'><a class='btn btn-xs btn-secondary' href='"+i+"'>" + i + "</a></li>";
    } else {
      str += "<li><a class='btn-xs btn btn-secondary' href='"+i+"'>" + i + "</a></li>";
    }
  }
  if (pm.next) {
    str += "<li><a href = '" + (pm.endpage + 1) + "'> >> </a></li>";
  }
   $('.pagination').html(str);
};

$(".pagination").on("click", "li a", function (e) {
    e.preventDefault();
    var searchKeyword = $("#searchKeyword").val();
    if (!searchKeyword) {
      searchKeyword = 'none/';
    }
    var page = $(e.target).text(); // page number
    getMemberList(searchKeyword, page);
});

$("#memberSearchBtn").click(function () {
  var searchKeyword = $("#searchKeyword").val();
  if (!searchKeyword) {
    searchKeyword = "";
  }
  getMemberList(searchKeyword);
});