<template lang="pug">
.nyam
  .heading Ты сегодня покормил кота?
  .nyam-cards(v-if='response')
    CatCard(:data='response.foo' rgb=[22, 152, 217])
      template(#gift)
        p {{ response.foo.gift.p }}
    CatCard(:data='response.fish' rgb=[217, 22, 103])
      template(#gift)
        b {{ response.fish.gift.amount }} 
        | {{ response.fish.gift.p }}
    CatCard(:data='response.chicken' rgb=[22, 217, 125])
      template(#gift)
        b {{ response.chicken.gift.amount }} 
        | {{ response.chicken.gift.p }}
        p {{ response.chicken.gift.p2 }}
  footer#main
    FancyBtn(url='https://github.com/chiboreache/nyam')

  //- rgb(22, 152, 217)
  //- rgb(217, 22, 103)
  //- rgb(22, 217, 125)

</template>
<script lang="coffee">
import axios from 'axios'
import FancyBtn from '~/components/FancyBtn'
import CatCard from '~/components/cards/CatCard'
export default
  components:
    {
      FancyBtn
      CatCard
    }
  name: 'nyam'
  head: ->
    title: 'nyam'
    link:
      [
        {
          href: 'https://fonts.googleapis.com/css?family=Exo+2:300&subset=cyrillic'
          rel: 'stylesheet'
        }
      ]
  asyncData: ->
    { data } = await axios.get('https://myawesomeasyncdb.firebaseio.com/nyam/RUS/fillings.json')
    { response: data }
</script>
<style lang="stylus">
.nyam
  gci()
  background:
    linear-gradient(
      180deg,
      rgba(0,0,0, 0.4) 0%,
      rgba(0,0,0, 0.01) 50%,
      rgba(0,0,0, 0.4) 100%
      ),
    url('~static/pattern.png')
  .heading
    color white
    font-family: 'Exo 2', sans-serif
    font-size 38px
    padding 1.5em
    text-align center
    margin-bottom -2.1em
  &-cards
    gci()
    hw(100, 80)
    grid-gap 60px
    grid-template-columns repeat(auto-fit, minmax(300px, auto))
  footer#main
    margin 1em 0 6em
</style>