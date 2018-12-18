<?php

require 'restful_api.php';
    require '../DAO/movie_series.php';
class movie_series extends restful_api {
	function __construct(){
		parent::__construct();
	}

	// HÀM LẤY PAGE VÀ TẬP ID MOVIE
	function movie_series(){
		if ($this->method == 'GET'){
			$page = $_GET['page'];
			$id_movie = $_GET['id_movie'];
			$number = 10;
			$data = movie_series_by_page_idmovie($page,$number,$id_movie);
			$this->response(200, $data);
		}
	}

	//HÀM XÓA TẬP PHIM 
	function delete(){
		if ($this->method == 'GET'){
			$id_series = $_GET['id_series'];
			$data = movie_series_delete($id_series);
			$this->response(200, $data);
		}
	}

	//HÀM LẤY THÔNG TIN CỦA TẬP
	function movie_series_by_id(){
		if ($this->method == 'GET'){
			$id_series = $_GET['id_series'];
			$data = movie_series_by_id($id_series);
			$this->response(200, $data);
		}
	}


	function insert(){
		if ($this->method == 'POST'){
			$episodes = $_POST['episodes'];
            $title = $_POST['title'];
            $id_movie = $_POST['id'];
            $clip_SD = $_POST['linksd'];
            $clip_HD = $_POST['linkhd'];
            $clip_FHD = $_POST['linkfhd'];	
			$data = movie_series_insert($episodes,$title,$id_movie,$clip_SD,$clip_HD,$clip_FHD);
			$this->response(200, $data);
		}
	}


// HÀM SỬA THÔNG TIN
	function update(){
		if ($this->method == 'POST'){
			$id_series = $_POST['id_series'];
			$episodes = $_POST['episodes'];
            $title = $_POST['title'];
            $id_movie = $_POST['id'];
            $clip_SD = $_POST['linksd'];
            $clip_HD = $_POST['linkhd'];
            $clip_FHD = $_POST['linkfhd'];	
			$data = movie_series_update($id_series, $episodes,$title,$id_movie,$clip_SD,$clip_HD,$clip_FHD);
			$this->response(200, $data);
		}
	}
	
}
$movie_series = new movie_series();
?>
