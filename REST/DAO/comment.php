<?php
require_once 'pdo.php';

// INSERT COMMENT_______________
function comment_insert($content,$id_customer,$id_movie,$full_name,$likes,$unlikes,$types){
    $sql = "INSERT INTO comment(content,id_customer,id_movie,full_name,likes,unlikes,types) VALUES(?,?,?,?,?,?,?)";
    return pdo_execute($sql, $content,$id_customer,$id_movie,$full_name,$likes,$unlikes,$types);
}
//_________________________________________________

// UPDATE COMMENT_______________
function comment_update($id_comment, $content,$id_customer,$id_movie,$full_name,$likes,$unlikes,$types){
    $sql = "UPDATE comment SET content=?,id_customer=?,id_movie=?,full_name=?,likes=?,unlikes=?,types=? WHERE id_comment=?";
    return pdo_execute($sql, $content,$id_customer,$id_movie,$full_name,$likes,$unlikes,$types, $id_comment);
}

// DELETE COMMENT - MULTIPLE_______________
function comment_delete($id_comment){
    $sql = "DELETE FROM comment WHERE id_comment=?";
    if(is_array($id_comment)){
        foreach ($id_comment as $ma) {
            return pdo_execute($sql, $ma);
        }
    }
    else{
        return pdo_execute($sql, $id_comment);
    }
}


function comment_exist($ma_loai){
    $sql = "SELECT count(*) FROM loai WHERE ma_loai=?";
    return pdo_query_value($sql, $ma_loai) > 0;
}

// XUẤT COMMENT TỪ ID_CUSTOMER_______________
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