<?php
    $dsloai = catalog_select_all();
    $dsqg = country_select_all();
    $dsimg = photos_select_all();
    $message = '';
    if(isset($_POST['addnew'])){
        if($_POST['addnew']){
            
            $name_movie=$_POST['name_movie'];
            $release_year=$_POST['release_year'];
            $view = 0;
            $evaluate=$_POST['evaluate'];
            $running_time=$_POST['running_time'];
            $id_country=$_POST['id_country'];
            $short_description=$_POST['short_description'];
            $description=$_POST['description'];
            $image=$_FILES['image']['name'];
            $clip_SD=$_POST['clip_SD'];
            $clip_HD=$_POST['clip_HD'];
            $clip_FHD=$_POST['clip_FHD'];
            $age=$_POST['age'];
            $resolution=$_POST['resolution'];
            $type=$_POST['type'];
            $id_cata=$_POST['id_cata'];
            $result = movie_insert($name_movie,$evaluate,$view,$release_year,$running_time,$id_country,$short_description,$description,$image,$clip_SD,$clip_HD,$clip_FHD,$age,$resolution,$type,$id_cata);
            $message =  $result > 0 ?'Thêm thành công' : 'Thêm phim thất bại';
            if($result > 0){
              move_uploaded_file($_FILES['image']['tmp_name'], 'public/img/' . $image);
            }
        }
    }
    if(isset($_POST['update'])){
      $id = $_POST['id'];
      $name_movie=$_POST['name_movie'];
      $evaluate=$_POST['evaluate'];
      $release_year=$_POST['release_year'];
      $running_time=$_POST['running_time'];
      $id_country=$_POST['id_country'];
      $short_description=$_POST['short_description'];
      $description=$_POST['description'];
      if($_FILES['image']['error'] != 4){
        $image=$_FILES['image']['name'];
      }else{
        $image=$_POST['imageOld'];
      }
      $clip_SD=$_POST['clip_SD'];
      $clip_HD=$_POST['clip_HD'];
      $clip_FHD=$_POST['clip_FHD'];
      $age=$_POST['age'];
      $resolution=$_POST['resolution'];
      $type=$_POST['type'];
      $id_cata=$_POST['id_cata'];
      $result = movie_update($id, $name_movie,$evaluate,$release_year,$running_time,$id_country,$short_description,$description,$image,$clip_SD,$clip_HD,$clip_FHD,$age,$resolution,$type,$id_cata);
      $message =  $result > 0 ?'Cập nhật thành công' : 'Cập nhật phim thất bại';
      if($result > 0){
        move_uploaded_file($_FILES['image']['tmp_name'], 'public/img/' . $image);
      }
    }
    if(isset($_GET['id'])&&isset($_GET['delete'])){
        $id=$_GET['id'];
        $result = movie_delete($id);
        $message =  $result > 0 ? 'Xóa thành công' : 'Xóa phim thất bại';
    }
    if(isset($_POST['addimg'])){
      if($_POST['addimg']){
        $link=$_POST['link'];
        $id_movie=$_POST['id_movie'];
        photos_insert($link,$id_movie);
      }
    }
    $_REQUEST = Array();
