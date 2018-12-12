<?php
require_once 'pdo.php';

function movie_insert($name_movie,$evaluate,$view,$release_year,$running_time,$id_country,$short_description,$description,$image,$clip_SD,$clip_HD,$clip_FHD,$age,$resolution,$id_cata){
    $sql = "INSERT INTO movie VALUES(NULL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    return pdo_execute($sql, $name_movie,$evaluate,$view,$release_year,$running_time,$id_country,$short_description,$description,$image,$clip_SD,$clip_HD,$clip_FHD,$age,$resolution,$id_cata);
}

function movie_update($id, $name_movie,$evaluate,$release_year,$running_time,$id_country,$short_description,$description,$image,$clip_SD,$clip_HD,$clip_FHD,$age,$resolution,$id_cata){ 
    
    $sql = "UPDATE movie SET name_movie=?,release_year=? , evaluate = ?, running_time=?,id_country=?,short_description=?,description=?,
    image=?,clip_SD=?,clip_HD=?,clip_FHD=?,age=?,resolution=?,id_cata=? WHERE id=?";

    return pdo_execute($sql, $name_movie,$evaluate,$release_year,$running_time,$id_country,$short_description,$description,$image,$clip_SD,$clip_HD,$clip_FHD,$age,$resolution,$id_cata, $id); 
}

function movie_delete($id){
    $sql = "DELETE FROM movie WHERE id=?";
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
function movie_select_all(){
    $sql = "SELECT * FROM movie ORDER BY id DESC";
    return pdo_query($sql);
}
function movie_select_sethome(){ // copy xún đổi all thành tên sethome
    $sql = "SELECT * FROM loai WHERE sethome=1 ORDER BY ma_loai DESC";
    return pdo_query($sql);
}

/**
 * Truy vấn một loại theo mã
 * @param int $ma_loai là mã loại cần truy vấn
 * @return array mảng chứa thông tin của một loại
 * @throws PDOException lỗi truy vấn
 */
function movie_select_all_by_id($id_cata){
    $sql = "SELECT * FROM movie
    WHERE id_cata=? 
    ORDER BY id DESC ";
    return pdo_query_one($sql, $id_cata);
}
//chi tiết film
function movie_select_by_id($id_movie){
    $sql = "SELECT movie.id , movie.id_cata, movie.id_country, movie.name_movie as movie,country.name_country 
    as country,image,release_year,resolution,running_time, catalog.name_cata as catalog,
    age, clip_SD,clip_HD,clip_FHD,short_description,description,evaluate

    FROM movie, country, catalog
    WHERE movie.id_country = country.id 
    and movie.id_cata = catalog.id
    and movie.id=?";
    return pdo_query_one($sql, $id_movie);
}
function SelectAllInfo(){
    $sql = "SELECT movie.id , movie.name_movie as movie,country.name_country as country,image,release_year,resolution,
    catalog.name_cata as catalog,age, clip_SD,clip_HD,clip_FHD,short_description, is_film, evaluate,description

    FROM movie, country, catalog
    WHERE movie.id_country = country.id 
    and movie.id_cata = catalog.id";
    return pdo_query($sql);
}

// MOVIE NHÌU LƯỢT XEM
function movie_evaluate(){
    $sql = "SELECT * FROM loai WHERE ma_loai=?";
    return pdo_query_one($sql, $ma_loai);
}
function movie_sethome_sort($sethome,$sort){
    $sql = "SELECT * FROM loai WHERE sethome=? and sort=?";
    return pdo_query_one($sql, $sethome,$sort);
}
/**
 * Kiểm tra sự tồn tại của một loại
 * @param int $ma_loai là mã loại cần kiểm tra
 * @return boolean có tồn tại hay không
 * @throws PDOException lỗi truy vấn
 */
function movie_exist($ma_loai){
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