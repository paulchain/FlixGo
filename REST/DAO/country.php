<?php
require_once 'pdo.php';

function country_insert($name_country){
    $sql = "INSERT INTO country(name_country) VALUES(?)";
    return pdo_execute($sql, $name_country);
}

function country_update($id, $name_country){ 
    $sql = "UPDATE country SET name_country=? WHERE id=?";
    return pdo_execute($sql, $name_country,$id);
}


function country_delete($id){
    $sql = "DELETE FROM country WHERE id=?";
    if(is_array($id)){
        foreach ($id as $ma) {
            return pdo_execute($sql, $ma);
        }
    }
    else{
        return pdo_execute($sql, $id);
    }
}

function country_select_all(){
    $sql = "SELECT * FROM country ORDER BY id DESC";
    return pdo_query($sql);
}
function country_select_sethome(){ 
    $sql = "SELECT * FROM loai WHERE sethome=1 ORDER BY ma_loai DESC";
    return pdo_query($sql);
}

function country_select_by_id($id_country){
    $sql = "SELECT * FROM country WHERE id=?";
    return pdo_query_one($sql, $id_country);
}
function country_sethome_sort($sethome,$sort){
    $sql = "SELECT * FROM loai WHERE sethome=? and sort=?";
    return pdo_query_one($sql, $sethome,$sort);
}

function country_exist($ma_loai){
    $sql = "SELECT count(*) FROM loai WHERE ma_loai=?";
    return pdo_query_value($sql, $ma_loai) > 0;
}

// LẤY TỔNG PHIM CÓ TRONG QUỐC GIA
function count_country($id){ 
    $sql = "SELECT * FROM country WHERE id = ?";
    return pdo_query_one($sql,$id); 
}
//UPDATE LẠI TỔNG SỐ PHIM TRONG QUỐC GIA
function country_update_count($id, $count){ 
    $sql = "UPDATE country SET count = ? WHERE id=? ";
    return pdo_execute($sql, $count , $id);
}

?>