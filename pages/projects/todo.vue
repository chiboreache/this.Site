<template lang="pug">
section
  ol
    li(
      v-for='(item, index) in todos'
      :key='index'
      )
      input(
        :checked='item.bool'
        type='checkbox'
        @change='toggle(item)'
        )
      span(
        @click='removeTodo(item)'
        :class='{ done: item.bool }'
        v-text='item.payload'
        )
    li#text
      input(
        placeholder='Just to do it!'
        type='text'
        @keyup.enter='addTodo'
        )
</template>
<script lang="coffee">
import { mapMutations, mapGetters } from 'vuex'
export default
  head: ->
    title: 'Just to do it!'
  methods:
    {
      addTodo: (e) ->
        input = e.target.value
        if input.trim()
          @$store.commit('todo/add', input)
        e.target.value = ''
      removeTodo: (item) ->
        @$store.commit('todo/remove', item)
      mapMutations(
        toggle: 'todo/toggle'
      )...
    }
  computed:
    {
      mapGetters(
        todos: 'todo/todos'
      )...
    }
</script>
<style lang="stylus" scoped>
@import url('https://fonts.googleapis.com/css?family=Lora:400,700')
.done
  text-decoration: line-through
section
  gcc()
  hwv(99)
  right(4.3em)
  font-family: 'Lora', serif;
  ol
    width 65vw
    li
      list-style-type: upper-roman
      padding-top 1.3em
      span
        font-size 1.2em
        font-weight 550
        padding-left  0.3em
        cursor pointer
    li#text
      list-style-type: none
      padding-top 2.1em
      input
        padding-left 0.7em
        width 90%
        background none
        height 2.1em
        outline none
        border 1.2px dashed
        &:focus
          outline none
      &::before
        content '✏'
        font-size 1.5em
        display inline-block
        padding-right 4%
        margin-left -3.5%
        down(13%)
</style>
