<?php

require 'restful_api.php';
    require '../DAO/country.php';
class country extends restful_api {
	function __construct(){
		parent::__construct();
	}
	function country(){
		if ($this->method == 'GET'){
			$data = country_select_all();
			$this->response(200, $data);
			// Hãy viết code xử lý LẤY dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}
	}
	function insert(){
		if ($this->method == 'POST'){
			$name_country = $_POST['name_country'];
			if (country_insert($name_country) == 1){
				$data = 'Thêm thành công';
				// $this->response(200, $data);
			}else{
				$data = 'Lỗi thêm';
				// $this->response(404, $data);
			}
		}
	}
	function getOne(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			$data = country_select_by_id($id);
			$this->response(200,$data);
		}
	}
	function update(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			$name_country = $_GET['name'];
			if (country_update($id, $name_country) == 1){
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
			$id = $_GET['id'];
			if (country_delete($id) == 1){
				$data = 'Xóa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi xóa';
				$this->response(404, $data);
			}
		}
	}
}
$country = new country();
?>
