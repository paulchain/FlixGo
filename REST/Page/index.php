<?php
    session_start();
    // import function default by DAO
    require '../DAO/pdo.php';
    
    // import function in catalog
    require_once '../DAO/catalog.php';
    require_once '../DAO/movie.php';
    require_once '../DAO/country.php';
    require_once '../DAO/photos.php';
    require_once '../DAO/customer.php';
    require_once '../DAO/comment.php';
    require_once '../DAO/movie_series.php';

    require_once 'view/template/header.php';
        //main
    if(isset($_GET['page'])){
        if($_GET['page'] == "catalog"){
            require 'view/template/menu.php';
            require 'view/catalog.php';
        }elseif($_GET['page'] == "movie"){
            require 'view/template/menu.php';
            require 'view/movie.php';
        }elseif($_GET['page'] == "movie-series"){
            require 'view/template/menu.php';
            require 'view/movie-series.php';
        }elseif($_GET['page'] == "customer"){
            require 'view/template/menu.php';
            require 'view/customer.php';
        }elseif($_GET['page'] == "country"){
            require 'view/template/menu.php';
            require 'view/country.php';
        }elseif($_GET['page'] == "comment"){
            require 'view/template/menu.php';
            require 'view/comment.php';
        }else{
            require 'view/home.php';
        }
    }else{
        require 'view/login.php';
    }
        //main
    require_once 'view/template/footer.php';
?>