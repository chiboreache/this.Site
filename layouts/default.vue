<template lang="pug">
.default-page
  transition(name="fade")
    nav(v-show='isGreeted')
      ul
        li
          nuxt-link(to='/') cards
        li
          nuxt-link(to='/projects/exchange') exchange
        li
          nuxt-link(to='/projects/equation') equation
        li
          nuxt-link(to='/projects/todo') todo
        li
          nuxt-link(to='/projects/color') color
        li
          nuxt-link(to='/crud') crud
        li
          nuxt-link(to='/nyam') nyam
  nuxt
</template>
<script lang="coffee">
import { get } from 'vuex-pathify'
export default
  name: 'default'
  computed:
    splashGreet: -> get('main/splashGreet')
    isGreeted: -> @$cookies.cookies.SplashScreenDone
</script>
<style lang="stylus">
nav
  position fixed
  z-index 88
  tdown(50vh)
  padding-right 1em
  padding-bottom 1em
  margin -1em
  &:hover
    background gainsboro
  ul
    list-style-type: none
    padding-left 1.5em
    li
      padding-top: 0.7em
      & >
        &:any-link
          color: gray
          text-decoration: underline dashed
          &:hover
            color: white
            background gray
            &:active
              color: gray
          &:current
            list-style-type: disc
*
*:before
*:after
  box-sizing: inherit
  outline none

html
  font-family: 'Source Sans Pro', -apple-system, BlinkMacSystemFont, 'Segoe UI',
    Roboto, 'Helvetica Neue', Arial, sans-serif
  font-size: 16px
  word-spacing: 1px
  -ms-text-size-adjust: 100%
  -webkit-text-size-adjust: 100%
  -moz-osx-font-smoothing: grayscale
  -webkit-font-smoothing: antialiased
  box-sizing border-box
body
  margin 0
  padding 0
  background whitesmoke
  overflow hidden
a:any-link
    color darkblue
::selection
  background black
  color white

.page-enter-active
.page-leave-active
  transition: all 0.9s cubic-bezier(.66,-0.84,.5,1.6)
  transform-origin 100% 50%
.page-enter
.page-leave-active
  opacity: 0
  tr( u(90vh) r(50vw) rz(-160deg) )

.fade-enter-active
.fade-leave-active
  transition opacity 1s
.fade-enter
.fade-leave-to
  opacity: 0

.list-enter-active
.list-leave-active
  transition all 1s
.list-enter
.list-leave-to
  opacity 0
  tdown(1em)

</style>
