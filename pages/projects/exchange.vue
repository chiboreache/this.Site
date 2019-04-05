<template lang="pug">
.exchange
  section(v-if='listItems')
    label $ 
      input(
        :placeholder='animUSD | toDecimal'
        readonly
        )
      span ₽
    label € 
      input(
        :placeholder='animEUR | toDecimal'
        readonly
        )
      span ₽
    label ¥ 
      input(
        :placeholder='animCNY | toDecimal'
        readonly
        )
      span ₽
    hr
    label.main
      input(
        v-model='factor'
        @wheel='wheelFactor'
        title='Use your scroll wheel or just type a new value'
        id='main'
        )
  section(v-else)
    label $ 
      input(
        placeholder='Heroku is'
        readonly
        )
      span ₽
    label € 
      input(
        placeholder='waking up now'
        readonly
        )
      span ₽
    label ¥ 
      input(
        placeholder='please wait...'
        readonly
        )
      span ₽
    hr
    label.main
      input(
        placeholder='Thanks 😄'
        id='main'
        )
</template>
<script lang="coffee">
import axios from 'axios'
export default
  head: ->
    title: 'exchange'
    script: [{ src: "https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenLite.min.js" }]
  data: ->
    listItems: null
    usd: 0
    eur: 0
    cny: 0
    animUSD: 0
    animEUR: 0
    animCNY: 0
    factor: 1
  created: -> @getData()
  mounted: ->
    if @listItems
      @procData()
  watch:
    calcUSD: (update) -> TweenLite.to(@$data, 0.5, { animUSD: update })
    calcEUR: (update) -> TweenLite.to(@$data, 0.5, { animEUR: update })
    calcCNY: (update) -> TweenLite.to(@$data, 0.5, { animCNY: update })
  methods:
    wheelFactor: (e) ->
      if e.deltaY < 0
        @factor += 1
      if e.deltaY > 0
        @factor -= 1
    currencyFilter: (list, currency) ->
      list.filter (item) -> item.CharCode['_text'] == currency
    getValue: (item) -> parseFloat(item[0].Value['_text'].replace(',', '.'))
    getData: ->
      convert = require('xml-js')
      proxy = 'https://cors-cbr.herokuapp.com/'
      url = 'https://www.cbr.ru/scripts/XML_daily_eng.asp'
      xml = await axios.get proxy + url
      result = convert.xml2js xml.data, { compact: true, spaces: 4 }
      @listItems = result.ValCurs.Valute
      @procData()
    procData: ->
      @usd = @getValue(@currencyFilter(@listItems, 'USD'))
      @eur = @getValue(@currencyFilter(@listItems, 'EUR'))
      @cny = @getValue(@currencyFilter(@listItems, 'CNY'))
  computed:
    calcUSD: -> (@usd * @factor)
    calcEUR: -> (@eur * @factor)
    calcCNY: -> (@cny * @factor)
  filters:
    toDecimal: (i) -> i.toFixed(2)
</script>
<style lang="stylus" scoped>
.exchange
    hwv(100)
    gcc()
    font-size 2.2em
    tright(5em)
    section
      gcc()
      hr
        width 57%
        tleft(35.5%)
        border 1.5px solid black
      .main
        padding-top 1em
        width 86%
        tright(0.4em)
        &::after
        &::before
          content '❋'
          font-size 1em
      label
        padding 0.5em
        font-size 1.1em
        width 20em
        input
          tdown(.05em)
          outline none
          border none
          background transparent
          font-size 1.2em
          width 50%
          text-align center
</style>