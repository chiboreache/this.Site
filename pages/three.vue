<template lang="pug">
.three
  BackgroundCube
  h1 Hello
    i  three
</template>
<script lang="coffee">
import BackgroundCube from '~/components/BackgroundCube.vue'

export default
  components: { BackgroundCube }
  head: ->
    title: 'three.js'
  # data: ->

  # methods:
  # computed:
  # watch:
</script>
<style lang="stylus" scoped>
.three
  gcc()
  hwv(100)
</style>