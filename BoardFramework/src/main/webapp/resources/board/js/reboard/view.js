initVars("/reboard");

(function(){
  $.ajax({
    url: '/comment/' + $('#seq').val(),
    type: 'GET',
    contentType: 'application/json;charset=utf-8',
    dataType: 'json',
    success: function(data){
      makeList(data);
    }
   })
})();

$('.newPage').click(function(){
    $('#page').val(1);
    $('#key').val("");
    $('#word').val("");
  $('#commonForm').attr('method', 'get').attr('action', listpath).submit();
});

$('.movePage').click(function(){
  $('#commonForm').attr('method', 'get').attr('action', listpath).submit();
});

$('.modifyBtn').click(function(){
  $('#commonForm').attr('method', 'get').attr('action', modifypath).submit();
})

$('.deleteBtn').click(function(){
  $('#commonForm').attr('method', 'post').attr('action', deletepath).submit();
})


$(".posting").click(function(){
  //alert($(this).children().first().text());
  $('#seq').val($(this).children().first().text());
  $('#commonForm').attr('method', 'get').attr('action', viewpath).submit();
});

$('.replyBtn').click(function(){
  $('#commonForm').attr('method', 'get').attr('action', replypath).submit();
});

$(document).on('click', '.viewMemoModifyBtn', function() {
  const mseq = $(this).parent('td').attr('memo-mseq');
  $('#div' + mseq).css('display', '');
})

$(document).on('click', '.memoDeleteBtn', function() {
  const mseq = $(this).parent('td').attr('memo-mseq');
  if(confirm('삭제??')){
        const mseq = $(this).parent('td').attr('memo-mseq');
        $.ajax({
       url: '/comment/' + mseq + "/" + $('#seq').val(),
       type: 'DELETE',
       contentType: 'application/json;charset=utf-8',
       dataType: 'json',
       success: function(data){
         makeList(data);
       }
     });
  }
})

$(document).on('click', '.memoCancelBtn', function() {
  const mseq = $(this).parents('td').attr('memo-mseq');
  console.log(mseq);
  $('#div' + mseq).css('display', 'none');
})

$(document).on('click', '.memoModifyBtn', function() {
  const seq = $('#seq').val();
  const mseq = $(this).parents('td').attr('memo-mseq');
  $('#div' + mseq).css('display', 'none');
  const mcontent = $('#mcontent'+mseq).val();
  
  const param = {
          seq: seq,
          mseq: mseq,
          mcontent: mcontent
          };
  
  if(mcontent.trim().length != 0){
    $.ajax({
      url: '/comment/',
      type: 'PUT',
      contentType: 'application/json;charset=utf-8',
      dataType: 'json',
      data: JSON.stringify(param),
      success: function(data){
        makeList(data);
      }
    })
  }
})

$("#memoBtn").click(function(){
    const seq = $('#seq').val();
    const mcontent = $("#mcontent").val();
    $('#mcontent').val("");
    const param = JSON.stringify({seq: seq, mcontent: mcontent});
    
    if(mcontent.trim().length != 0){
        $.ajax({
            url: '/comment',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: param,
            success: function(data){
                makeList(data);
            }
        })
    }
});

function makeList(memos){
   $('#memoview').empty();
   let output = '';
   const memolist = memos.memolist;
   memolist.forEach((memo, i) => {
     output += `<tr>
                 <td width='150' height='70'>`+memo.name+`</td>
                 <td>` + memo.mcontent + `</td>
                 <td width='200'>` + memo.mtime + `</td>`
     
     if(memo.id == $('#mid').val()){
       output +=
       `<td width='120' memo-mseq='` + memo.mseq + `'>
          <label class='viewMemoModifyBtn btn1'>수정</label>
          <label class='memoDeleteBtn btn1'>삭제</label>
        </td>
        </tr>
        <tr>
          <td colspan='4' memo-mseq='` + memo.mseq + `'>
            <div id='div` + memo.mseq + `' style="display:none">
              <textarea id='mcontent` + memo.mseq + `' style='resize: none;' rows='3' cols='200'>` + memo.mcontent + `</textarea>
              <button class='memoModifyBtn'>수정</button>
              <button class='memoCancelBtn'>취소</button>
            </div>
          </tr>
        </tr>`
     }
     output += `</tr>
                <tr>
                 <td class='bg_board_title_02' height='2' colspan='11'
                   style='overflow: hidden; padding: 0px'>
                 </td>
                </tr>`
   });
   $('#memoview').append(output);
 }