<template lang="pug">
section
  .horizon-scroller
    GHCard(
      repoName='this.Site'
      link='gvworks.appspot.com'
      )
      .stack(slot='stack-list'
        )
        Pug
        Stylus
        Nuxt
        GooCloud
    GHCard(
      repoName='EpicCSV'
      link='epiccsv.herokuapp.com/upload/'
      )
      p(:created='getFireBaseCounter()') Which is already was uploaded {{ fireBaseCounter }} times!
      p Here is a #[a(href="http://epiccsv.herokuapp.com/upload/table-dummy/") test link], so you can try it before upload your real csv file.
      .stack(slot='stack-list'
        )
        Jinja
        Stylus
        Nojs
        Flask
        Herokku
    GHCard(
      repoName='tblk'
      )
      .stack(slot='stack-list'
        )
        Python
    GHCard(
      repoName='pyb'
      )
      .stack(slot='stack-list'
        )
        Python
    GHCard(
      repoName='strSquarificator'
      link='chiboreache.github.io/strSquarificator/'
      )
      .stack(slot='stack-list'
        )
        Pug
        Stylus
        Python
    GHCard(
      repoName='Thumbnailificator'
      )
      .stack(slot='stack-list'
        )
        Python
    PlainCard
      span(slot='title') GD
      span(slot='subtitle') Unreal Engine 4  Epic Marketplace Game Development
      span(slot='footer')
        a(href='https://www.unrealengine.com/marketplace/en-US/profile/GVWorks?sessionInvalidated=true') Marketplace 
        a(href='https://olegkondratov.artstation.com/') Artstation
    PlainCard2
      span(slot='title') CG
      span(slot='subtitle') Art  Design  Computer Graphic
      span(slot='footer')
        a(href='https://www.behance.net/gvworks') Behance
</template>
<script lang="coffee">
import axios from 'axios'

import GHCard from '~/components/cards/GHCard'
import PlainCard from '~/components/cards/PlainCard'
import PlainCard2 from '~/components/cards/PlainCard2'

import Pug from '~/components/stack/Pug'
import Jinja from '~/components/stack/Jinja'
import Python from '~/components/stack/Python'
import Stylus from '~/components/stack/Stylus'
import Flask from '~/components/stack/Flask'
import Herokku from '~/components/stack/Herokku'
import Nuxt from '~/components/stack/Nuxt'
import Nojs from '~/components/stack/Nojs'
import GooCloud from '~/components/stack/GooCloud'

export default
  components:
    {
      GHCard
      PlainCard2
      PlainCard
      GooCloud
      Nojs
      Nuxt
      Herokku
      Flask
      Stylus
      Jinja
      Pug
      Python
    }
  head: ->
    title: 'GVWorks - Cards'
  data: ->
    fireBaseCounter: 'ƒ'
  methods:
    getFireBaseCounter: ->
      response = await axios.get 'https://epiccsv.firebaseio.com/uploads.json'
      arr = Object.values(response.data)
      lastItem = arr[arr.length - 1]
      @fireBaseCounter = lastItem.id
</script>
<style lang="stylus" scoped>
.stack
  display grid
  grid-auto-flow column
  place-content center
section
  .horizon-scroller
    overflow scroll
    overscroll-behavior contain
    scroll-behavior smooth
    transform rotate(-90deg) translate(-50vh, 0em)
    transform-origin top left
    width 50rem
    height 100vw
    position absolute
    display block
    padding-bottom 17em
  .horizon-scroller > .card-wrapper
    transform: rotate(90deg) translate(120%, -15vh)
    transform-origin: right
::-webkit-scrollbar
  width: 1px
  height: @width
</style>