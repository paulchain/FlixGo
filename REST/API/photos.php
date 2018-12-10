<?php

require 'restful_api.php';
    require '../DAO/photos.php';
class photos extends restful_api {
	function __construct(){
		parent::__construct();
	}
	function photos(){
		if ($this->method == 'GET'){
			$data = photos_select_all();
			$this->response(200, $data);
			// Hãy viết code xử lý LẤY dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}
	}
	function insert(){
		if ($this->method == 'GET'){
			$link = $_GET['link'];
			$id_movie = $_GET['id_movie'];
			if (photos_insert($link,$id_movie) == 1) {
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
			$id = $_GET['id'];
			$link = $_GET['link'];
			$id_movie = $_GET['id_movie'];
			if (photos_update($id, $link,$id_movie) == 1) {
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
			$id = $_GET['id'];
			if (photos_delete($id) == 1){
				$data = 'Xóa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi xóa';
				$this->response(404, $data);
			}
		}
	}
}
$photos = new photos();
?>
