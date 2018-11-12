<?php

require 'restful_api.php';
    require '../DAO/loai.php';
class login extends restful_api {

	function __construct(){
		parent::__construct();
	}

	function login(){
		if ($this->method == 'GET'){
			$data = loai_select_all();
			$this->response(200, $data);
			// Hãy viết code xử lý LẤY dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}
		elseif ($this->method == 'POST'){
			$data = 'YOU USE METHOD POST';
			$this->response(200, $data);
		}
		elseif ($this->method == 'PUT'){
			// Hãy viết code xử lý CẬP NHẬT dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}
		elseif ($this->method == 'DELETE'){
			// Hãy viết code xử lý XÓA dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}else{
			$data = '';
			$this->response(404, $data);
		}
	}
}

   $login = new login();
?>
