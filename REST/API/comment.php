<?php

require 'restful_api.php';
require '../DAO/comment.php';
class comment extends restful_api {
	function __construct(){
		parent::__construct();
	}

	//------------------------------------------
	// Hàm lấy tất cả movie
	function GetCommentByIdMovie(){
		if ($this->method == 'GET'){
			$data = comment_select_all();
			$this->response(200, $data);
		}
	}
	function insert(){
		if ($this->method == 'GET'){
			$content = $_GET['content'];
            $id_customer = $_GET['id_customer'];
            $id_movie = $_GET['id_movie'];
			if (comment_insert($content,$id_customer,$id_movie) == 1) {
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
			$content = $_GET['content'];
            $id_customer = $_GET['id_customer'];
            $id_movie = $_GET['id_movie'];
			if (comment_update($id, $content,$id_customer,$id_movie) == 1) {
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
			$id_comment = $_GET['id'];
			if (comment_delete($id_comment) == 1){
				$data = 'Xóa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi xóa';
				$this->response(404, $data);
			}
		}
	}

	function commentinfo(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			$data  = comment_select_info($id);
			$this->response(200, $data);
		}
	}
}
$comment = new comment();
?>
