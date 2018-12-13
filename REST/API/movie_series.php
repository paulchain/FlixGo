<?php

require 'restful_api.php';
    require '../DAO/movie_series.php';
class movie_series extends restful_api {
	function __construct(){
		parent::__construct();
	}
	function movie_series(){
		if ($this->method == 'GET'){
			$data = movie_series_select_all();
			$this->response(200, $data);
			// Hãy viết code xử lý LẤY dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}
	}
	function insert(){
		if ($this->method == 'GET'){
			$episodes = $_GET['episodes'];
            $title = $_GET['title'];
            $id_movie = $_GET['id_movie'];
            $clip_SD = $_GET['clip_SD'];
            $clip_HD = $_GET['clip_HD'];
            $clip_FHD = $_GET['clip_FHD'];
			if (is_numeric($episodes)) {
				movie_series_insert($episodes,$title,$id_movie,$clip_SD,$clip_HD,$clip_FHD);
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
			$id_series = $_GET['id_series'];
			$episodes = $_GET['episodes'];
            $title = $_GET['title'];
            $id_movie = $_GET['id_movie'];
            $clip_SD = $_GET['clip_SD'];
            $clip_HD = $_GET['clip_HD'];
            $clip_FHD = $_GET['clip_FHD'];
			if (is_numeric($episodes)) {
				movie_series_update($id_series, $episodes,$title,$id_movie,$clip_SD,$clip_HD,$clip_FHD);
				$data = 'Sửa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi sửa';
				$this->response(404, $data);
			}
		}
	}
	function delete(){
		if ($this->method == 'GET'){
			$id_series = $_GET['id_series'];
			if (movie_series_delete($id_series) == 1){
				$data = 'Xóa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi xóa';
				$this->response(404, $data);
			}
		}
	}
}
$movie_series = new movie_series();
?>
