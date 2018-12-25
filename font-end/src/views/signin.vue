<template>
    <div class="sign section--bg" data-bg="img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="sign__content">
						<!-- authorization form -->
						<form action="#" class="sign__form mt-3" >
							<router-link to="/"></router-link>
								<img class="logo" src="/img/logo.png" alt="">
							<div class="sign__group">
								<input type="text" class="sign__input" placeholder="Email" v-model="email">
							</div>

							<div class="sign__group">
								<input type="password" class="sign__input" placeholder="Mật khẩu" v-model="password">
							</div>

							<div class="sign__group sign__group--checkbox">
								<input id="remember" name="remember" type="checkbox" checked="checked">
								<label for="remember">Nhớ mật khẩu</label>
							</div>
							
							<button class="sign__btn" @click="submitUser()" type="button">Đăng nhập</button>

							<span class="sign__text">Bạn chưa có tài khoản? <a href="signup.html">Đăng ký!</a></span>

							<span class="sign__text"><a href="#">Forgot password?</a></span>
						</form>
						<!-- end authorization form -->
						<div class="result text-white">
							<!-- <p style='color: white'>{{email}}</p>
							<p style='color: white'>{{password}}</p> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
import axios from "axios"
export default {
	name: 'signin',
	data(){
		return {
			email: '',
			password: '',
		}
	},
	methods: {
		submitUser(){
			var data = new FormData();
			data.append("email",this.email)
			data.append("password",this.password)
			data.append("role", 1)
			axios({
				method: "POST",
				url: "http://localhost/rest/API/customer.php/login",
				data: data
			})
			.then(response => {
				if(response.data != false){	
					let user = {
						id: response.data.id,
						avatar: response.data.avatar,
						name: response.data.name
					}
					this.$store.dispatch('createUser', user )
					this.$router.push("/")
				}
				
			})
		}
	}
}
</script>
<style lang="sass" scoped>
	.sign__form
		margin-top: 3.5rem
		&::before
			background: white !important
	.logo
		max-width: 200px
		margin-bottom: 2rem
	.sign__btn
		height: 40px
	.sign__text 
		a
			margin-top: .5rem
</style>
