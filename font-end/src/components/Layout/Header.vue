<template>
    <header class="header">
      <div class="header__wrap">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="header__content">
                <!-- header logo -->
                <a href="index.html" class="header__logo">
                  <img src="img/logo.png" alt="">
                </a>
                <!-- end header logo -->

                <!-- header nav -->
                <ul class="header__nav">
                  <!-- dropdown -->
                  <li class="header__nav-item">
                    <a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuHome" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Trang chủ</a>

                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuHome">
                      <li><a href="index.html">Home slideshow bg</a></li>
                      <li><a href="index2.html">Home static bg</a></li>
                    </ul>
                  </li>
                  <!-- end dropdown -->

                  <!-- dropdown -->
                  <li class="header__nav-item">
                    <a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuCatalog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">THỂ LOẠI</a>
                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuCatalog">
                      <li v-for='(item,index) in GetCategory' v-bind:key='index'><a href="catalog1.html">{{item.name_cata}}</a></li>
                    </ul>
                  </li>
                  
                  <!-- end dropdown -->
                  <!-- <button @click="handleIncrement">TAO</button> -->
                  <li class="header__nav-item">
                    <a href="#" class="header__nav-link dropdown-toggle" ole="button" id="menuCountry" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Quốc gia</a>
                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="menuCountry">
                      <li v-for='(item,index) in GetCountry' v-bind:key='index'><a href="catalog1.html">{{item.name_country}}</a></li>
                    </ul>
                  </li>

                  <li class="header__nav-item">
                    <a href="faq.html" class="header__nav-link">Phim lẻ</a>
                  </li>
                  <li class="header__nav-item">
                    <a href="faq.html" class="header__nav-link">Phim bộ</a>
                  </li>

                  <!-- dropdown -->
                  <li class="dropdown header__nav-item">
                    <a class="dropdown-toggle header__nav-link header__nav-link--more" href="#" role="button" id="dropdownMenuMore" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon ion-ios-more"></i></a>

                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuMore">
                      <li><a href="about.html">About</a></li>
                      <li><a href="signin.html">Sign In</a></li>
                      <li><a href="signup.html">Sign Up</a></li>
                      <li><a href="404.html">404 Page</a></li>
                    </ul>
                  </li>
                  <!-- end dropdown -->
                </ul>
                <!-- end header nav -->

                <!-- header auth -->
                <div class="header__auth">
                  <button class="header__search-btn" type="button">
                    <i class="icon ion-ios-search"></i>
                  </button>

                  <a href="signin.html" class="header__sign-in">
                    <i class="icon ion-ios-log-in"></i>
                    <span>sign in</span>
                  </a>
                </div>
                <!-- end header auth -->

                <!-- header menu btn -->
                <button class="header__btn" type="button">
                  <span></span>
                  <span></span>
                  <span></span>
                </button>
                <!-- end header menu btn -->
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- header search -->
      <form action="#" class="header__search">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="header__search-content">
                <input type="text" placeholder="Nhập vào nội dung bạn muốn tìm kiếm">
                <button type="button" >search</button>
              </div>
            </div>
          </div>
        </div>
      </form>
  </header>
</template>

<script>

// import { mapGetters } from 'vuex'
export default {
  name: 'Header',
  computed: {
    GetCategory () {
        return this.$store.state.catalog
      },
    GetCountry () {
        return this.$store.state.country
      }
  },
  created() {
    this.$store.dispatch('createCatalog')
    this.$store.dispatch('getCountry')
  }
}
</script>

<style lang='sass'>
  .header__sign-in
        height: 35px
  .header__search-content
    button
      height: 35px
  .header__dropdown-menu
    display: flex
    flex-wrap: wrap
    width: 530px
    li
      flex: 0 50%
      padding: .2rem 1.5rem .2rem .5rem
      a
        font-size: .8rem
        letter-spacing: 2px
        font-weight: 400
</style>


