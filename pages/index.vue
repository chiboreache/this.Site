<template lang="pug">
.cards
  section
    .horizon-scroller
      p#dev     rateLimit: {{ ratelimit }}
      GHCard(
        :data="findItem('this.Site')"
        propLink='gvworks.appspot.com'
        )
        template(#stack-list)
          Pug
          Stylus
          Nuxt
          GooCloud
      GHCard(
        :data="findItem('EpicCSV')"
        propLink='epiccsv.herokuapp.com/upload/'
        )
        p Which is already was uploaded {{ fireBaseCounter }} times!
          br
          small and {{ fireBaseCounterDumb }} times for tests
        p Here is a #[a(href="http://epiccsv.herokuapp.com/upload/table-dummy/") test link], so you can try it before upload your real csv file.
        template(#stack-list)
          Jinja
          Stylus
          Nojs
          Flask
          Herokku
      GHCard(
        :data="findItem('tblk')"
        )
        template(#stack-list)
          Python
      GHCard(
        :data="findItem('pyb')"
        )
        template(#stack-list)
          Python
      GHCard(
        :data="findItem('strSquarificator')"
        propLink='chiboreache.github.io/strSquarificator/'
        )
        template(#stack-list)
          Pug
          Stylus
          Python
      GHCard(
        :data="findItem('Thumbnailificator')"
        )
        template(#stack-list)
          Python
      GDCard
        template(#title) GD
        template(#subtitle) Unreal Engine 4  Epic Marketplace Game Development
        template(#footer)
          a(href='https://www.unrealengine.com/marketplace/en-US/profile/GVWorks?sessionInvalidated=true') Marketplace 
          a(href='https://olegkondratov.artstation.com/') Artstation
      CGCard
        template(#title) CG
        template(#subtitle) Art  Design  Computer Graphic
        template(#footer)
          a(href='https://www.behance.net/gvworks') Behance
</template>
<script lang="coffee">
import axios from 'axios'

import GHCard from '~/components/cards/GHCard'
import GDCard from '~/components/cards/GDCard'
import CGCard from '~/components/cards/CGCard'

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
      CGCard
      GDCard
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
  asyncData: ({ params }) ->
    { data } = await axios.get('https://api.github.com/users/chiboreache/repos')
    { response: data }
  head: ->
    title: 'GVWorks - Cards'
  data: ->
    fireBaseCounter: 'ƒ'
    fireBaseCounterDumb: 'ƒ'
    response: ''
    ratelimit: ''
  created: ->
    @getFireBaseCounter()
    @getFireBaseCounterDumb()
    @getRatelimit()
  methods:
    findItem: (query) ->
      @response.find((item) -> item.name == query)
    getRatelimit: ->
      response = await axios.get 'https://api.github.com/'
      @ratelimit = response.headers['x-ratelimit-remaining']
    getFireBaseCounter: ->
      response = await axios.get 'https://epiccsv.firebaseio.com/uploads.json'
      arr = Object.values(response.data)
      lastItem = arr[arr.length - 1]
      @fireBaseCounter = lastItem.id
    getFireBaseCounterDumb: ->
      response = await axios.get 'https://epiccsv.firebaseio.com/dummy-uploads.json'
      arr = Object.values(response.data)
      lastItem = arr[arr.length - 1]
      @fireBaseCounterDumb = lastItem.id
</script>
<style lang="stylus" scoped>
.cards
  display grid
  place-items center left
  hwv(98)
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
#dev
  color transparent
</style>