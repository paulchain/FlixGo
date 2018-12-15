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
			$id = $_GET['id'];
			$data = catalog_select_by_id($id);
			$this->response(200, $data);
		}
	}

	//------------------------------------------
	// Hàm lấy tất cả movie
	function insert(){
		if ($this->method == 'POST'){
			$location = $_POST['location'];
			$name_cata = $_POST['namecata'];
			$data = 0;
			if (is_numeric($location)) {
				$data = catalog_insert($location,$name_cata);
			}
			$this->response(200, $data);
		}
	}
	function update(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			$location = $_GET['location'];
			$name_cata = $_GET['namecata'];
			if (is_numeric($location)) {
				$data = catalog_update($id, $location,$name_cata);
			}else{
				$data = false;
			}
			$this->response(200, $data);
		}
	}
	function delete(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			$data =  catalog_delete($id);
			$this->response(200, $data);
		}
	}
}
$catalog = new catalog();
?>
