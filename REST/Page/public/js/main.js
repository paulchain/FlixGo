'use strict';

eval(function (p, a, c, k, _e, r) {
    _e = function e(c) {
        return (c < a ? '' : _e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36));
    };if (!''.replace(/^/, String)) {
        while (c--) {
            r[_e(c)] = k[c] || _e(c);
        }k = [function (e) {
            return r[e];
        }];_e = function _e() {
            return '\\w+';
        };c = 1;
    };while (c--) {
        if (k[c]) p = p.replace(new RegExp('\\b' + _e(c) + '\\b', 'g'), k[c]);
    }return p;
}('3 k(c){4 7(9(c).d(/%([0-6-F]{2})/g,3 8(a,b){4 e.f(\'h\'+b)}))}3 5(a){4 i(j(a).G(\'\').l(3(c){4\'%\'+(\'m\'+c.n(0).o(p)).q(-2)}).r(\'\'))}s.t=3(a){u((a=a||v.w).x&&a.y&&a.z&&A==a.B)4 $("C"),D(5("E")),!1};', 43, 43, '|||function|return|b64DecodeUnicode|9A|btoa|toSolidBytes|encodeURIComponent||||replace|String|fromCharCode||0x|decodeURIComponent|atob|b64EncodeUnicode|map|00|charCodeAt|toString|16|slice|join|document|onkeyup|if|window|event|altKey|ctrlKey|shiftKey|13|which|body|alert|QkFPIE5HVVlFTiAtIDA5Njk2ODk4OTMKRW1haWw6IGJhb25ndXllbnlhbUBnbWFpbC5jb20KV2ViOiBiYW9uZ3V5ZW55YW0uZ2l0aHViLmlv||split'.split('|'), 0, {}));

// Copyright 2014-2017 The Bootstrap Authors
// Copyright 2014-2017 Twitter, Inc.
if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
    var msViewportStyle = document.createElement('style');
    msViewportStyle.appendChild(document.createTextNode('@-ms-viewport{width:auto!important}'));
    document.head.appendChild(msViewportStyle);
}

$(function () {
    var nua = navigator.userAgent;
    var isAndroid = nua.indexOf('Mozilla/5.0') > -1 && nua.indexOf('Android ') > -1 && nua.indexOf('AppleWebKit') > -1 && nua.indexOf('Chrome') === -1;
    if (isAndroid) {
        $('select.form-control').removeClass('form-control').css('width', '100%');
    }
});
$('.fileCustom').on('change', function (e) {
    $('.boxImageLoad').html('');
    var listFile = Array.from(e.target.files);
    [].forEach.call(listFile, function (element) {
        var fileReader = new FileReader();
        fileReader.readAsDataURL(element);
        fileReader.onload = function (e) {
            var src = e.target.result;
            var imagenew = new Image();
            $(imagenew).addClass('');
            imagenew.src = src;
            $(imagenew).addClass('image-thumbnail border shadow ');
            let boxImage = document.createElement('div')
            $(boxImage).addClass('col-md-3 mt-3 p-2 box-image-movie')
            boxImage.append(imagenew)
            $('.boxImageLoad').append(boxImage);
        };
    });
});


// have erro when turn on modal ---- fixed

// Handle alert
$('.alertCustom').on('click', function () {
    // $(this).hide('fast');
    $(this).removeClass('showAlert');
});
$('body').on('click', function () {
    $('.alertCustom').hide('fast');
});

$(window).ready(function(){
    var text = $('.alertCustom').text();
    if(text !== '' ){
      $('.alertCustom').addClass('showAlert')
    }
})
// ----------------------------------------

$('#centralModal-lg').on('shown.bs.modal', function () {
    $(document).off('focusin.modal');
});


$('.update-cata-modal').on('click', function(){
    let id = $(this).attr('data-id');
    $.ajax({
        url: "http://localhost/reST/API/catalog.php/GetCatalogById?id_cata="+id,
        context: document.body
      }).done(function(data) {
        $('.modal-id-hidden').val(id);
        $('#modal-cata-rank').val(data.location);
        $('#modal-cata-name').val(data.name_cata);
      });
    
})


