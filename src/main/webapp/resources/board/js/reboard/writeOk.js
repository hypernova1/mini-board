initVars("/reboard");
$('#viewBtn').click(function(){
    $('#seq').val($("#wseq").val());   
    $('#commonForm').attr('method', 'get').attr('action', viewpath).submit();
});

$('#listBtn').click(function(){
    $('#commonForm').attr('method', 'get').attr('action', listpath).submit();
});