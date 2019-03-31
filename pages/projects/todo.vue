<template lang="pug">
.todo
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
        @click='remove(item)'
        :class='{ done: item.bool }'
        v-text='item.payload'
        )
    form(
      @submit.prevent='formAction'
      )
      li#text
        input(
          placeholder='Just to do it!'
          type='text'
          v-model='newTodo'
          )
</template>
<script lang="coffee">
import { get } from 'vuex-pathify'
export default
  head: ->
    title: 'Just to do it!'
    link:
      [
        {
          href: 'https://fonts.googleapis.com/css?family=Lora:400,700'
          rel: 'stylesheet'
        }
      ]
  data: ->
    newTodo: null
  methods:
    add: (item) ->
      @$store.set('todo/ADD!', item)
    remove: (item) ->
      @$store.set('todo/REMOVE!', item)
    toggle: (item) ->
      @$store.set('todo/TOGGLE!', item)
    formAction: ->
      if @newTodo
        @add(@newTodo)
        @newTodo = null
  computed:
    {
      get('todo/*')...
    }
</script>
<style lang="stylus" scoped>
.done
  text-decoration: line-through
.todo
  gcc()
  hwv(99)
  tright(4.3em)
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
