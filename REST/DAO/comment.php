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

function comment_select_all(){
    $sql = "SELECT * FROM comment ORDER BY id DESC";
    return pdo_query($sql);
}

// XUẤT COMMENT TỪ ID_CUSTOMER_______________
function comment_select_by_id($id_customer){
    $sql = "SELECT * FROM comment 
    WHERE id_customer = ? ORDER BY " ;
    return pdo_query_one($sql, $id_customer);
}

function comment_select_info($id){
    $sql = "SELECT customer.name as namecustomer ,movie.name_movie as namemovie, comment.content as content, customer.avatar 
    FROM comment, customer, movie
    WHERE comment.id_movie = movie.id AND comment.id_customer = customer.id
    AND comment.id = ?" ;
    return pdo_query_one($sql, $id);
}

?>