<?php

require 'restful_api.php';
    require '../DAO/movie.php';
class user extends restful_api {
	function __construct(){
		parent::__construct();
	}
	function movie(){
		if ($this->method == 'GET'){
			$data = movie_select_all();
			$this->response(200, $data);
			// Hãy viết code xử lý LẤY dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}
	}
	function insert(){
		if ($this->method == 'GET'){
			$name_movie = $_GET['name_movie'];
            $genre = $_GET['genre'];
            $release_year = $_GET['release_year'];
            $running_time = $_GET['running_time'];
            $country = $_GET['country'];
            $description = $_GET['description'];
            $images = $_GET['images'];
            $clips = $_GET['clips'];
            $age = $_GET['age'];
            $resolution = $_GET['resolution'];
            $id_cata = $_GET['id_cata'];
            if ( is_numeric($release_year) && is_numeric($running_time) && is_numeric($age)) {
                movie_insert($name_movie,$genre,$release_year,$running_time,$country,$description,$images,$clips,$age,
                $resolution,$id_cata);
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
            $genre = $_GET['genre'];
            $release_year = $_GET['release_year'];
            $running_time = $_GET['running_time'];
            $country = $_GET['country'];
            $description = $_GET['description'];
            $images = $_GET['images'];
            $clips = $_GET['clips'];
            $age = $_GET['age'];
            $resolution = $_GET['resolution'];
            $id_cata = $_GET['id_cata'];
            if ( is_numeric($release_year) && is_numeric($running_time) && is_numeric($age)) {
                movie_update($id_movie, $name_movie,$genre,$release_year,$running_time,$country,$description,$images,$clips,
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
$user = new user();
?>
