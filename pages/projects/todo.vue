<template lang="pug">
.todo
  ol
    transition-group(name="list")
      li(
        v-for='(item, index) in todos'
        :key='item.payload'
        )
        input(
          :checked='item.bool'
          type='checkbox'
          @change='toggle(item)'
          )
        span(
          :class='{ done: item.bool }'
          v-text='item.payload'
          )
        button( @click='remove(index)' ) ⊗
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
      ...get('todo/*')
    }
</script>
<style lang="stylus" scoped>
.done
  text-decoration: line-through
.todo
  gcc()
  hwv(90)
  place-content right
  font-family: 'Lora', serif;
  ol
    width 65vw
    li
      transition all 1s
      list-style-type: upper-roman
      padding-top 1.3em
      span
        font-size 1.2em
        font-weight 550
        padding-left  0.3em
      button
        outline none
        border none
        background none
        font-size 1.2em
        cursor pointer
        tdown 0.1em
        margin-left 0.2em
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
