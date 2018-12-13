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
<section class="main-movie .col-10">
          <div class="row">
            <div class="col-sm-12 col-md-12 mt-5">
              <div class="selec d-flex align-items-center">
                <button class="btn blue-gradient mr-auto" data-toggle="modal" data-target="#centralModal-lg" title="Thêm danh mục mới"><i class="fas fa-plus"></i></button>
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
                <div class="form-group d-flex mb-0">
                  <input class="form-control" type="text" placeholder="Search" aria-label="Search">
                  <div class="form-button ml-3 mr-3">
                    <button class="btn btn-small m-0 bg blue-gradient">Search</button>
                  </div>
                </div>
                <div class="form-group mb-0">
                  <select class="browser-default custom-select">
                    <option selected="">Thể loại</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select>
                </div>
                <button class="btn text-white font-weight-light blue-gradient ml-3">Sắp xếp theo thứ tự</button>
              </div>
            </div>
            <div class="col-12">
              <table class="table mt-2 table-striped bg-white font-weight-bold mb-0">
                <thead>
                  <tr>
                    <th scope="col">
                      <input type="checkbox">
                    </th>
                    <th scope="col">Mã</th>
                    <th scope="col">STT</th>
                    <th scope="col">Tên danh mục</th>
                    <th scope="col">Xóa</th>
                    <th scope="col">Sửa</th>
                  </tr>
                </thead>
                <tbody>
                    <?php
                        $kq=catalog_select_all();
                        foreach($kq as $kq){
                            extract($kq);
                            $delete="<a href='index.php?page=catalog&id=$id&delete=1'><i class='fas fa-trash-alt'></i></a>";
                            echo
                                '<tr>
                                    <td class="font-weight-light h6" scope="row">
                                    <input type="checkbox">
                                    </td>
                                    <td class="font-weight-light h6">'.$id.'</td>
                                    <td class="font-weight-light h6">'.$location.'</td>
                                    <td class="font-weight-light h6">'.$name_cata.'</td>
                                    <td>'.$delete.'</td>
                                    <td class="update-cata-modal" data-id='.$id.' data-toggle="modal" data-target="#modal-lg" title="Sửa danh mục">
                                        <i class="fas fa-pencil-alt"></i>
                                    </td>
                                </tr>';
                        }
                  ?>
                </tbody>
              </table>
              <form method="post" action="index.php?page=catalog&id=$id&update=1">
              <div class="modal fade" id="modal-lg" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
              <div class="modal-dialog modal-lg" role="form">
                  <div class="modal-content">
                      <div class="modal-header">
                      <h3>Sửa danh mục</h3>
                      <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                      </div>
                      <div class="modal-body" id="content-insert">
                      <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <input type="hidden" name='id' class='modal-id-hidden'>
                                <div class="form-group">
                                <label for="formGroupExampleInput">STT</label>
                                <input class="form-control" id="modal-cata-rank" type="text" name="location" value="" placeholder="">
                                </div>
                                <div class="form-group">
                                <label for="formGroupExampleInput">Tên danh mục</label>
                                <input class="form-control" id="modal-cata-name" type="text" value="" name="name_cata" placeholder="">
                                </div>
                            </div>
                        </div>
                      </div>
                      </div>
                      <div class="modal-footer">
                      <button class="btn btn-secondary btn-sm" type="button" data-dismiss="modal">Close</button>
                      <button class="btn btn-warning btn-sm" type="reset">Reset</button>
                      <input class="btn btn-primary btn-sm" type="submit" value="Update" name="update">
                      </div>
                  </div>   
              </div>
              </div>
              </form>
              <nav class="d-flex bg blue-gradient" aria-label="Page navigation example">
                <div class="mr-auto"></div>
                <ul class="pagination pagination-circle mb-0 mt-1">
                  <li class="page-item"><a class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
                  <li class="page-item active"><a class="page-link">1</a></li>
                  <li class="page-item"><a class="page-link">2</a></li>
                  <li class="page-item"><a class="page-link">3</a></li>
                  <li class="page-item"><a class="page-link">4</a></li>
                  <li class="page-item"><a class="page-link">5</a></li>
                  <li class="page-item"><a class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </section>