$('.tableUser tbody tr').click(function(){
    let id = $(this).attr('data-id');
    console.log($(this));
    $.ajax({
        url: 'http://localhost/rest/API/customer.php/customerByid',
        method: 'GET',
        data: {id: id}
    }).done((data)=>{
        let strRole = data.role == 1 ? 'Admin' : 'User';
        $('.card-image').attr('src' ,'./public/img/' + data.avatar);
        $('.card-name span').text(data.name);
        $('.card-role span').text(strRole);
        $('.card-email span').text(data.email);
        $('.card-number span').text(data.number);
        $('.card-date span').text(data.date);
    })
})

$('.tableUser tbody tr').click(function(){
    let id = $(this).attr('data-id');
    console.log($(this));
    $.ajax({
        url: 'http://localhost/rest/API/customer.php/customerByid',
        method: 'GET',
        data: {id: id}
    }).done((data)=>{
        let strRole = data.role == 1 ? 'Admin' : 'User';
        $('.card-image').attr('src' ,'./public/img/' + data.avatar);
        $('.card-name span').text(data.name);
        $('.card-role span').text(strRole);
        $('.card-email span').text(data.email);
        $('.card-number span').text(data.number);
        $('.card-date span').text(data.date);
    })
})

