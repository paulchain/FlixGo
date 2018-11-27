<?php

require 'restful_api.php';
    require '../DAO/comment_kids.php';
class comment_kids extends restful_api {
	function __construct(){
		parent::__construct();
	}
	function comment_kids(){
		if ($this->method == 'GET'){
			$data = comment_kids_select_all();
			$this->response(200, $data);
			// Hãy viết code xử lý LẤY dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}
	}
	function insert(){
		if ($this->method == 'GET'){
			$id_comment = $_GET['id_comment'];
            $id_customer = $_GET['id_customer'];
            $content = $_GET['content'];
            $likes = $_GET['likes'];
            $unlikes = $_GET['unlikes'];
			if (is_numeric($likes) && is_numeric($unlikes)) {
				comment_kids_insert($id_comment,$id_customer,$content,$likes,$unlikes);
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
			$id_comment = $_GET['id_comment'];
            $id_customer = $_GET['id_customer'];
            $content = $_GET['content'];
            $likes = $_GET['likes'];
            $unlikes = $_GET['unlikes'];
			if (is_numeric($likes) && is_numeric($unlikes)) {
				comment_kids_update($id, $id_comment,$id_customer,$content,$likes,$unlikes);
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
			if (comment_kids_delete($id) == 1){
				$data = 'Xóa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi xóa';
				$this->response(404, $data);
			}
		}
	}
}
$comment_kids = new comment_kids();
?>
