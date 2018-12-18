<?php
  $id = $_GET['id'];
  $movie_series = movie_series_select_by_id_movie($id);
  $movie = movie_select_by_id($id);
?>
<section class="main-movie col-md-10">
    <!-- modal custom -->
    <img src="" alt="" class='backgroundTotal'>
    <div class="alert-success alertCustom bg blue-gradient"><?=$message?></div>
    <!-- --------------- -->
    <div class="container-fluid mainLoad mt-5">
      <div class="row mt-5">

        <!-- TABLE -->
        <div class="col-8 ">
          <div class="flex-wrap d-flex align-items-center">
            <button class="btn blue-gradient m-0 mr-auto" data-toggle="modal" id='btn-insert' data-target="#modalForm" title="Thêm phim mới"><i class="fas fa-plus"></i></button>
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
          <table class="table mt-2 table-striped bg-white font-weight-bold mb-0 p-4">
            <thead>
              <tr p-4>
                <th scope="col">Mã</th>
                <th scope="col">Tập phim</th>
                <th scope="col">Tiêu đề</th>
                <th scope="col">Sửa</th>
                <th scope="col">Xóa</th>
              </tr>
            </thead>
            <tbody>
              <?php
                foreach ($movie_series as $key => $value) {
                  extract($value);
                  echo"<tr data-id='$id_series'>
                    <td class='font-weight-light h6'>$id_series</td>
                    <td class='font-weight-light h6'>$episodes</td>
                    <td class='font-weight-light h6'>$title</td> 
                    <td> <a data-toggle='modal' class='btn-update' data-id='$id' data-target='#modalForm' title='Update movie' href='javascript:void()'><img src='./public/img/edit.png' alt=''></a> </td>
                    <td><a class='deleteMovie' href='javascript:void(0)'> <img src='./public/img/trash.png' alt=''></a></td>
                  </tr>";
                }
                  
              ?>
                  <!-- modal image -->
              <div class="modal fade" id="EditImage" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
                <div class="modal-dialog modal-md" role="form">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                      <div class="list-Image "></div>
                      <div class="button-delete-image btn btn-warning">Delete Image Selects</div>
                      <div class="form-group ">
                        <div class="box-button btn-image-insert">
                          <button class="btn btn-sm blue-gradient">Insert Image</button>
                        </div>
                        <label for="formGroupExampleInput">IMAGE</label>
                        <input class="p-0 form-control fileCustom d-flex align-items-center" id="form-file-image" type="file" multiple>
                        <div class="boxImageLoad row p-2"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </tbody>
          </table>
          <nav class="d-flex bg blue-gradient w-100" aria-label="Page navigation example">
            <div class="mr-auto"></div>

            <!-- NAV của phi m lẽ -->
            <ul class="pagination navPage1 pagination-circle  mb-0 mt-1 pt-2 pb-2">
              <li class="page-item"><a class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
              <?php  
                $countMovie = countMovieSeries($id)[0][0];
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
          </nav>
          <a href='index.php?page=movie' class="btn blue-gradient m-0 mt-3 mr-auto" title="Thêm phim mới"><i class="fas fa-chevron-left mr-3"></i>Quay lại</a>
        </div>

        <!-- COL-MD-4 CARD IMAGE  -->
         <?php 
          extract($movie);
          ?>
        <div class="col-4 ">
          <div class="mt-2" role="">
            <div class="modal-content">
              <div class="modal-body p-0" id="content-insert">
                <div class="card">
                  <div class="view overlay"><img class="card-img-top" id="modal-movie-img" src="./public/img/<?=$image?>" alt="Card image cap"><a href="#!"></a>
                    <div class="mask rgba-white-slight"></div>
                  </div>
                  <div class="card-body p-0">
                    <h4 class="card-title mt-4 text-center" id="modal-movie-name">B<?=$movie?></h4>
                    <p class="card-text " id="modal-movie-short_description"><?=$short_description?></p>
                    <ul class="list-unstyled d-flex mt-3 flex-wrap">
                      <li class="">
                        <div class="btn bg blue-gradient" id="modal-movie-age"><?=$age?>+</div>
                      </li>
                      <li class="ml-2">
                        <div class="btn bg blue-gradient" id="modal-movie-release_year"><?=$release_year?></div>
                      </li>
                      <li class="ml-2">
                        <div class="btn blue-gradient" id="modal-movie-country"><?=$country?></div>
                      </li>
                      <li class="ml-2">
                        <div class="btn blue-gradient" id="modal-movie-resolution"><?=$resolution?></div>
                      </li> 
                      <li class="ml-2">
                        <div class="btn blue-gradient" id="modal-movie-time"><?=$running_time?>'</div>
                      </li> 
                      <li class="">
                        <div class="btn blue-gradient" id="modal-movie-name-cata"><?=$catalog?></div>
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
    <iframe width="500" height="300" src="https://www.youtube.com/embed/l-u3PdA-rpY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  </section>

<!-- MODAL -->
<div class="modal fade" id="modalForm" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
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
                  <input type="hidden" name='id' value='<?=$id?>' id='id_movie' required>
                  <input type="hidden" name='id_series' value='' id='id_series' required>
                  <div class="form-group">
                    <label for="episodes">Tập phim</label>
                    <input class="form-control" id="episodes" 
                            type="number" 
                            name="episodes" 
                            placeholder="Tập phim"
                            required>
                  </div>
                  
                  <div class="form-group">
                    <label for="title">Tiêu đề</label>
                    <input class="form-control" 
                            id="title" 
                            type="text" 
                            name="title"
                            placeholder='Tiêu đề' 
                            required>
                  </div>
                </div>
                <div class="col-md-8">
                  <div class="form-group">
                    <label for="linksd">Link SD</label>
                    <input class="form-control"
                            id="linksd" 
                            type="text" name="clip_SD"
                            placeholder='Link SD'
                            required>
                  </div>
                  <div class="form-group">
                    <label for="linkhd">Link HD</label>
                    <input class="form-control" 
                            id="linkhd" 
                            type="text" 
                            name="clip_HD"
                            placeholder='Link HD'
                            required>
                    </div>
                    <div class="form-group">
                    <label for="linkfhd">Link FHD</label>
                    <input class="form-control" 
                            id="linkfhd" 
                            type="text" 
                            name="clip_FHD"
                            placeholder='Link FHD'
                            required>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary btn-sm" type="button" data-dismiss="modal">Close</button>
            <button class="btn btn-warning btn-sm" type="reset">Reset</button>
            <button class="btn btn-primary btn-sm" type="button"  name="addMovie" data-dismiss="modal" id='btnInsert'>Insert</button>
            <button class="btn btn-primary btn-sm d-none"  value="Update" name="updateMovie" id='btnUpdate' data-dismiss="modal">Update</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<script src="public/js/thuvien.js"></script>
<script src="public/js/movie_series.js"></script>