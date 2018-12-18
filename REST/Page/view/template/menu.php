
<?php 
    if($_REQUEST['page'])
        $page = $_REQUEST['page'];
    else
        $page = '';
?>

<div class="menu col-md-2">
    <nav class="navMenu">
        <a class="" href="index.php"><img src="./public/img/logo.png" id=logo alt=""></a>
        <ul>
            <li><a class=" nav-link " href="index.php"><img src="./public/img/home.png" alt=""><span>Trang chủ</span></a></li>
            <li><a class=" nav-link <?php echo $page =='catalog' ?  'activemenu' :  '' ?>" href="index.php?page=catalog"><img src="./public/img/catalog.png" alt=""><span>Danh mục</span></a></li>
            <li><a class=" nav-link <?php echo $page =='movie'?  'activemenu' :  '' ?>" href="index.php?page=movie"><img src="./public/img/movie.png" alt=""><span>Phim</span></a></li>
            <li><a class=" nav-link <?php echo $page =='customer'?  'activemenu' :  '' ?>" href="index.php?page=customer"><img src="./public/img/customer.png" alt=""><span>Người dùng</span></a></li>
            <li><a class=" nav-link <?php echo $page =='country'?  'activemenu' :  '' ?>" href="index.php?page=country"><img src="./public/img/country.png" alt=""><span>Quốc gia</span></a></li>
            <li><a class=" nav-link <?php echo $page =='comment'?  'activemenu' :  '' ?>" href="index.php?page=comment"><img src="./public/img/comment.png" alt=""><span>Bình luận</span></a></li>
            <li><a class=" nav-link <?php echo $page =='package'?  'activemenu' :  '' ?>" href="index.php?page=package"><img src="./public/img/package.png" alt=""><span>Gói phim</span></a></li>
            
        </ul>
    </nav>
</div>
<div class="col-md-2 ">
</div>

<!-- <script>
    window.onload = function(){
        var list menu = document.getElementsByClassName('nav-item');
        console.log( );
        var strUrl = window.location.href;
        if(strUrl.indexOf('user')){

        }
    };

</script> -->