<?php
    $message = '';
    if(isset($_POST['action']) && $_POST['action'] == 'login'){
        $email = $_POST['email'];
        $password = $_POST['password'];
        $role = 1;
        $restult = login($email,$password,$role);
        echo 'ashdjahkdsahkdahskdhksa';
        if($restult != null){
            $_SESSION['user']['id'] = $restult['id'];
            $_SESSION['user']['avatar'] = $restult['avatar'];
            $_SESSION['user']['name'] = $restult['name'];
            header('Location: index.php?page=home');
            exit;
        }else{
            $message = 'Tài khoản hoặc mật khẩu chưa chính xác';
        }
    }
?>
<!-- <img src="public/img/thelittlemermaid.jpg" alt="" class='backgroundTotal'> -->
<div class="col-md-12">
    <div class="row justify-content-center formLogin">
        <div class="col-8 col-md-6 col-lg-3 ">
            <form class="text-center border border-light" action='index.php' method='POST'>
             <p class="h4 mb-4">Đăng nhập ADMIN</p>
                <input type="email" name='email' id="defaultLoginFormEmail" class="form-control mb-4" placeholder="Email">
                <input type="password" name='password'  id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Mật Khẩu">
                <div class="d-flex justify-content-around">
                    <div>
                        <a href="">Forgot password?</a>
                    </div>
                </div>
                <div class="alert alert-warning mt-3 <?php if( $message == '') echo 'd-none'?>" role='alert'><?=$message?></div>
                <button class="btn btn-info btn-block my-4" value='login' name='action' type="submit">Sign in</button>
            </form>
        </div>
    </div>
 </div>


