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
			$package = $_GET['package'];
            $price = $_GET['price'];
            $time = $_GET['time'];
            $resolution = $_GET['resolution'];
            $availability = $_GET['availability'];
            $device = $_GET['device'];
            $support = $_GET['support'];
            $describe_1 = $_GET['describe_1'];
            $describe_2 = $_GET['describe_2'];
            $id_customer = $_GET['id_customer'];
            if (is_numeric($price)) {
                pricing_plan_insert($package,$price,$time,$resolution,$availability,$device,$support,$describe_1,$describe_2,$id_customer);
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
			$id_pricing = $_GET['id_pricing'];
			$package = $_GET['package'];
            $price = $_GET['price'];
            $time = $_GET['time'];
            $resolution = $_GET['resolution'];
            $availability = $_GET['availability'];
            $device = $_GET['device'];
            $support = $_GET['support'];
            $describe_1 = $_GET['describe_1'];
            $describe_2 = $_GET['describe_2'];
            $id_customer = $_GET['id_customer'];
            if (is_numeric($price)) {
                pricing_plan_update($id_pricing, $package,$price,$time,$resolution,$availability,$device,$support,$describe_1,$describe_2,$id_customer);
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
			$id_pricing = $_GET['id_pricing'];
			if (pricing_plan_delete($id_pricing) == 1){
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
