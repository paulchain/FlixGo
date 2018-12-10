<?php
require_once 'pdo.php';

/**
 * Thêm loại mới
 * @param String $ten_pricing_plan là tên loại
 * @throws PDOException lỗi thêm mới
 */
function pricing_plan_insert($name,$price,$time_limit,$resolution,$availability,$device,$support,$description){
    $sql = "INSERT INTO pricing_plan(name,price,time_limit,resolution,availability,device,support,description) VALUES(?,?,?,?,?,?,?,?)";
    return pdo_execute($sql, $name,$price,$time_limit,$resolution,$availability,$device,$support,$description);
}
/**
 * Cập nhật tên loại
 * @param int $ma_pricing_plan là mã loại cần cập nhật
 * @param String $ten_pricing_plan là tên loại mới
 * @throws PDOException lỗi cập nhật
 */
function pricing_plan_update($id, $name,$price,$time_limit,$resolution,$availability,$device,$support,$description){ // lưu ý phần này khóa chính luôn nằm đầu vidu ma_pricing_plan
    $sql = "UPDATE pricing_plan SET name=?,price=?,time_limit=?,resolution=?,availability=?,device=?,support=?,description=? WHERE id=?";
    return pdo_execute($sql, $name,$price,$time_limit,$resolution,$availability,$device,$support,$description,$id);  // lưu ý phần này khóa chính luôn nằm cuối vidu ma_pricing_plan
}
/**
 * Xóa một hoặc nhiều loại
 * @param mix $ma_pricing_plan là mã loại hoặc mảng mã loại
 * @throws PDOException lỗi xóa
 */
function pricing_plan_delete($id){
    $sql = "DELETE FROM pricing_plan WHERE id=?";
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
function pricing_plan_select_all(){
    $sql = "SELECT * FROM pricing_plan ORDER BY id DESC";
    return pdo_query($sql);
}
function pricing_plan_select_sethome(){ // copy xún đổi all thành tên sethome
    $sql = "SELECT * FROM pricing_plan WHERE sethome=1 ORDER BY ma_pricing_plan DESC";
    return pdo_query($sql);
}

/**
 * Truy vấn một loại theo mã
 * @param int $ma_pricing_plan là mã loại cần truy vấn
 * @return array mảng chứa thông tin của một loại
 * @throws PDOException lỗi truy vấn
 */
function pricing_plan_select_by_id($id_pricing){
    $sql = "SELECT * FROM pricing_plan WHERE id=?";
    return pdo_query_one($sql, $id_pricing);
}
function pricing_plan_sethome_sort($sethome,$sort){
    $sql = "SELECT * FROM pricing_plan WHERE sethome=? and sort=?";
    return pdo_query_one($sql, $sethome,$sort);
}
/**
 * Kiểm tra sự tồn tại của một loại
 * @param int $ma_pricing_plan là mã loại cần kiểm tra
 * @return boolean có tồn tại hay không
 * @throws PDOException lỗi truy vấn
 */
function pricing_plan_exist($ma_pricing_plan){
    $sql = "SELECT count(*) FROM pricing_plan WHERE ma_pricing_plan=?";
    return pdo_query_value($sql, $ma_pricing_plan) > 0;
}
//menu đa cấp
//function Menu($parent = 0,$space = '---', $trees = NULL){ 
//        if(!$trees){ $trees = array(); }
//	$sql = mysql_query("SELECT * FROM pricing_plan WHERE parent = ".intval($parent)." ORDER BY tenpricing_plan"); 
//	while($rs = mysql_fetch_assoc($sql)){ 
//		$trees[] = array('ma_pricing_plan'=>$rs['ma_pricing_plan'],'tenpricing_plan'=>$space.$rs['tenpricing_plan']); 
//		$trees = Menu($rs['ma_pricing_plan'],$space.'---',$trees); 
//	} 
//	return $trees; 
//}
?>