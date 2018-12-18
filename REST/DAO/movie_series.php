<?php
require_once 'pdo.php';

//HÀM LẤY MOVIE SERIES THEO PAGE VÀ THEO MOVIE
function movie_series_by_page_idmovie( $page ,$number, $id_movie){
    $from = ($page-1)*$number;
    $sql = "SELECT * FROM movie_series WHERE id_movie = $id_movie 
            ORDER BY id_series limit $number offset  $from  ";
    return pdo_query($sql);
}

//HÀM THÔNG TIN TẬP BẰNG ID 
function movie_series_by_id( $id_series){
    $sql = "SELECT * FROM movie_series WHERE id_series = $id_series ";
    return pdo_query_one($sql);
}

// HÀM SỦA THÔNG TIN TẬP 
function movie_series_update($id_series, $episodes,$title,$id_movie,$clip_SD,$clip_HD,$clip_FHD){
    $sql = "UPDATE movie_series SET episodes=?,title=?,id_movie=?,clip_SD=?,clip_HD=?,clip_FHD=? WHERE id_series=?";
    return pdo_execute($sql,$episodes,$title,$id_movie,$clip_SD,$clip_HD,$clip_FHD,$id_series); 
}








function movie_series_insert($episodes,$title,$id_movie,$clip_SD,$clip_HD,$clip_FHD){
    $sql = "INSERT INTO movie_series VALUES(NULL,?,?,?,?,?,?)";
    return pdo_execute($sql, $episodes,$title,$id_movie,$clip_SD,$clip_HD,$clip_FHD);
}

function movie_series_delete($id_series){
    $sql = "DELETE FROM movie_series WHERE id_series=?";
    if(is_array($id_series)){
        foreach ($id_series as $ma) {
            return pdo_execute($sql, $ma);
        }
    }
    else{
        return pdo_execute($sql, $id_series);
    }
}


function movie_series_select_all(){
    $sql = "SELECT * FROM movie_series ORDER BY id_series DESC";
    return pdo_query($sql);
}














function countMovieSeries($id){
    $sql = "SELECT COUNT(id_series) FROM movie_series ";
    return pdo_query($sql);
}
function movie_series_select_sethome(){ // copy xún đổi all thành tên sethome
    $sql = "SELECT * FROM movie_series WHERE sethome=1 ORDER BY id DESC";
    return pdo_query($sql);
}

/**
 * Truy vấn một loại theo mã
 * @param int $id là mã loại cần truy vấn
 * @return array mảng chứa thông tin của một loại
 * @throws PDOException lỗi truy vấn
 */
function movie_series_select_by_id($id){
    $sql = "SELECT * FROM movie_series WHERE id_series=?";
    return pdo_query_one($sql, $id);
}
function movie_series_select_by_id_movie($id){
    $sql = "SELECT * FROM movie_series WHERE id_movie=?";
    return pdo_query($sql, $id);
}
function movie_series_sethome_sort($sethome,$sort){
    $sql = "SELECT * FROM movie_series WHERE sethome=? and sort=?";
    return pdo_query_one($sql, $sethome,$sort);
}
/**
 * Kiểm tra sự tồn tại của một loại
 * @param int $id là mã loại cần kiểm tra
 * @return boolean có tồn tại hay không
 * @throws PDOException lỗi truy vấn
 */
function movie_series_exist($id){
    $sql = "SELECT count(*) FROM movie_series WHERE id=?";
    return pdo_query_value($sql, $id) > 0;
}
//menu đa cấp
//function Menu($parent = 0,$space = '---', $trees = NULL){ 
//        if(!$trees){ $trees = array(); }
//	$sql = mysql_query("SELECT * FROM movie_series WHERE parent = ".intval($parent)." ORDER BY tenmovie_series"); 
//	while($rs = mysql_fetch_assoc($sql)){ 
//		$trees[] = array('id'=>$rs['id'],'tenmovie_series'=>$space.$rs['tenmovie_series']); 
//		$trees = Menu($rs['id'],$space.'---',$trees); 
//	} 
//	return $trees; 
//}
?>