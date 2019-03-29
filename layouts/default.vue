<template lang="pug">
section
  .links
    ul
      li
        nuxt-link(
          to='/'
          class='nl'
        ) cards
      li
        nuxt-link(
          class='nl'
          to='/projects/equation'
        ) equation
      li
        nuxt-link(
          class='nl'
          to='/projects/todo'
        ) todo
      li
        nuxt-link(
          class='nl'
          to='/projects/exchange'
        ) exchange
      li
        nuxt-link(
          class='nl'
          to='/projects/color'
        ) color
      li
        nuxt-link(
          class='nl'
          to='/nyam'
        ) nyam
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
      .nl
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
  // overflow hidden
a:any-link
    color darkblue
::selection
  background black
  color white
</style>
