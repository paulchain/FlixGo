<?php
   
  //  Lấy quốc gia
    $allCata = country_select_all();
?>

<section class="main-movie col-10">
    <?php require './view/template/admin.php'; ?>
  <div class="container-fluid">
    <div class="row no-gutters">
      <div class="mr-auto "></div>
      <button class="btn blue-gradient mt-4" id='insertCatalog' data-toggle="modal" data-target="#centralModal-lg" title="Thêm danh mục mới"><i class="fas fa-plus"></i></button>
    </div>
    <div class="row  mb-5 RootClass RootClass">
      <?php
        foreach ($allCata as $item) {
          extract($item);
          echo 
            "<div class='col-md-3 mt-4'>
              <div class='modal-showCata'>
                <div class='update-Cata d-flex justify-content-start mr-4' data-id='$id' data-toggle='modal' data-target='#centralModal-lg'>
                  <img style='width:20px; max-height:20px;' src='./public/img/update.png' alt=''>
                  <h5  class='pl-2'>Update now!</h4>
                </div>
                <div class='modal-body pt-3 pb-1'>
                  <div class='delete-cata' >
                    <div class='itemdelete' data-id='$id'><i class='fas fa-times'></i></div>
                  </div>
                  <div class='row'>
                    <div class='col-12'>
                      <div class='card-body p-0 text-left'>
                        <h4 class='card-title mt-4 ' id=''>$name_country</h4>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>";
        }
      ?>
      
    </div>
    
  </div>
  <!-- MODAL INSERT  -->
  <div class="modal fade modalCustom" id="centralModal-lg" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-dialog  modal-lg" role="form">
          <form method="post" action="index.php?page=catalog">
            <div class="modal-content">
              <div class="modal-header">
                <h3>Thêm danh mục</h3>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              </div>
              <div class="modal-body" id="content-insert">
                <div class="container">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="formGroupExampleInput">Tên Quốc Gia</label>
                        <input class="form-control" id="formGroupExampleInput" type="text" name="name" placeholder="">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button class="btn btn-secondary btn-sm" type="button" data-dismiss="modal">Close</button>
                <input class="btn btn-primary btn-sm" type="" value="Insert" name="addnew" data-dismiss="modal"  id='btnInsert'>
                <input class="btn btn-primary btn-sm d-none" type="" value="Update" name="update" data-dismiss="modal"  id='btnUpdate'>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
</section>

<script src="public/js/thuvien.js"></script>
<script src="public/js/country.js"></script>
      