?>
<section class="main-movie col-md-10">
    <?php require './view/template/admin.php'; ?>
    <!-- modal custom -->
    <img src="" alt="" class='backgroundTotal'>
    <div class="alert-success alertCustom bg blue-gradient"><?=$message?></div>
    <!-- --------------- -->
    <div class="container-fluid mainLoad">
      
      <div class="row mt-5">
        <!-- TABLE -->
        <div class="col-8  ">
          <div class="d-flex align-items-center flex-wrap">
            <button class="btn blue-gradient m-0 mr-auto" data-toggle="modal" data-target="#centralModal-lg" title="Thêm phim mới"><i class="fas fa-plus"></i></button>
            <div class="form-group  mb-0 mr-3">
              <select name="" id="typeMovieSelect" class="browser-default custom-select">
                <option selected value="1">Phim lẻ</option>
                <option value="0">Phim bộ</option>
              </select>
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
          <table class="table mt-2 table-striped bg-white font-weight-bold mb-0 p-4 tableContent">
            <thead>
              <tr p-4>
                <th scope="col">Mã</th>
                <th scope="col">Tên phim</th>
                <th scope="col">IBMS</th>
                <th scope="col">Hình ảnh</th>
                <th scope="col">Thêm tập</th>
                <th scope="col">Xóa</th>
                <th scope="col">Sửa</th>
              </tr>
            </thead>
            <tbody>
            <!-- LƯU GIÁ TRỊ HIỆN TẠI CẢ BẢN DANH SÁCH -->
            </tbody>
          </table>

          <!-- THANH PAGE  -->
          <nav class="d-flex bg blue-gradient w-100" aria-label="Page navigation example">
            <div class="mr-auto"></div>

            <!-- NAV của phi m lẽ -->
            <ul class="pagination navPage1 pagination-circle  mb-0 mt-1">
              <li class="page-item"><a class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
              <?php  
                $countMovie = countMovie()[0][0];
                if($countMovie%10==0){
                  for ($i=1; $i <= $countMovie/10; $i++) {
                    if($i == 1){
                      echo " <li class='page-item active'><a class='page-link'>$i</a></li>";
                    }else{
                      echo " <li class='page-item '><a class='page-link'>$i</a></li>";
                    }
                  }
                }else{
                  for ($i=1; $i <= $countMovie/10 + 1; $i++) { 
                    if($i == 1){
                      echo " <li class='page-item active'><a class='page-link'>$i</a></li>";
                    }else{
                      echo " <li class='page-item '><a class='page-link'>$i</a></li>";
                    }
                  }
                }
              ?>
              <li class="page-item"><a class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                <!-- NAV CỦA PHIM BỘ -->
            </ul>
            <ul class="pagination navPage2 pagination-circle d-none mb-0 mt-1">
              <li class="page-item"><a class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
              <?php  
                $countMovies = countMovies()[0][0];
                if($countMovies%12==0){
                  for ($i=1; $i <= $countMovies/12; $i++) {
                    if($i == 1){
                      echo " <li class='page-item active'><a class='page-link'>$i</a></li>";
                    }else{
                      echo " <li class='page-item '><a class='page-link'>$i</a></li>";
                    }
                  }
                }else{
                  for ($i=1; $i <= $countMovies/12 + 1; $i++) { 
                    if($i == 1){
                      echo " <li class='page-item active'><a class='page-link'>$i</a></li>";
                    }else{
                      echo " <li class='page-item '><a class='page-link'>$i</a></li>";
                    }
                  }
                }
              ?>
              <li class="page-item"><a class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
            </ul>
          </nav>
        </div>
        <!-- COL-MD-4 CARD IMAGE  -->
        <div class="col-4 ">
          <div class="mt-2" role="">
            <div class="modal-content">
              <div class="modal-body p-0" id="content-insert">
                <div class="card">
                  <div class="view overlay"><img class="card-img-top" id="modal-movie-img" src="./public/img/imageFilm.png" alt="Card image cap"><a href="#!"></a>
                    <div class="mask rgba-white-slight"></div>
                  </div>
                  <div class="card-body p-0">
                    <h4 class="card-title mt-4 text-center" id="modal-movie-name">BẢY SẮC CẦU VÒNG</h4>
                    <p class="card-text " id="modal-movie-short_description">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure iste nostrum molestiae expedita eligendi distinctio voluptas laboriosam facilis. Alias minus magni, accusamus nisi deleniti impedit amet deserunt repellendus culpa accusantium.</p>
                    <ul class="list-unstyled d-flex mt-3 flex-wrap">
                      <li class="">
                        <div class="btn bg blue-gradient" id="modal-movie-age">18+</div>
                      </li>
                      <li class="ml-2">
                        <div class="btn bg blue-gradient" id="modal-movie-release_year">2018</div>
                      </li>
                      <li class="ml-2">
                        <div class="btn blue-gradient" id="modal-movie-country">Mỹ</div>
                      </li>
                      <li class="ml-2">
                        <div class="btn blue-gradient" id="modal-movie-resolution">FHD</div>
                      </li> 
                      <li class="ml-2">
                        <div class="btn blue-gradient" id="modal-movie-time">120'</div>
                      </li> 
                      <li class="">
                        <div class="btn blue-gradient" id="modal-movie-name-cata">HÀNH ĐỘNG ĐÂM CHÉM</div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

