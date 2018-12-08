<?php

require 'restful_api.php';
    require '../DAO/movie.php';
class movie extends restful_api {
	function __construct(){
		parent::__construct();
	}

	function GetImage(){
		if ($this->method == 'POST'){
			if(true){
				$this->response(200, $_FILES);
			}else{
				echo 'lỗ';
			}
			
		}
	}
	//------------------------------------------
	// Hàm lấy tất cả movie
	function GetAllMovie(){
		if ($this->method == 'GET'){
			$data = movie_select_all();
			$this->response(200, $data);
		}
	}

	//------------------------------------------
	// Hàm lấy movie từ thể loại phim
	function GetMovieByIdCatalog(){
		if ($this->method == 'GET'){
            $id_cata = $_GET['id_cata'];
            $data = movie_select_all_by_id($id_cata);
			$this->response(200, $data);
		}
	}
	
	//------------------------------------------
	// API lấy nội dung của phim đó 
	function GetMovieById(){
		if ($this->method == 'GET'){
            $id_movie = $_GET['id_movie'];
			$data = movie_select_by_id($id_movie);
			$this->response(200, $data);
		}
    }
	
	//------------------------------------------
	// API lấy nội dung của phim đó 
	function Insert(){
		if ($this->method == 'GET'){
			$name_movie = $_GET['name_movie'];
            $release_year = $_GET['release_year'];
            $running_time = $_GET['running_time'];
            $id_country = $_GET['id_country'];
            $description = $_GET['description'];
            $images = $_GET['images'];
            $clips = $_GET['clips'];
            $age = $_GET['age'];
            $resolution = $_GET['resolution'];
            $id_cata = $_GET['id_cata'];
            if ( is_numeric($release_year) && is_numeric($running_time) && is_numeric($age)) {
                movie_insert($name_movie,$release_year,$running_time,$id_country,$description,$images,$clips,$age,$resolution,$id_cata);
                    $data = 'Thêm thành công';
                    $this->response(200, $data);
            }else{
                $data = 'Lỗi thêm';
                $this->response(404, $data);
            }
		}
	}
	function update(){
		if ($this->method == 'GET'){
			$id_movie = $_GET['id_movie'];
			$name_movie = $_GET['name_movie'];
            $release_year = $_GET['release_year'];
            $running_time = $_GET['running_time'];
            $id_country = $_GET['id_country'];
            $description = $_GET['description'];
            $images = $_GET['images'];
            $clips = $_GET['clips'];
            $age = $_GET['age'];
            $resolution = $_GET['resolution'];
            $id_cata = $_GET['id_cata'];
            if ( is_numeric($release_year) && is_numeric($running_time) && is_numeric($age)) {
                movie_update($id_movie, $name_movie,$release_year,$running_time,$id_country,$description,$images,$clips,
                $age,$resolution,$id_cata);
                    $data = 'Sửa thành công';
                    $this->response(200, $data);
            }else{
                $data = 'Lỗi Sửa';
                $this->response(404, $data);
            }
		}
	}
	function delete(){
		if ($this->method == 'GET'){
			$id_movie = $_GET['id_movie'];
			if (movie_delete($id_movie) == 1){
				$data = 'Xóa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi xóa';
				$this->response(404, $data);
			}
		}
	}
}
$movie = new movie();
?>
