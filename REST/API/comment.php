<?php

require 'restful_api.php';
    require '../DAO/comment.php';
class comment extends restful_api {
	function __construct(){
		parent::__construct();
	}
	function comment(){
		if ($this->method == 'GET'){
			$data = comment_select_all();
			$this->response(200, $data);
			// Hãy viết code xử lý LẤY dữ liệu ở đây
			// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
		}
	}
	function insert(){
		if ($this->method == 'GET'){
			$content = $_GET['content'];
            $id_customer = $_GET['id_customer'];
            $id_movie = $_GET['id_movie'];
            $full_name = $_GET['full_name'];
            $likes = $_GET['likes'];
            $unlikes = $_GET['unlikes'];
            $types = $_GET['types'];
			if (is_numeric($likes) && is_numeric($unlikes) && is_numeric($types)) {
				comment_insert($content,$id_customer,$id_movie,$full_name,$likes,$unlikes,$types);
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
			$id_comment = $_GET['id_comment'];
			$content = $_GET['content'];
            $id_customer = $_GET['id_customer'];
            $id_movie = $_GET['id_movie'];
            $full_name = $_GET['full_name'];
            $likes = $_GET['likes'];
            $unlikes = $_GET['unlikes'];
            $types = $_GET['types'];
			if (is_numeric($likes) && is_numeric($unlikes) && is_numeric($types)) {
				comment_update($id_comment, $content,$id_customer,$id_movie,$full_name,$likes,$unlikes,$types);
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
			$id_comment = $_GET['id_comment'];
			if (comment_delete($id_comment) == 1){
				$data = 'Xóa thành công';
				$this->response(200, $data);
			}else{
				$data = 'Lỗi xóa';
				$this->response(404, $data);
			}
		}
	}
}
$comment = new comment();
?>
