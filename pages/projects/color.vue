<template lang="pug">
.color(
    :style=' { background: color } '
  )
  .picker
    input(
      type='color'
      v-model='color'
      )
</template>
<script lang="coffee">
export default
  # props: ['']
  # components: {}
  name: 'color'
  head: ->
    title: 'color'
  data: ->
    color: 'gray'
  # methods:
  # computed:
  # watch:
</script>
<style lang="stylus" scoped>
.color
  gcc()
  hwv(100)
  .picker
    input
      hwpx(200)
      border 3em solid gray
      outline none
      cursor pointer
      -webkit-appearance: none
      &
      &::-webkit-color-swatch-wrapper
      &::-webkit-color-swatch
        padding 0
</style>