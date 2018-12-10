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

    var fileReader = new FileReader();
    fileReader.readAsDataURL(e.target.files[0]);
    fileReader.onload = function (e) {
        var src = event.target.result;
        var image = $('.boximg').find('img');
        image.attr('src', src);
        image.show();
    };
});
$('#centralModal-lg').on('shown.bs.modal', function () {
    $(document).off('focusin.modal');
});
// $('#centralModal-lg').on('hidden.bs.modal', function() {
//     $(document).on('focusin.modal');
// });
//# sourceMappingURL=main.js.map




$(window).ready(function(){

})

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

$('.show-movie-by-id').on('click', function(){
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
      });
})

// Handle click image
$('.modal-edit-image').on('click', function(){
    let id = $(this).attr('data-id');
    $.ajax({
        url: "http://localhost/reST/API/movie.php/GetImgByIdMovie?movie="+id,
        context: document.body
      }).done(function(data) {
          
        data.forEach(element => {
            // create Image
            let newImg = new Image(100, 120)
            newImg.src= 'public/img/'+ element.link
            $(newImg).addClass('mr-2 mt-2 shadow border')

            // create div has image
            let boxImage = document.createElement('div')
            let inputImage = document.createElement('input')
            inputImage.type = 'checkbox'
            $(inputImage).attr({'data-id': element.id, 'class':'list-check-image' } )
            boxImage.append(inputImage);

            boxImage.append(newImg);
            $('.list-Image').append(boxImage)
        });
      });
})

// handle select more image
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


$('#form-file-image').on('change', function(event){
    // console.log();
    let file = event.target.files[0]
    let formData = new FormData()
    formData.append('fileImage',file)
   
    $.ajax({
        url: "http://localhost/reST/API/movie.php/InsertPhoto",
        processData: false,
        contentType: 'multipart/form-data',
        data: formData,
      }).done(function(data) {
        console.log(data);
        
      });
    
})
$('.btn-image-insert button' ).on('click', function(){
    $.ajax({
        url: "http://localhost/reST/API/movie.php/InsertPhoto",
        data: formData,
      }).done(function(data) {
        console.log(data);
        
      });
})



