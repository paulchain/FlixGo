
// Hàm delete
function DeleteByClass(classList){
    $('.' + classList).on('click',function(){
        let id = $(this).attr('data-id');
        $.ajax({
            url: 'http://localhost/rest/API/catalog.php/delete',
            method: 'GET',
            data: {id:id}
        }).done(function(data){
            if(data == true){
                LoadCatalog('rootClassCatalog')
            }  
        })
    })
}


// hàm load catalog lên
function LoadCatalog(RootClass){
    let Rootelement = $("."+RootClass);
    $.ajax({
        url: 'http://localhost/rest/API/catalog.php/GetAllCatalog',
        method: 'GET',
    }).done(function(data){
        let strElement = '';
        for (const key in data) {
            const element = data[key];
            // Nội dung cần insert
            strElement += "<div class='col-md-3 mb-4'>";
            strElement += "<div class='card-showCata'><div class='content-allmovie'><p>Tổng phim</p><h2>100</h2></div>";
            strElement += "<div class='content-cata'> <h5>"+element.name_cata+"</h5></div><div class='card-upde'>";
            strElement += "<button  class=' update-Cata mr-2' data-id='"+element.id+"' data-toggle='modal' data-target='#centralModal-lg'><i class='fas fa-edit'></i></button><button class='itemdelete mr-2' data-id='"+element.id+"'><i class='fas fa-trash-alt'></i></button>";
            strElement += "</div></div></div>"; 
        }            
        Rootelement.html(strElement);
        
        DeleteByClass('itemdelete');
        GetOneCatalog('location','name_cata');
    })
}

    
    
        
    
//hàm insert catalog
function insertCatalog(location,namecata){
    $('#btnInsert').on('click',function(){
        islocation = $('input[name="'+location+'"]').val();
        isnamecata = $('input[name="'+namecata+'"]').val();
        $.ajax({
            url: "http://localhost/rest/API/catalog.php/insert",
            method: "POST",
            data: {location: islocation, namecata: isnamecata}
        }).done(function(data){
            if(data != 0){
                alert('Thêm thành công')
                $('input[name="'+location+'"]').val('');
                $('input[name="'+namecata+'"]').val('');
                LoadCatalog('rootClassCatalog')
            }
        })
    })
}
//hàm update catalog
function GetOneCatalog(location,namecata){
    $('.update-Cata').on('click',function(){
        console.log('hah');
        
        // Thay đổi nút thêm và sửa
        $('#btnUpdate').removeClass('d-none')
        $('#btnInsert').addClass('d-none')

        // lấy dữ liệu 1 catalog đổ vào form 
        isid = $(this).attr('data-id');
        $.ajax({
            url: "http://localhost/rest/API/catalog.php/GetCatalogById",
            method: "GET",
            data: {id: isid}
        }).done(function(data){
            $('input[name="'+location+'"]').val(data.location);
            $('input[name="'+namecata+'"]').val(data.name_cata);
        })
    })
}

function handleUpdate(location,namecata){
    $('#btnUpdate').click(function(){
        islocation = $('input[name="'+location+'"]').val();
        isname = $('input[name="'+namecata+'"]').val();
        console.log('vao lần');
        
        $.ajax({
            url: "http://localhost/rest/API/catalog.php/update",
            method: "GET",
            data: {id: isid, location:islocation, namecata: isname}
        }).done(function(data){
            alert('Sửa thành công')
            $('input[name="'+location+'"]').val('');
            $('input[name="'+namecata+'"]').val('');
            LoadCatalog('rootClassCatalog')
        })        
    })   
}




insertCatalog('location','name_cata');
DeleteByClass('itemdelete');
GetOneCatalog('location','name_cata');
handleUpdate('location','name_cata');

//LOAD 
$('#insertCatalog').click(function(){
    // Thay đổi nút thêm và sửa
    $('#btnInsert').removeClass('d-none')
    $('#btnUpdate').addClass('d-none')
    // Xóa dữ liệu từ form update
    $('input[name="location"]').val('');
    $('input[name="name_cata"]').val('');
})


