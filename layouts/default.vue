<template lang="pug">
section
  .links
    ul
      li
        nuxt-link(to='/') cards
      li
        nuxt-link(to='/projects/equation') equation
      li
        nuxt-link(to='/projects/todo') todo
      li
        nuxt-link(to='/projects/exchange') exchange
      li
        nuxt-link(to='/projects/color') color
      li
        nuxt-link(to='/nyam') nyam
      li
        nuxt-link(to='/crud') crud
  nuxt
</template>
<style lang="stylus">
.links
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
  transition: opacity 0.3s
.page-enter
.page-leave-active
  opacity: 0
.bounce-enter-active
  animation: bounce-in .8s
.bounce-leave-active
  animation: bounce-out .5s

@keyframes bounce-in
  0% transform scale(0)
  50% transform scale(1.5)
  100% transform scale(1)

@keyframes bounce-out
  0% transform scale(1)
  50% transform scale(1.5)
  100% transform scale(0)

.slide-left-enter
.slide-right-leave-active
  opacity: 0
  transform: translate(30px, 0)
.slide-left-leave-active
.slide-right-enter
  opacity: 0
  transform: translate(-30px, 0)
.fade-enter
.fade-leave-active
  opacity: 0
.fade-leave-active
.fade-enter
  opacity: 0
</style>
