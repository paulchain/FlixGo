<?php

require 'restful_api.php';
    require '../DAO/movie.php';
    require '../DAO/photos.php';
class movie extends restful_api {
	function __construct(){
		parent::__construct();
	}
	// 
	function GetImage(){
		if ($this->method == 'POST'){
			if(true){
				$this->response(200, $_FILES);
			}else{
				echo 'lỗ';
			}
		}
	}

	//Demo 



	//Lấy phim lẽ hoặc phim bộ và trang
	function showMovieTemplate(){
		$type = $_GET['type'];
		$page = $_GET['page'];
		$data = movie_page_and_type($type,$page,12);
		$this->response(200, $data);
	}


	//------------------------------------------
	// Hàm lấy tất cả movie
	function GetAllMovie(){
		if ($this->method == 'GET'){
			$data = movie_select_all();
			$this->response(200, $data);
		}
	}

	function GetAllInfomation(){
		if ($this->method == 'GET'){
			$data = SelectAllInfo();
			$this->response(200, $data);
		}
	}

	//------------------------------------------
	// Hàm lấy movie từ thể loại phim
	function GetMovieByIdCatalog(){
		if ($this->method == 'GET'){
            $id_cata = $_GET['id_cata'];
            $data = movie_select_all_by_id($id_cata);
			$this->response(200, $data);
		}
	}
	function GetImgByIdMovie(){
		if ($this->method == 'GET'){
            $movie = $_GET['movie'];
            $data = photos_select_by_id($movie);
			$this->response(200, $data);
		}
	}
	// Delete image 
	function DeleteImage(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			$id = explode(',',$id);
			$data = photos_delete($id);
			$this->response(200, $data);
		}
	}

	function InsertPhoto(){
		$id = $_POST['id_movie'];
		$listFile = $_FILES['fileImage'];;
		$data = array();
		foreach ($listFile['tmp_name'] as $key => $value) {
			$url = $listFile['tmp_name'][$key];
			move_uploaded_file($url, '../Page/public/img/'. $listFile['name'][$key]);
			$result = photos_insert($listFile['name'][$key],$id);
			array_push($data, array($id=>$result));
		}
		$this->response(200, $data);
	}
	
	//------------------------------------------
	// API lấy nội dung của phim đó 
	function GetMovieById(){
		if ($this->method == 'GET'){
            $id_movie = $_GET['id_movie'];
			$data = movie_select_by_id($id_movie);
			$this->response(200, $data);
		}
    }
	
	//------------------------------------------
	// API lấy nội dung của phim đó 
	function Insert(){
		if ($this->method == 'POST'){
			$name = $_POST['name'];
			$linksd = $_POST['linksd'];
            $linkhd = $_POST['linkhd'];
            $linkfhd = $_POST['linkfhd'];
            $year = $_POST['year'];
			$time = $_POST['time'];
			$age = $_POST['age'];
			$image = $_FILES['file'];
			$trailer = $_POST['trailer'];
			$shortDes = $_POST['short_des'];
            $description = $_POST['des'];
			$id_cata = $_POST['id_cata'];
			$id_country = $_POST['id_country'];
            $resolution = $_POST['resolution'];
			$evaluate = $_POST['evaluate'];
            $type = $_POST['type'];
			$view = 0;
			$urlImage = $image['name'];

			move_uploaded_file($image['tmp_name'], "../page/public/img/".$image['name'] );

			$data = movie_insert(
				$name,$evaluate,$view,$year,$time,$id_country,$shortDes,$description,
				$urlImage, $trailer, $linksd, $linkhd, $linkfhd, $age, $resolution, $type, $id_cata);  
			$this->response(200, $data);
		}
	}
	function update(){
		if ($this->method == 'POST'){

			$id = $_POST['id'];
			$imgOld = $_POST['imageOld'];
			$name = $_POST['name'];
			$linksd = $_POST['linksd'];
            $linkhd = $_POST['linkhd'];
            $linkfhd = $_POST['linkfhd'];
            $year = $_POST['year'];
			$time = $_POST['time'];
			$age = $_POST['age'];
			$trailer = $_POST['trailer'];
			$shortDes = $_POST['short_des'];
            $description = $_POST['des'];
			$id_cata = $_POST['id_cata'];
			$id_country = $_POST['id_country'];
            $resolution = $_POST['resolution'];
			$evaluate = $_POST['evaluate'];
            $type = $_POST['type'];
			$view = 0;
			if(!isset($_FILES['file'])){
				$urlImage = $imgOld;
			}else{
				$urlImage = $_FILES['file']['name'];
			}
			$data = movie_update(
				$id, $name,$evaluate,$view,$year,$time,$id_country,$shortDes,$description,
				$urlImage, $trailer, $linksd, $linkhd, $linkfhd, $age, $resolution, $type, $id_cata
			);
			// $this->response(200, $data);
            
		}
	}
	function delete(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			if (movie_delete($id) == 1){
				$data = '1';
				$this->response(200, $data);
			}else{
				$data = '0';
				$this->response(404, $data);
			}
		}
	}
}
$movie = new movie();
?>
