<template lang="pug">
.index-page
  transition(name="fade")
    .greet(
      v-if='splashGreet && !isGreeted'
      key='1'
      )
      GvLogo
    .cards(
      v-else
      key='2'
      :class='{ delayCards : !isGreeted }'
      )
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

import { sync } from 'vuex-pathify'
import GvLogo from '~/components/GvLogo'

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
      GvLogo
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
  name: 'index'
  asyncData: ({ params }) ->
    { data } = await axios.get('https://api.github.com/users/chiboreache/repos')
    { response: data }
  head: ->
    title: 'GVWorks - Portfolio Cards'
  data: ->
    fireBaseCounter: 'ƒ'
    fireBaseCounterDumb: 'ƒ'
    response: ''
    ratelimit: ''
  created: ->
    @greet()
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
    seconds: (s) -> new Promise( (res) -> setTimeout res, s * 1000 )
    greet: ->
      @splashGreet = true
      await @seconds 7
      @splashGreet = false
      @$cookies.set 'SplashScreenDone', true, { expires: 1/24/4 }
  computed:
    {
      isGreeted: -> @$cookies.cookies.SplashScreenDone
      ...sync 'main/*'
    }
</script>
<style lang="stylus" scoped>
.greet
  gcc()
  hwv(100)
  background white
  // background pink
.delayCards
  animation delayLogo 8s forwards
  opacity 0
.cards
  display grid
  place-items center left
  .horizon-scroller
    overflow scroll
    overscroll-behavior contain
    scroll-behavior smooth
    tr( rz(-90) l(100vh) )
    transform-origin top left
    width 50rem
    height 110vw
    position absolute
    display block
    padding-bottom 17em
  .horizon-scroller > .card-wrapper
    tr( rz(90) r(120%) u(16vh) )
    transform-origin: right
@keyframes delayLogo
  90%
    opacity 0
  100%
    opacity 1
::-webkit-scrollbar
  width: 0px
  height: @width
#dev
  color transparent
</style>