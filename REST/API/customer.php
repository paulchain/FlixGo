<?php

require 'restful_api.php';
require '../DAO/customer.php';

class login extends restful_api {
	function __construct(){
		parent::__construct();
	}
	function login(){
		if ($this->method == 'POST'){
			$data = 10;
			$email = $_POST['email'];
			$password = $_POST['password'];
			$role = $_POST['role'];
			$data = login($email,$password,$role);		
			$this->response(200, $data);
		}
	}
	function insert(){
		if ($this->method == 'GET'){
			$name = $_GET['name_customer'];
			$password = $_GET['password'];
			$email = $_GET['email'];
			$avatar = $_GET['avatar'];
			$id_pricing = $_GET['id_pricing'];
			$data = login_insert($name,$password,$email,$avatar,$date);
			if($data){
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
			if (login_update($id, $name,$password,$email,$avatar,$date) == 1){
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
	function customerByid(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			$data = customer_select_by_id($id);
			$this->response(200, $data );
		}
	}

}

$login = new login();
?>
