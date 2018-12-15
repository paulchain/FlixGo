// Hàm delete
function DeleteByClass() {
    $('.delete-cata').on('click', function () {

        let id = $(this).find('.itemdelete').attr('data-id');

        $.ajax({
            url: 'http://localhost/rest/API/country.php/delete',
            method: 'GET',
            data: {
                id: id
            }
        }).done(function (data) {
            alert('Xóa thành công')
            load();
        })
    })
}


// hàm load catalog lên
function load() {
    $.ajax({
        url: 'http://localhost/rest/API/country.php/country',
        method: 'GET',
    }).done(function (data) {
        let strElement = '';
        for (const key in data) {
            const element = data[key];
            strElement += "<div class='col-md-3 mt-4'>";
            strElement += "<div class='modal-showCata '>";
            strElement += "<div class='modal-body pt-3 pb-1'>";
            strElement += "<div class='delete-cata' ><div class='itemdelete' data-id='" + element.id + "'><i class='fas fa-times'></i></div></div>";
            strElement += "<div class='row'>";
            strElement += "<div class='col-md-4 '><img class='imageCatalog ' src='./public/img/camera.png' alt=''></div>";
            strElement += "<div class='col-md-8 '><div class='card-body p-0 text-left'><h5 class='card-title mt-4 ' id=''>" + element.name_country + "</h5></div></div>";
            strElement += "<div class='col-10 offset-md-1 mt-2'>";
            strElement += "<div class='update-Cata d-flex justify-content-start mr-4' data-id='" + element.id + "' data-toggle='modal' data-target='#centralModal-lg'>";
            strElement += "<img style='width:20px; max-height:20px;' src='./public/img/update.png' alt=''><h5 class='pl-2'>Update now!</h5></div>";
            strElement += "</div></div></div></div></div>";
        }
        
        $('.RootClass').html(strElement);
        insert();
        DeleteByClass();
        GetOneCatalog();
    })
}

//hàm insert catalog
function insert() {
    $('#btnInsert').on('click', function () {

        name = $('input[name="name"]').val();
        
        $.ajax({
            url: "http://localhost/rest/API/country.php/insert",
            method: "POST",
            data: {
                name_country: name
            }
        }).done(function (data) {
            console.log(data);

            alert('Thêm thành công')
            $('input[name="name"]').val('');
            load();
        })
    })
}
//hàm update catalog
function GetOneCatalog() {
    $('.update-Cata').on('click', function () {
        // Thay đổi nút thêm và sửa
        $('#btnUpdate').removeClass('d-none')
        $('#btnInsert').addClass('d-none')

        // lấy dữ liệu 1 catalog đổ vào form 
        id = $(this).attr('data-id');
        $.ajax({
            url: "http://localhost/rest/API/country.php/getOne",
            method: "GET",
            data: {
                id: id
            }
        }).done(function (data) {
            $('input[name="name"]').val(data.name_country);
            $('input[name="name"]').attr('data-id', data.id);
        })
    })
}

function handleUpdate() {
    $('#btnUpdate').click(function () {

        name = $('input[name="name"]').val();
        id = $('input[name="name"]').attr('data-id');

        $.ajax({
            url: "http://localhost/rest/API/country.php/update",
            method: "GET",
            data: {
                id: id,
                name: name
            }
        }).done(function (data) {
            alert('Sửa thành công')
            $('input[name="name"]').val('');
            load()
        })
    })
}

insert();
DeleteByClass();
GetOneCatalog();
handleUpdate();

//LOAD 
$('#insertCatalog').click(function () {
    // Thay đổi nút thêm và sửa
    $('#btnInsert').removeClass('d-none')
    $('#btnUpdate').addClass('d-none')
    // Xóa dữ liệu từ form update
    $('input[name="location"]').val('');
    $('input[name="name_cata"]').val('');
})