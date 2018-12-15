
// HIỂN THỊ THÔNG TIN COMMENT
$(' tbody tr').click(function(){
    let id = $(this).attr('data-id');
    $.ajax({
        url: 'http://localhost/rest/API/comment.php/commentinfo',
        method: 'GET',
        data: {id: id}
    }).done((data)=>{
        $('.card-image').attr('src' ,'./public/img/' + data.avatar);
        $('.card-name span').text(data.namecustomer);
        $('.card-movie span').text(data.namemovie);
        $('.card-content span').text(data.content);
    })
})

//XÓA COMMENT 
$('.tableComment .delete').click(function(){
    let id = $(this).parents('tr').attr('data-id');
    $.ajax({
        url: 'http://localhost/rest/API/comment.php/delete',
        method: 'GET',
        data: {id: id}
    }).done((data)=>{
        $(this).parents('tr').remove();
    })
})
