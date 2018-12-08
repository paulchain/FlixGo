<?php

require 'restful_api.php';
    require '../DAO/catalog.php';
class catalog extends restful_api {
	function __construct(){
		parent::__construct();
	}

	//------------------------------------------
	// API lấy danh sách thể loại - danh mục
	function GetAllCatalog(){
		if ($this->method == 'GET'){
			$data = catalog_select_all();
			$this->response(200, $data);
		}
	}
	function GetCatalogById(){
		if ($this->method == 'GET'){
			$id = $_GET['id_cata'];
			$data = catalog_select_by_id($id);
			$this->response(200, $data);
		}
	}

	//------------------------------------------
	// Hàm lấy tất cả movie
	function insert(){
		if ($this->method == 'GET'){
			$name_cata = $_GET['name_cata'];
			$stt = $_GET['stt'];
			if (is_numeric($stt)) {
				catalog_insert($name_cata,$stt);
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
			$id_cata = $_GET['id_cata'];
			$name_cata = $_GET['name_cata'];
			$stt = $_GET['stt'];
			if (is_numeric($stt)) {
				catalog_update($id_cata, $name_cata,$stt);
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
			$id_cata = $_GET['id_cata'];
			if (catalog_delete($id_cata) == 1){
				$data = 'Xóa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi xóa';
				$this->response(404, $data);
			}
		}
	}
}
$catalog = new catalog();
?>
