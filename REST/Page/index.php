<?php
    // import function default by DAO
    require '../DAO/pdo.php';
    
    // import function in catalog
    require_once '../DAO/catalog.php';
    require_once '../DAO/movie.php';
    require_once '../DAO/country.php';
    require_once '../DAO/photos.php';


    require_once 'view/template/header.php';
        //main
    if(isset($_GET['page'])){
        if($_GET['page'] == "catalog"){
            require 'view/catalog.php';
        }elseif($_GET['page'] == "movie"){
            require 'view/movie.php';
        }elseif($_GET['page'] == "user"){
            require 'view/user.php';
        }else{
            require 'view/home.php';
        }
    }else{
        require 'view/home.php';
    }
        //main
        require_once 'view/template/footer.php';
?>