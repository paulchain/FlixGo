<?php

require 'restful_api.php';
    require '../DAO/customer.php';
class login extends restful_api {
	function __construct(){
		parent::__construct();
	}
	function login(){
		if ($this->method == 'GET'){
			$data = login_select_all();
			$this->response(200, $data);
			// Hãy viết code xử lý LẤY dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}
	}
	function insert(){
		if ($this->method == 'GET'){
			$name = $_GET['name_customer'];
			$password = $_GET['password'];
			$email = $_GET['email'];
			$avatar = $_GET['avatar'];
			$id_pricing = $_GET['id_pricing'];
			if (login_insert($name,$password,$email,$avatar,$id_pricing) == 1){
				$data = 'Đăng ký thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi đăng ký';
				$this->response(404, $data);
			}
		}
	}
	function update(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			$name = $_GET['name_customer'];
			$password = $_GET['password'];
			$email = $_GET['email'];
			$avatar = $_GET['avatar'];
			$id_pricing = $_GET['id_pricing'];
			if (login_update($id, $name,$password,$email,$avatar,$id_pricing) == 1){
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
			$id_customer = $_GET['id'];
			if (login_delete($id) == 1){
				$data = 'Xóa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi xóa';
				$this->response(404, $data);
			}
		}
	}
}
$login = new login();
?>
