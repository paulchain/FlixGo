<?php 

if(isset($_SESSION['user'])){
    $name = $_SESSION['user']['name'];
    $avatar = $_SESSION['user']['avatar'];
}

?>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 navAdmin">
            <div class="nav d-flex align-items-center">
                <img class="mr-3 avatarAdmin" 
                    src="./public/img/<?=$avatar?>" 
                    alt="" 
                    style=''>
                <p class="mr-auto mb-0"><?=$name?></p>
                <a class="" href="#">         
                    <div class="notification">
                        <img class="w-20"  src="./public/img/bell.png" alt="">
                        <p>12</p>
                    </div>
                </a>
                <a data-toggle="modal" data-target="#logout" href="javascript:void(0)"><img class="w-20" src="./public/img/logout.png" alt=""></a>
            </div>
        </div>
    </div>
</div>


<div class="modal bounceInLeft animated p-1 notificationAdmin" id="logout" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md" >
    <div class="modal-content">
        <div class="modal-body">
            <p class='text-center m-0'>Bạn chắn chắn muốn thoát ?</p>
        </div>
        <div class="d-flex flex-wrap modal-footer p-1">
            <div class="mr-auto"></div>
            <button class="btn btn-info btn-sm" type="button" data-dismiss="modal">Đóng</button>
            <button class="btn btn-success btn-sm" type="button">Tiếp tục</button>
        </div>
    </div>  
  </div>
</div>