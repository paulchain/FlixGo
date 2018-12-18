$(window).ready(function(){
    $('.backgroundTotal').attr('src',$('.card-img-top').attr('src'))
})

$('#btn-insert').click(function(){
    //Xóa nội dung của update
    $('#modalForm').find('input').not('input[type="hidden"]').val('');
    //Ẩn nút upadte đi 
    $('#btnUpdate').addClass('d-none');
    $('#btnInsert').removeClass('d-none');
})



function insertmovie(){
    //bắt sự kiên bấm vào nút insert
    $('#btnInsert').click(function(){
        let formData = new FormData();
        formData.append('id', $('#id_movie').val());
        formData.append('episodes', $('#episodes').val());
        formData.append('title', $('#title').val());
        formData.append('linksd', $('#linksd').val());
        formData.append('linkhd', $('#linksd').val());
        formData.append('linkfhd', $('#linkfhd').val());

        $.ajax({
            url: 'http://localhost/reST/API/movie_series.php/insert',
            method: 'POST',
            processData: false,
            contentType: false,
            data: formData
        }).done(function(data){
            if(data == true){
                load_movie_series(1);
            }      
        })
    })
}

function load_movie_series(page){
    let id = $('#id_movie').val();
    let formData =  { id_movie : id , page : page }
    let strMovie = ''
    $.ajax({
        url: 'http://localhost/reST/API/movie_series.php/movie_series',
        method: 'GET',
        data: formData,
    }).done(function(data){
        data.forEach(element => {
            strMovie += "<tr data-id='"+element.id_series+"'>";
            strMovie += "   <td class='font-weight-light h6'>"+element.id_series+"</td>";
            strMovie += "   <td class='font-weight-light h6'>"+element.episodes+"</td>";
            strMovie += "   <td class='font-weight-light h6'>"+element.title+"</td> ";
            strMovie += "   <td> <a data-toggle='modal' class='btn-update' data-target='#modalForm' title='Update movie' href='javascript:void(0)'><img src='./public/img/edit.png' alt=''></a> </td>";
            strMovie += "   <td><a class='deleteMovie' href='javascript:void(0)'><img src='./public/img/trash.png' alt=''></a></td>";
            strMovie += "</tr>";
        });
        $('table tbody').html(strMovie);
        deletemovie();
        loadformupdate();
    })
}

function deletemovie(){
    $('.deleteMovie').click(function(){
        let id_series  = $(this).parents('tr').attr('data-id');
        $.ajax({
            url: 'http://localhost/reST/API/movie_series.php/delete',
            method: 'GET',
            data: {id_series : id_series}
        }).done(function(data){
            if(data == true){
                load_movie_series(1)
            }
        })
    })
}

function loadformupdate(){
    $('.btn-update').click(function(){
        let id_series = $(this).parents('tr').attr('data-id');

        $('#btnUpdate').removeClass('d-none');
        $('#btnInsert').addClass('d-none');

        $.ajax({
            url: 'http://localhost/reST/API/movie_series.php/movie_series_by_id',
            method: 'GET',
            data: {id_series : id_series}
        }).done(function(data){
            $('#id_movie').val(data.id_movie);
            $('#id_series').val(data.id_series);
            $('#episodes').val(data.episodes);
            $('#title').val(data.title);
            $('#linksd').val(data.clip_SH);
            $('#linksd').val(data.clip_HD);
            $('#linkfhd').val(data.clip_FHD);
            load_movie_series(1)
        })
    })
}
function updatemovie(){
    $('#btnUpdate').click(function(){
        let formData = new FormData();
        formData.append('id_series', $('#id_series').val());
        formData.append('id', $('#id_movie').val());
        formData.append('episodes', $('#episodes').val());
        formData.append('title', $('#title').val());
        formData.append('linksd', $('#linksd').val());
        formData.append('linkhd', $('#linksd').val());
        formData.append('linkfhd', $('#linkfhd').val());
        $.ajax({
            url: 'http://localhost/reST/API/movie_series.php/update',
            method: 'POST',
            processData: false,
            contentType: false,
            data: formData
        }).done(function(data){
            if(data == true){
                load_movie_series(1);
            }      
        })
    })
}

$('table tbody').ready(function(){
    insertmovie(); 
    deletemovie(); 
    loadformupdate();
    updatemovie();
})





