window.addEventListener('load', getMemberList());

function getMemberList(keyword, page) {
  var searchKeyword = keyword;
  var listPage = page;

  if (!page) {
    var listPage = "1";
  }

  if (!searchKeyword || searchKeyword== "") {
    searchKeyword = 'none/';
  } else{
    searchKeyword = searchKeyword + "/";
  }

  $.getJSON("/manage/" + searchKeyword + listPage, function (data) {
    var searchKeyword = $("#searchKeyword").val();
    str = "";
    $(data.list).each(function () {
      str += "<tr>";
      str += "  <td class='text-center'>" + this.mno + "</td>";
      str += "  <td>" + this.mid + "</td>";
      str += "  <td><a href=''>" + this.mname + "</a></td>";
      str += "  <td>" + this.phone + "</td>";
      str += "  <td>" + this.regdate + "</td>";
      str += "</tr>";
    });

    if ($(data.list).length == 0) {
      str += "<tr>";
      str += "  <td colspan='5' class='text-center'>가입한 회원이 없습니다.</td>";
      str += "</tr>";
    }

    $(".memberList").html(str);
    memberListPaging(data.pm);
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
    str += "<li><a href = '" + (pm.endPage + 1) + "'> >> </a></li>";
  }
   $('.pagination').html(str);
};

$(".pagination").on("click", "li a", function (e) {
    e.preventDefault();
    var searchKeyword = $("#searchKeyword").val();
    if (!searchKeyword) {
      searchKeyword = 'none';
    }
    var page = $(e.target).attr("href"); // page number
    getMemberList(searchKeyword, page);
});

$("#memberSearchBtn").click(function () {
  var searchKeyword = $("#searchKeyword").val();
  if (!searchKeyword) {
    searchKeyword = "";
  }
  getMemberList(searchKeyword);
});
