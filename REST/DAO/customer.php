<?php
require_once 'pdo.php';
/**
 * Thêm loại mới
 * @param String $ten_customer là tên loại
 * @throws PDOException lỗi thêm mới
 */
function customer_insert($name,$password,$email,$avatar,$date){
    $sql = "INSERT INTO customer(name,password,email,avatar,date) VALUES(?,?,?,?,?)";
    return pdo_execute($sql, $name,$password,$email,$avatar,$date);
}
/**
 * Cập nhật tên loại
 * @param int $id là mã loại cần cập nhật
 * @param String $ten_customer là tên loại mới
 * @throws PDOException lỗi cập nhật
 */
function customer_update($id, $name,$password,$email,$avatar,$date){ // lưu ý phần này khóa chính luôn nằm đầu vidu id
    $sql = "UPDATE customer SET name=?,password=?,email=?,avatar=?,date=? WHERE id=?";
    return pdo_execute($sql, $name,$password,$email,$avatar,$date,$id);  // lưu ý phần này khóa chính luôn nằm cuối vidu id
}
/**
 * Xóa một hoặc nhiều loại
 * @param mix $id là mã loại hoặc mảng mã loại
 * @throws PDOException lỗi xóa
 */
function customer_delete($id){
    $sql = "DELETE FROM customer WHERE id=?";
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
function customer_select_all(){
    $sql = "SELECT * FROM customer ORDER BY id DESC";
    return pdo_query($sql);
}


function login($email,$password,$role){
    $sql = "SELECT * FROM customer WHERE email = '$email' AND customer.password = '$password' && role = $role";
    return pdo_query_one($sql);
}


/**
 * Truy vấn một loại theo mã
 * @param int $id là mã loại cần truy vấn
 * @return array mảng chứa thông tin của một loại
 * @throws PDOException lỗi truy vấn
 */
function customer_select_by_id($id){
    $sql = "SELECT * FROM customer WHERE id=?";
    return pdo_query_one($sql, $id);
}
function customer_sethome_sort($sethome,$sort){
    $sql = "SELECT * FROM customer WHERE sethome=? and sort=?";
    return pdo_query_one($sql, $sethome,$sort);
}
/**
 * Kiểm tra sự tồn tại của một loại
 * @param int $id là mã loại cần kiểm tra
 * @return boolean có tồn tại hay không
 * @throws PDOException lỗi truy vấn
 */
function customer_exist($id){
    $sql = "SELECT count(*) FROM customer WHERE id=?";
    return pdo_query_value($sql, $id) > 0;
}
?>