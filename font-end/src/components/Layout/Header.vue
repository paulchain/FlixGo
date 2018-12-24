<template>
    <header class="header">
      <div class="header__wrap">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="header__content">
                <!-- header logo -->
                <router-link :to="'/'">
                  <a href="javascript:void(0)" class='header__logo'>
                    <img src="/img/logo.png" alt="">
                  </a>
                </router-link>
                <!-- end header logo -->

                <!-- header nav -->
                <ul class="header__nav">
                  <li class="header__nav-item">
                    <a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuCatalog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">THỂ LOẠI</a>
                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuCatalog">
                      <li v-for='(item,index) in GetCategory' v-bind:key='index'><a href="catalog1.html">{{item.name_cata.toUpperCase()}}</a></li>
                    </ul>
                  </li>
                  
                  <!-- end dropdown -->
                  <!-- <button @click="handleIncrement">TAO</button> -->
                  <li class="header__nav-item">
                    <a href="#" class="header__nav-link dropdown-toggle" ole="button" id="menuCountry" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Quốc gia</a>
                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="menuCountry">
                      <li v-for='(item,index) in GetCountry' v-bind:key='index'><a href="catalog1.html">{{item.name_country.toUpperCase()}}</a></li>
                    </ul>
                  </li>

                  <li class="header__nav-item">
                    <a href="#" class="header__nav-link">PHIM HD</a>
                  </li>
                  <li class="header__nav-item">
                    <a href="#" class="header__nav-link">MUA VIP</a>
                  </li>
                  <li class="header__nav-item">
                    <a href="#" class="header__nav-link">LIÊN HỆ</a>
                  </li>

                </ul>
                <!-- end header nav -->

                <!-- header auth -->
                <div class="header__auth">
                  
                  <button class="header__search-btn" type="button">
                    <i class="icon ion-ios-search"></i>
                  </button>
                  <router-link to="/signin" v-if="!getStatusUser">
                    <a href="signin.html" class="header__sign-in">
                      <i class="icon ion-ios-log-in"></i>
                      <span>ĐĂNG NHẬP</span>
                    </a>
                  </router-link>
                  <div class="user">
                    <img :src="'http://localhost/rest/page/public/img/'+getUser.avatar" alt="" class="avatar">
                    <span>{{getUser.name}}</span>
                    <a href="" class="header__sign-in logout">
                      <i class="icon ion-ios-log-in"></i>
                    </a>
                  </div>
                 
                </div>
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

import { mapGetters } from 'vuex'
export default {
  name: 'Header',
  computed: {
    ...mapGetters(['getStatusUser','getUser']),
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
    this.$store.dispatch('getMovie')
  }
}
</script>

<style lang='sass'>
  .header__sign-in
        height: 40px
  .header__search-content
    button
      height: 40px !important
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
  .user
    img
      width: 50px
      height: 50px
      object-fit: cover
      border-radius: 50%
      margin-left: 2rem
      border: 6px solid #28282d
    span
      color: white
      padding: .3rem .5rem
      font-weight: 400
    .logout
      max-width: 50px
      height: 40px !important
</style>