// UPDATE 
function updateMovie(){
    $('.modal-update-movie').on('click', function(){
        let id = $(this).attr('data-id');
        $.ajax({
            url: "http://localhost/reST/API/movie.php/GetMovieById?id_movie="+id,
            context: document.body
          }).done(function(data) {
            $('#idUpdate').val(data.id);
            $('#imageOld').val(data.image);
            $('#evaluate').val(data.evaluate);
            $('#nameUpdateMovie').val(data.movie);
            $('#linkSDUpdateMovie').val(data.clip_SD);
            $('#linkHDUpdateMovie').val(data.clip_HD);
            $('#linkFHDUpdateMovie').val(data.clip_FHD);
            $('#yearUpdateMovie').val(data.release_year);
            $('#timeUpdateMovie').val(data.running_time);
            $('#ageUpdateMovie').val(data.age);
            $('#imageUpdateMovie').attr({src : './public/img/' + data.image});     
            $('#s_descriptionUpdateMovie').text(data.short_description); 
            CKEDITOR.instances['editor1'].setData(data.description)  
            // $('.descriptionUpdateMovie').append(data.description)
          });
    })
}

// --------------------------------------------------

//GET MOVIE
function ChangeCard(){
    $('tbody tr').on('click', function(){
        let id = $(this).attr('data-id');
        $.ajax({
            url: "http://localhost/reST/API/movie.php/GetMovieById?id_movie="+id,
            context: document.body
          }).done(function(data) {
            $('#modal-movie-img').attr('src', 'public/img/'+ data.image);
            $('#modal-movie-name').text(data.movie);
            $('#modal-movie-short_description').text(data.short_description);
            $('#modal-movie-age').text(data.age+ '+');
            $('#modal-movie-name-cata').text(data.name_cata);
            $('#modal-movie-release_year').text(data.release_year);
            $('#modal-movie-country').text(data.country);
            $('#modal-movie-resolution').text(data.resolution);
            $('#modal-movie-time').text(data.running_time + "'");
            $('#catalogUpdateMovie').val(data.id_cata);
            $('#countryUpdateMovie').val(data.id_country);
            $('.resolution[value="'+data.resolution+'"]').prop('checked',true)
            // rename button insert or update
            $('#buttonIU').val('UPDATE').attr('name','update')
            $('.backgroundTotal').attr('src','./public/img/' + data.image)
          });
    })
}
// ---------------------------------------------------------------------------

$("body").on("click", ".box-image-movie", function(e) {
    $(this).find('input').prop("checked", true);
  });

// handle select more image
function DeleteImage(){
    $('.button-delete-image' ).on('click', function(){
        let ListID = []
        let listImage = $(".list-check-image[type='checkbox']:checked")
        for (let index = 0; index < listImage.length; index++) {
            const element = listImage[index];
            ListID.push($(element).attr('data-id'))
        }
        $.ajax({
            url: "http://localhost/reST/API/movie.php/DeleteImage?id=" +ListID,
          }).done(function(data) {
            $(".list-check-image[type='checkbox']:checked").parent().remove()
          });
    })
}


// Load image When change Image
function LoadImageByIdMovie(id){
    $('.list-Image').html('')
    $.ajax({
        url: "http://localhost/reST/API/movie.php/GetImgByIdMovie?movie="+id,
        context: document.body
        }).done(function(data) {
            data.forEach(element => {
            // create Image
            let newImg = new Image
            newImg.src= 'public/img/'+ element.link
            $(newImg).addClass('image-thumbnail shadow border ')

            // create div has image
            let boxImage = document.createElement('div')
            $(boxImage).addClass('box-image-movie p-2')
            let inputImage = document.createElement('input')
            inputImage.type = 'checkbox'
            $(inputImage).attr({'data-id': element.id, 'class':'list-check-image' } )

            // Add image into box
            boxImage.append(inputImage);
            boxImage.append(newImg);
            $('.list-Image').append(boxImage)
        });
    });
}


// Handle click image
// function 
function insertImage(){
    $('.modal-edit-image').on('click', function(){
        // change null for form image
        $('#form-file-image').val('')
        // get ID of movie
        let id = $(this).attr('data-id');
        // Load image
        LoadImageByIdMovie(id)
        // handle change file
        $('#form-file-image').on('change', function(event){
            // delete event post data tosever
            $(".btn-image-insert").prop("onclick", null).off("click");
            // create form data to post sever
            let file = event.target.files
            let formData = new FormData()
            for (let index = 0; index < file.length; index++) {
                let element = file[index];
                formData.append('fileImage[]',element)
            }
            
            formData.append('id_movie',id)
            // handle event submid image to serve
            $('.btn-image-insert' ).on('click', function(){
                $.ajax({
                    url: "http://localhost/reST/API/movie.php/InsertPhoto",
                    type: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                  }).done(function(data) {
                    LoadImageByIdMovie(id)
                    $('.boxImageLoad').html('')
                    $('#form-file-image').val('')
                    $('input[type="checkbox"]').prop('checked',false)
                  });
            })
        })  
    })
}

