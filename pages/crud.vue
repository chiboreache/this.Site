<template lang="pug">
.crud
  br
  br
  br
  br

  form(@keyup.enter='logIn')
    input(type='text' v-model='user' placeholder='user')
    input(type='text' v-model='pass' placeholder='pass')
    button(@click.prevent='logIn' ) LOGN

  form#post(@keyup.enter='postData')
    input(type='text' v-model='rname' placeholder='text')
    input(type='number' step='0.01' v-model='rweight' placeholder='float')
    button(@click.prevent='postData') POST

  br
  br
  br
  br

  button#get(@click='getData') GET
  .response(
    v-for='item in res'
    :key="item.id"
    )
    button(@click='delData(item.id)') DEL
    input(type='text' v-model='item.name' :placeholder='item.name')
    input(type='number' step='0.01' v-model='item.weight' :placeholder='item.weight')
    button(@click='putData(item.id, item.name, item.weight)') PUT

  br
  br
  br

</template>
<script lang="coffee">
import axios from 'axios'
# btw — CORS proxy on the heroku hosting has a wakeup time
axios.defaults.baseURL = 'https://cors-cbr.herokuapp.com/http://conquest.weekendads.ru'
export default
  name: 'crud'
  head: ->
    title: 'crud'
  data: ->
    res: null
    token: null
    rname: null
    rweight: null
    user: null
    pass: null
  methods:
    logIn: ->
      res = await axios(
        method: 'post'
        url: '/login_check'
        headers: 'Content-Type': 'application/json'
        data:
          username: @user
          password: @pass
      )
      @token = res.data.token

    getData: ->
      res = await axios.get '/rabbit/list', headers: "Authorization": "Bearer #{@token}"
      @res = res.data

    postData: ->
      await axios(
        method: 'post'
        url: "/rabbit"
        headers:
          {
            "Authorization": "Bearer #{@token}",
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        data: "rabbit[name]=#{@rname}&rabbit[weight]=#{@rweight}"
      )
      @rname = null
      @rweight = null

    putData: (id, name, weight) ->
      await axios(
        method: 'post'
        url: "rabbit/#{id}"
        headers:
          {
            "Authorization": "Bearer #{@token}",
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        data: "rabbit[name]=#{name}&rabbit[weight]=#{weight}"
      )

    delData: (id) ->
      await axios(
        method: 'delete'
        url: "rabbit/#{id}"
        headers:
          {
            "Authorization": "Bearer #{@token}",
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        )
</script>
<style lang="stylus" scoped>
.crud
  gcc()
  line-height 0.5em
  hwv(100)
  padding-bottom 15em
  form
    hw(100)
    margin-left 2em
</style>