initVars("/reboard");

$('.writeBtn').click(function(){
    $('#commonForm').attr('method', 'get').attr('action', writepath).submit();
});

$(".posting").click(function(){
    //alert($(this).children().first().text());
    $('#seq').val($(this).children().first().text());
    $('#commonForm').attr('method', 'get').attr('action', viewpath).submit();
});

$('.firstPage').click(function(){
    $('#page').val("1");
    $('#key').val("");
    $('#word').val("");
      $('#commonForm').attr('method', 'get').attr('action', listpath).submit();
});
    
$('.movepage').click(function(){
      $('#page').val($(this).attr("move-page-no"));
      $('#commonForm').attr('method', 'get').attr('action', listpath).submit();
    });
    
$('#searchBtn').click(function(){
      $('#page').val("1");
      $('#key').val($("#skey").val());
      $('#word').val($("#sword").val());
    $('#commonForm').attr('method', 'get').attr('action', listpath).submit();
});

/*$('#myBtn').click(function(){
     //alert(encodeURI('aaa')); // 자바스크립트로 데이터를 보낼 때는 인코딩을 해서 넘겨야함(빌어먹을 IE)
      $('#page').val("1");
      $('#key').val($("id"));
      $('#word').val($('#mno').val());
    $('#commonForm').attr('method', 'get').attr('action', listpath).submit();
});*/