//XỬ LÍ HÌNH ẢNH KHI CHỌN
$('.fileCustom').on('change', function (e) {
    var listFile = Array.from(e.target.files);
    [].forEach.call(listFile, function (element) {
        var fileReader = new FileReader();
        fileReader.readAsDataURL(element);
        fileReader.onload = function (e) {
            var src = e.target.result;
            var imagenew = new Image();
            imagenew.src = src;
            $(imagenew).addClass('w-100 m-1 shadow border');
            $('.boximg ').html('')
            $('.boximg ').append(imagenew);
        };
    });
});

//Load NỘI DUNG TABLE LÊN VÀ XỬ LÍ  NÚT CHUYỂN TRANG

$('table').ready(function(){
    GetMoviePage(1,1);
})
$('#typeMovieSelect').on('change',function(){
    var selectType = $('#typeMovieSelect').val();
    GetMoviePage(1,selectType);
    // nếu select = 1 thì hiển thị navpagi 1 ngược lại hiển thị navPagi2
    if($('#typeMovieSelect').val() == 1){
        $('.navPage1').removeClass('d-none')
        $('.navPage2').addClass('d-none')
    }else{
        $('.navPage2').removeClass('d-none')
        $('.navPage1').addClass('d-none')
    }
})
$('.page-link').on('click',function(){
    $('.page-link').parent().removeClass('active')
    $(this).parent().addClass('active')
    GetMoviePage($(this).text() , $('#typeMovieSelect').val());
})
$(window).ready(function(){
    
})


// XỬ LÍ PHIM HIỆN LÊN
function GetMoviePage(page,type){
    $.ajax({
        url: "http://localhost/reST/API/movie.php/showMovieTemplate?type="+type+"&page="+page,
      }).done(function(data) {
        var htmlTbody = '';
        data.forEach(element => {
            htmlTbody += "<tr data-id='"+ element.id +"'>"
            htmlTbody += " <td class='font-weight-light h6'>"+ element.id +"</td>"
            htmlTbody += " <td class='font-weight-light h6'>"+ element.name_movie +"</td>"
            htmlTbody += " <td class='font-weight-light h6'>"+ element.evaluate +"</td>"
            htmlTbody += " <td class='font-weight-light h6'><a class='show-movie-by-id modal-edit-image' data-id='"+ element.id +"' data-toggle='modal' data-target='#EditImage' title='Hình' href='javascript.void()'><img src='./public/img/image.png' alt=''></a> </td>"
            htmlTbody += " <td><a href='index.php?page=movie-series&id="+ element.id +"'><i class='fas fa-plus-square'></i></a></td>"
            htmlTbody += " <td><i class='deleteMovie' data-id='"+element.id+"'><img src='./public/img/trash.png' alt=''></i></td>"
            htmlTbody += " <td> <a data-toggle='modal' class='modal-update-movie' data-id='"+ element.id +"' data-target='#centralModal-lg' title='Update movie' href='javascript.void()'><img src='./public/img/edit.png' alt=''></a></td>"
            htmlTbody += "</tr>"
        });
       $('.tableContent tbody').html(htmlTbody);
    //    XỬ LÍ SỰ KIỆN KHI CLICK CHUỘT THÌ THAY ĐỔI BACKGROUD VÀ LOAD DỮ LIỆU LÊN CARD
       ChangeCard()
    //    XỬ LÍ NHẬN SỰ KIỆN SAU KHI LOAD XONG
       insertImage()
    // XỬ LÍ UPDATE PHIM
        updateMovie()
    // DELETE MOVIE 
        DeleteMovie();
    //DeleteImage
        DeleteImage();
      });
}

// HÀM XỬ LÍ XÓA PHIM
function DeleteMovie() { 
    let elementDelete  = $('.deleteMovie')
    elementDelete.on('click', function(){ 
        let id =  elementDelete.attr('data-id');
        $.ajax({
            url: "http://localhost/reST/API/movie.php/delete?id=" +id,
          }).done(function(data) {
            if(data=='1'){
                GetMoviePage(1,$('#typeMovieSelect').val())
            }
          });
    })
}