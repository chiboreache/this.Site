<template lang="pug">
  .stack-badge
    .stack-list
      .third
      .second
      .first
</template>
<style lang="stylus">


:root
  --first-bg-image url('https://css-tricks.com/wp-content/themes/CSS-Tricks-17/ads/keen/keen.svg')
  --second-bg-image url('https://css-tricks.com/wp-content/themes/CSS-Tricks-17/ads/keen/keen.svg')
  --third-bg-image url('https://css-tricks.com/wp-content/themes/CSS-Tricks-17/ads/keen/keen.svg')
  --badge-bg-image url('https://static.figma.com/app/icon/1/favicon.svg')


[tooltip]
  transition all 1s
  filter: drop-shadow(0px 2px 2px rgba(0, 0, 0, .5))
  &::before
      position: absolute
      content: " "
      transform: translate(-50%, -350%)
      border-width: .4rem .5rem 0rem .5rem
      border-style: solid
      border-color: #F6F6F6 transparent transparent transparent
  &::after
      position: absolute
      content: " "
      transform: translate(-50%, -150%)
      background: #F6F6F6
      min-width: 6rem
      padding 1.3rem 0.2rem
      border-radius: .5rem
      pointer-events: none
      background-size: 29px
      background-repeat: no-repeat
      background-position: center
.stack-badge
  display inline-block
  pointer-events: auto
  filter saturate(0)
  font-weight bold
  background-image var(--badge-bg-image)
  cursor help
  height 26px
  width @height
  padding @height * 0.7
  background-size @height
  background-repeat no-repeat
  background-position center
  .stack-list
    transition all 1s
    .first
      opacity 0
      transition-delay: .3s
      @extend [tooltip]
      transform: translate(0, -0.5rem)
      &::after
        background-image var(--first-bg-image)
    .second
      opacity 0
      transition-delay: .6s
      @extend [tooltip]
      transform: translate(-100%, -3.4rem)
      &::after
        background-image var(--second-bg-image)
    .third
      opacity 0
      transition-delay: .9s
      @extend [tooltip]
      transform: translate(-200%, -6.3rem)
      &::after
        background-image var(--third-bg-image)
.stack-badge:hover
  filter saturate(1)
  .stack-list
    .third
      opacity 1
    .second
      opacity 1
    .first
      opacity 1
</style>