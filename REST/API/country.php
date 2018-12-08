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
		if ($this->method == 'GET'){
			$name_country = $_GET['name_country'];
			if (country_insert($name_country) == 1){
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
			$id_country = $_GET['id_country'];
			$name_country = $_GET['name_country'];
			if (country_update($id_country, $name_country) == 1){
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
			$id_country = $_GET['id_country'];
			if (country_delete($id_country) == 1){
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
