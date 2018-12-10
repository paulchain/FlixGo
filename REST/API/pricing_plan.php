<?php

require 'restful_api.php';
    require '../DAO/pricing_plan.php';
class pricing_plan extends restful_api {
	function __construct(){
		parent::__construct();
	}
	function pricing_plan(){
		if ($this->method == 'GET'){
			$data = pricing_plan_select_all();
			$this->response(200, $data);
			// Hãy viết code xử lý LẤY dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}
	}
	function insert(){
		if ($this->method == 'GET'){
			$name = $_GET['name'];
            $price = $_GET['price'];
            $time_limit = $_GET['time_limit'];
            $resolution = $_GET['resolution'];
            $availability = $_GET['availability'];
            $device = $_GET['device'];
            $support = $_GET['support'];
            $description = $_GET['description'];
            if (is_numeric($price)) {
                pricing_plan_insert($name,$price,$time_limit,$resolution,$availability,$device,$support,$description);
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
			$name = $_GET['name'];
            $price = $_GET['price'];
            $time_limit = $_GET['time_limit'];
            $resolution = $_GET['resolution'];
            $availability = $_GET['availability'];
            $device = $_GET['device'];
            $support = $_GET['support'];
            $description = $_GET['description'];
            if (is_numeric($price)) {
                pricing_plan_update($id, $name,$price,$time_limit,$resolution,$availability,$device,$support,$description);
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
			if (pricing_plan_delete($id) == 1){
				$data = 'Xóa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi xóa';
				$this->response(404, $data);
			}
		}
	}
}
$pricing_plan = new pricing_plan();
?>
