<?php
require_once 'pdo.php';

/**
 * Thêm loại mới
 * @param String $ten_loai là tên loại
 * @throws PDOException lỗi thêm mới
 */
function catalog_insert($location,$name_cata){
    $sql = "INSERT INTO catalog(location,name_cata) VALUES(?,?)";
    return pdo_execute($sql, $location,$name_cata);
}
/**
 * Cập nhật tên loại
 * @param int $ma_loai là mã loại cần cập nhật
 * @param String $ten_loai là tên loại mới
 * @throws PDOException lỗi cập nhật
 */
function catalog_update($id, $location,$name_cata){ // lưu ý phần này khóa chính luôn nằm đầu vidu ma_loai
    $sql = "UPDATE catalog SET location=?,name_cata=? WHERE id=?";
    return pdo_execute($sql, $location,$name_cata,$id);  // lưu ý phần này khóa chính luôn nằm cuối vidu ma_loai
}

function catalog_update_count($id,$count ){ 
    $sql = "UPDATE catalog SET count = ? WHERE id = ?";
    return pdo_execute($sql, $count,$id); 
}

function count_catalog($id){ 
    $sql = "SELECT *  FROM catalog WHERE id = ?";
    return pdo_query_one($sql,$id); 
}
/**
 * Xóa một hoặc nhiều loại
 * @param mix $ma_loai là mã loại hoặc mảng mã loại
 * @throws PDOException lỗi xóa
 */
function catalog_delete($id){
    $sql = "DELETE FROM catalog WHERE id=?";
    if(is_array($id)){
        foreach ($id as $ma) {
            return pdo_execute($sql, $ma);
        }
    }
    else{
        return pdo_execute($sql, $id);
    }
}
/**
 * Truy vấn tất cả các loại
 * @return array mảng loại truy vấn được
 * @throws PDOException lỗi truy vấn
 */
function catalog_select_all(){
    $sql = "SELECT * FROM catalog ORDER BY id DESC";
    return pdo_query($sql);
}
function catalog_select_sethome(){ // copy xún đổi all thành tên sethome
    $sql = "SELECT * FROM catalog WHERE sethome=1 ORDER BY id DESC";
    return pdo_query($sql);
}

/**
 * Truy vấn một loại theo mã
 * @param int $ma_loai là mã loại cần truy vấn
 * @return array mảng chứa thông tin của một loại
 * @throws PDOException lỗi truy vấn
 */
function catalog_select_by_id($id){
    $sql = "SELECT * FROM catalog WHERE id=?";
    return pdo_query_one($sql, $id);
}
function catalog_sethome_sort($sethome,$sort){
    $sql = "SELECT * FROM loai WHERE sethome=? and sort=?";
    return pdo_query_one($sql, $sethome,$sort);
}
/**
 * Kiểm tra sự tồn tại của một loại
 * @param int $ma_loai là mã loại cần kiểm tra
 * @return boolean có tồn tại hay không
 * @throws PDOException lỗi truy vấn
 */
function catalog_exist($ma_loai){
    $sql = "SELECT count(*) FROM loai WHERE ma_loai=?";
    return pdo_query_value($sql, $ma_loai) > 0;
}
//menu đa cấp
//function Menu($parent = 0,$space = '---', $trees = NULL){ 
//        if(!$trees){ $trees = array(); }
//	$sql = mysql_query("SELECT * FROM loai WHERE parent = ".intval($parent)." ORDER BY tenloai"); 
//	while($rs = mysql_fetch_assoc($sql)){ 
//		$trees[] = array('ma_loai'=>$rs['ma_loai'],'tenloai'=>$space.$rs['tenloai']); 
//		$trees = Menu($rs['ma_loai'],$space.'---',$trees); 
//	} 
//	return $trees; 
//}
?>