<!-- MODAL INSER -->
<div class="modal fade" id="centralModal-lg" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
  <div class="modal-dialog modal-lg" role="form">
    <form method="post" action="index.php?page=movie" id='formIU' enctype="multipart/form-data">
        <div class="modal-content">
          <div class="modal-header">
            <h3>Thêm phim</h3>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
          </div>
          <div class="modal-body" id="content-insert">
            <div class="container">
              <div class="row">
                <div class="col-md-4">
                  <input type="hidden" name='id' id='idUpdate' required>
                  <input type="hidden" name='imageOld' id='imageOld'>
                  <input type="hidden" name='type' id='typeMovie'>
                  <div class="form-group">
                    <label for="formGroupExampleInput">Tên phim</label>
                    <input class="form-control" id="nameUpdateMovie" 
                            type="text" 
                            name="name_movie" 
                            placeholder="Tên Phim"
                            required>
                  </div>
                  <div class="form-group">
                    <label for="formGroupExampleInput">Link SD</label>
                    <input class="form-control"
                            id="linkSDUpdateMovie" 
                            type="text" name="clip_SD"
                            required>
                  </div>
                  <div class="form-group">
                    <label for="formGroupExampleInput">Link HD</label>
                    <input class="form-control" 
                            id="linkHDUpdateMovie" 
                            type="text" 
                            name="clip_HD"  
                            required>
                  </div>
                  <div class="form-group">
                    <label for="formGroupExampleInput">Link FHD</label>
                    <input class="form-control" 
                            id="linkFHDUpdateMovie" 
                            type="text" 
                            name="clip_FHD"  
                            required>
                  </div>
                  <div class="form-group">
                    <label for="formGroupExampleInput">Năm</label>
                    <input class="form-control" 
                            id="yearUpdateMovie" 
                            type="text" 
                            name="release_year"  
                            required>
                  </div>
                  <div class="form-group">
                    <label for="formGroupExampleInput">Thời gian</label>
                    <input class="form-control" 
                            id="timeUpdateMovie" 
                            type="text" 
                            name="running_time"  
                            required>

                  </div>
                  <div class="form-group">
                    <label for="formGroupExampleInput">Tuổi</label>
                    <input class="form-control" 
                            id="ageUpdateMovie" 
                            type="text" 
                            name="age"  
                            required>
                  </div>
                  <div class="form-group .main-movie">
                    <label for="formGroupExampleInput">IMAGE</label>
                    <input class="p-0 form-control fileCustom d-flex align-items-center" 
                            id="form-file" 
                            name="image" 
                            type="file">
                    <div class="boximg mt-2"><img class="img-thumbnail" id='imageUpdateMovie' src="" alt=""></div>
                  </div>
                </div>
                <div class="col-md-8">
                  <div class="form-group">
                    <label for="exampleFormControlTextarea2">Mô tả ngắn</label>
                    <textarea class="form-control rounded-0" id="s_descriptionUpdateMovie" name="short_description" rows="5"></textarea>

                    <label for="exampleFormControlTextarea2">Mô tả đầy đủ</label>
                    <textarea class="form-control rounded-0 descriptionUpdateMovie" 
                              id="editor1"  
                              name="description" 
                              required>
                    </textarea>
                    <script>CKEDITOR.replace( 'editor1' )</script>
                  </div>
                  <div class="form-group">
                    <div class="row">
                      <div class="col-md-6">
                        <select class="browser-default custom-select" 
                                name="id_cata" 
                                id='catalogUpdateMovie'>
                          <option selected="" value=''>Thể loại</option>     
                          <?php 
                            foreach ($dsloai as $dsloai) {
                                extract($dsloai);
                                echo '<option value='.$id.'>'.$name_cata.'</option>';
                            }
                          ?>
                        </select>
                      </div>
                      <div class="col-md-6">
                        <select class="browser-default custom-select" name="id_country" id='countryUpdateMovie'>
                          <option selected="">Quốc gia</option>
                          <?php 
                            foreach ($dsqg as $dsqg) {
                                extract($dsqg);
                                echo ' <option value='.$id.'>'.$name_country.'</option>';
                            }
                          ?>
                        </select>
                      </div>
                      <div class="form-group mt-2 col-md-6">
                        <label for="formGroupExampleInput">IMBS</label>
                        <input class="form-control" 
                              id="evaluate" 
                              name="evaluate" 
                              type="number"
                              step='0.1'
                              max='10'
                              min='1'
                              required>
                      </div>
                      <div class="col-md-6 mt-2">
                        <label for="formGroupExampleInput">Phim</label>
                        <select name="type" id="typeUpdateMovie" class="custom-select">
                          <option>Phim lẻ</option>
                          <option>Phim bộ</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="form-group d-flex"  id='reslutionUpdateMovie'>
                    <div class="custom-control custom-radio mr-auto" >
                      <input class="custom-control-input resolution" value='SD' id="reslutionSD" type="radio" name="resolution" checked="">
                      <label class="custom-control-label " for="reslutionSD">SD</label>
                    </div>
                    <!-- Group of default radios - option 2-->
                    <div class="custom-control custom-radio mr-auto">
                      <input class="custom-control-input resolution" value='HD' id="reslutionHD" type="radio" name="resolution">
                      <label class="custom-control-label" for="reslutionHD">HD</label>
                    </div>
                    <!-- Group of default radios - option 3-->
                    <div class="custom-control custom-radio mr-auto">
                      <input class="custom-control-input resolution" value='FHD' id="reslutionFHD" type="radio" name="resolution">
                      <label class="custom-control-label" for="reslutionFHD">FHD</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary btn-sm" type="button" data-dismiss="modal">Close</button>
            <button class="btn btn-warning btn-sm" type="reset">Reset</button>
            <input class="btn btn-primary btn-sm" type="submit" value="Insert" name="addnew" id='buttonIU'>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- MODAL IMAGE -->
<div class="modal fade " id="EditImage" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
  <div class="modal-dialog modal-md" role="form">
    <div class="modal-content">
      <div class="modal-header">
        <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body">
        <div class="list-Image "></div>
        <button class="button-delete-image btn m-0 mb-3  mt-3 peach-gradient">Delete</button>
        <div class="form-group ">
          
          <label for="formGroupExampleInput">IMAGE</label>
          <div class="row no-gutters">
            <div class="col-9">
              <input class="p-0 form-control fileCustom d-flex align-items-center" id="form-file-image" type="file" multiple>
            </div>
            <div class="col-3">
              <div class="box-button btn-image-insert h-100">
                <button class="btn btn-sm blue-gradient m-0 h-100">Insert Image</button>
              </div>
            </div>
          </div>
          <div class="boxImageLoad row p-2"></div>
        </div>
      </div>
    </div>
  </div>
</div>