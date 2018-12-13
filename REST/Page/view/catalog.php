<?php
    if(isset($_POST['addnew'])){
        if($_POST['addnew']){
            $location=$_POST['location'];
            $name_cata=$_POST['name_cata'];
            catalog_insert($location,$name_cata);
        }
    }
    if(isset($_POST['update'])){
      $location=$_POST['location'];
      $name_cata=$_POST['name_cata'];
      $id=$_POST['id'];
      catalog_update($id, $location,$name_cata);
    }
    if(isset($_GET['id'])&&isset($_GET['delete'])){
        $id=$_GET['id'];
        catalog_delete($id);
    }
?>
<section class="main-movie col-10">
    <?php require './view/template/admin.php'; ?>
    <div class="row no-gutters ">
      <div class="mr-auto"></div>
      <button class="btn blue-gradient ml-auto mr-3 mt-3" data-toggle="modal" data-target="#centralModal-lg" title="Thêm danh mục mới"><i class="fas fa-plus"></i></button>
    </div>
    <div class="showCatalog">
      <div class="row">
        <div class="col-md-3">
          <div class="form-cata">
            <div class="modal-body">
              <div class="row">
                <div class="col-md-4 offset-md-1">
                  <img class="w-100" src="./public/img/allmovie.png" alt="">
                </div>
                <div class="col-md-5">
                  <div class="card-body p-0 text-right">
                    <h4 class="card-title mt-4 " id="">Tổng số phim</h4>
                    <h1 class="card-text " id="">100</h1>
                  </div>
                </div>
                <div class="col-10 offset-md-1 mt-2">
                  <div class="update-allMovie d-flex justify-content-end mr-5">
                    <img style="width:20px; max-height:20px;" src="./public/img/update.png" alt="">
                    <h5 class="pl-2">Update now!</h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <!-- MODAL INSERT  -->
  <div class="modal fade" id="centralModal-lg" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-dialog modal-lg" role="form">
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
                        <label for="formGroupExampleInput">Vị trí</label>
                        <input class="form-control" id="formGroupExampleInput" type="text" name="location" placeholder="">
                      </div>
                      <div class="form-group">
                        <label for="formGroupExampleInput">Tên danh mục</label>
                        <input class="form-control" id="formGroupExampleInput" type="text" name="name_cata" placeholder="">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button class="btn btn-secondary btn-sm" type="button" data-dismiss="modal">Close</button>
                <button class="btn btn-warning btn-sm" type="reset">Reset</button>
                <input class="btn btn-primary btn-sm" type="submit" value="Insert" name="addnew">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
</section>
      