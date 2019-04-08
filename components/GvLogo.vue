<template lang="pug">
.gv-logo
  .figure
    .stroke
      img(src="~/static/gvStroke_animated2.svg", alt="")
    .fill
      img(src="~/static/gvLogo.svg", alt="")
    label works
</template>
<script lang="coffee">
export default
  name: 'gv-logo'
  head: ->
    link: [{href: "https://fonts.googleapis.com/css?family=Advent+Pro:700", rel: "stylesheet"}]
</script>
<style lang="stylus" scoped>
.gv-logo
  gcc()
  hwv(100)
  // background #C4C4C4
  background white
  .figure
    rd(-20vw, -20vh)
    .stroke
    .fill
      position absolute
    .stroke
      opacity 1
      animation strokeAnim ease-in 3.8s 2s forwards
    .fill
      opacity 0
      animation fillAnim ease-out 1s 5s forwards
    label
      opacity 0
      position absolute
      rdem(1.95, 2)
      animation typeAnim ease-out 2s 3.5s forwards
      font-size 5em
      font-family: 'Advent Pro', sans-serif
@keyframes strokeAnim
  70%
    opacity 1
  100%
    opacity 0
@keyframes fillAnim
  to
    opacity 1
@keyframes typeAnim
  to
    opacity 1
    rdem(1.95, 3.6)
</style>