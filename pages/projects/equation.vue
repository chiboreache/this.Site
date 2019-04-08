<template lang="pug">
  .grid
    .equation
      .input1
        input(
          v-model='x1'
          type="text"
          placeholder='⒳₁'
          @keyup.enter='calcX1'
          @click.right.prevent='calcX1'
          :title='title'
          )
        input(
          placeholder='='
          size="2"
          disabled
          )
        input(
          v-model='x2'
          type="text"
          placeholder='⒳₂'
          @keyup.enter='calcX2'
          @click.right.prevent='calcX2'
          :title='title'
          )
      hr
      .input2
        input(
          v-model='y1'
          type="text"
          placeholder='⒴₁'
          @keyup.enter='calcY1'
          @click.right.prevent='calcY1'
          :title='title'
          )
        input(
          placeholder='='
          size="2"
          disabled
          )
        input(
          v-model='y2'
          type="text"
          placeholder='⒴₂'
          @keyup.enter='calcY2'
          @click.right.prevent='calcY2'
          :title='title'
          )
</template>
<script lang="coffee">
  export default
    head: ->
      title: 'Proportional Calculator'
    data: ->
      x1: null
      x2: null
      y1: null
      y2: null
      title: 'Press «Enter» or «RMB» to provide a calculation'
    methods:
      calcX1: -> @x1 = (@x2 * @y1) / @y2
      calcY1: -> @y1 = (@x1 * @y2) / @x2
      calcX2: -> @x2 = (@x1 * @y2) / @y1
      calcY2: -> @y2 = (@x2 * @y1) / @x1
</script>
<style lang="stylus" scoped>
.grid
  gci()
  hwv(100)
  .equation
    input
      fs = 1em
      pad = 0.5em
      border-radius fs
      font-size fs
      padding pad 0 pad 0
      text-align center
      &:focus
        outline none
</style>
