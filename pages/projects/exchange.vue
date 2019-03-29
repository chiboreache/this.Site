<template lang="pug">
.exchange
  section(v-if='usd')
    label $ 
      input(
        :placeholder='calcUSD | toDecimal'
        readonly
        )
      span ₽
    label € 
      input(
        :placeholder='calcEUR | toDecimal'
        readonly
        )
      span ₽
    label ¥ 
      input(
        :placeholder='calcCNY | toDecimal'
        readonly
        )
      span ₽
    hr
    label.main
      input(
        v-model='factor'
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
  data: ->
    usd: ''
    eur: ''
    cny: ''
    factor: 1
  created: -> @getData()
  methods:
    # getDateNow: ->
    #   dt = new Date
    #   nowDay = dt.getUTCDate().toString().padStart(2, '0')
    #   nowMonth = (dt.getUTCMonth() + 1).toString().padStart(2, '0')
    #   nowYear = dt.getUTCFullYear()
    #   return "#{nowDay}/#{nowMonth}/#{nowYear}/"

    currencyFilter: (list, currency) ->
      list.filter (item) -> item.CharCode['_text'] == currency

    getValue: (item) -> parseFloat(item[0].Value['_text'].replace(',', '.'))

    getData: ->
      convert = require('xml-js')

      proxy = 'https://cors-cbr.herokuapp.com/'
      url = 'https://www.cbr.ru/scripts/XML_daily_eng.asp'

      xml = await axios.get proxy + url

      result = convert.xml2js xml.data, { compact: true, spaces: 4 }
      listItems = result.ValCurs.Valute

      @usd = @getValue(@currencyFilter(listItems, 'USD'))
      @eur = @getValue(@currencyFilter(listItems, 'EUR'))
      @cny = @getValue(@currencyFilter(listItems, 'CNY'))

    # multCur: (arg) ->
    #   (arg * @factor).toFixed(2)
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
    font-size 2.2em
    tright(5em)
    section
      gcc()
      tdown(20vh)
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