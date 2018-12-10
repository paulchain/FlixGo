<?php
require_once 'pdo.php';

// INSERT COMMENT_______________
function comment_insert($content,$id_customer,$id_movie){
    $sql = "INSERT INTO comment(content,id_customer,id_movie) VALUES(?,?,?)";
    return pdo_execute($sql, $content,$id_customer,$id_movie);
}
//_________________________________________________

// UPDATE COMMENT_______________
function comment_update($id, $content,$id_customer,$id_movie){
    $sql = "UPDATE comment SET content=?,id_customer=?,id_movie=? WHERE id=?";
    return pdo_execute($sql, $content,$id_customer,$id_movie, $id);
}

// DELETE COMMENT - MULTIPLE_______________
function comment_delete($id){
    $sql = "DELETE FROM comment WHERE id=?";
    if(is_array($id)){
        foreach ($id as $ma) {
            return pdo_execute($sql, $ma);
        }
    }
    else{
        return pdo_execute($sql, $id);
    }
}
// XUẤT COMMENT TỪ ID_CUSTOMER_______________
function comment_select_by_id($id_customer){
    $sql = "SELECT * FROM comment 
    WHERE id_customer = ? ORDER BY " ;
    return pdo_query_one($sql, $id_customer);
}
// XUẤT COMMENT TỪ ID_MOVIE__
function comment_select_by_id($id_movie){
    $sql = "SELECT * FROM comment 
    WHERE id_movie = ? ORDER BY " ;
    return pdo_query_one($sql, $id_movie);
}
//_________________________________________________


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