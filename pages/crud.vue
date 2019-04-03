<template lang="pug">
.crud
  br
  br
  br
  br
  #login(v-if='!token')
    form(@keyup.enter='logIn')
      input(type='submit' value='          ' disabled)
      input(type='text' v-model='user' placeholder='user')
      input(type='text' v-model='pass' placeholder='pass')
      input(type='submit' value='LOGIN' @click.prevent='logIn')
  #response(v-else)
    ul(v-for='item, key in tokenDecode')
      li
        span {{ key }}: 
        span(v-text='item')
    p issued at → {{ parseUnix(tokenDecode.iat) }}
    | expiration → {{ parseUnix(tokenDecode.exp) }}

    br
    br
    br
    br
    br
    br
    form#post(@keyup.enter='postData')
      input(type='submit' value='          ' disabled)
      input(type='text' v-model='rname' placeholder='text')
      input(type='number' step='0.01' v-model='rweight' placeholder='float')
      input(type='submit' value=' POST ' @click.prevent='postData')

    br
    br
    br
    br

    input#get(type='submit' value='GET' @click='getData')
    form(
      v-for='item in res'
      :key="item.id"
      )
      input#del(type='submit' value='  DEL  ' @click.prevent='delData(item.id)')
      input(type='text' v-model='item.name' :placeholder='item.name')
      input(type='number' step='0.01' v-model='item.weight' :placeholder='item.weight')
      input#put(type='submit' value='  PUT  ' @click.prevent='putData(item.id, item.name, item.weight)')

    br
    br
    br

    #audit(v-show='token')
      b Possible vulnerabilities:
      ol
        li HTTPS — to prevent MITM attack
        li HTTP — also allowing some Injections hack input forms
        li proper HTTP method — POST instead PUT
        li to be honest, server doesn't allow to create item with random ID, but still
        li auto-incremented ID's instead UUID
        li missing some security headers
    br

    input#logout(type='submit' value='LOGOUT' @click='removeCookie')

</template>
<script lang="coffee">
import axios from 'axios'
import jwtDecode from 'jwt-decode'
# btw — CORS proxy on the heroku hosting has a wakeup time
# axios.defaults.baseURL = 'http://conquest.weekendads.ru'
axios.defaults.baseURL = 'https://cors-cbr.herokuapp.com/http://conquest.weekendads.ru'
export default
  name: 'crud'
  head: ->
    title: 'crud'
  data: ->
    res: null
    token: null
    deToken: null
    rname: null
    rweight: null
    user: null
    pass: null

  mounted: -> @loadCookies()

  methods:
    parseUnix: (dateObj) ->
      options =
        {
          weekday: 'long'
          year: 'numeric'
          month: 'long'
          day: 'numeric'
        }
      new Date(dateObj * 1000).toLocaleTimeString("ru-RU", options)

    tokenToCookie: (token) -> @$cookies.set(
      'tokenJWT_cookie'
      token
      {
        expires: 1/24
        path: '/crud'
      })

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
      @tokenToCookie(@token)
      @tokenDecode

    getData: ->
      res = await axios.get '/rabbit/list', headers: "Authorization": "Bearer #{@token}"
      @res = res.data

    postData: ->
      await axios(
        method: 'post'
        url: "/rabbit"
        headers:
          "Authorization": "Bearer #{@token}"
          'Content-Type': 'application/x-www-form-urlencoded'
        data: "rabbit[name]=#{@rname}&rabbit[weight]=#{@rweight}"
      )
      @rname = null
      @rweight = null
      @getData()

    putData: (id, name, weight) ->
      await axios(
        method: 'post'
        url: "rabbit/#{id}"
        headers:
          "Authorization": "Bearer #{@token}"
          'Content-Type': 'application/x-www-form-urlencoded'
        data: "rabbit[name]=#{name}&rabbit[weight]=#{weight}"
      )

    delData: (id) ->
      await axios(
        method: 'delete'
        url: "rabbit/#{id}"
        headers:
          "Authorization": "Bearer #{@token}"
          'Content-Type': 'application/x-www-form-urlencoded'
        )
      @getData()

    cookies: -> @$cookies.cookies
    loadCookies: -> @token = @$cookies.cookies.tokenJWT_cookie
    getCookies: -> @$Cookies.get('tokenJWT_cookie', {path:'/crud'})
    removeCookie: ->
      @$cookies.remove 'tokenJWT_cookie', {path:'/crud'}
      location.reload(true)

  computed:
    tokenDecode: -> @deToken = jwtDecode(@token)

</script>
<style lang="stylus" scoped>
.crud
  gcc()
  hwv(100)
  line-height 0.5em
  padding-bottom 3em
  #audit
    hwe(14.5, 32.2)
    line-height 1.3em
    font-size 0.9em
    padding 1em
    border 3px dashed rgba(255, 100, 100, 0.6)
    background rgba(255, 200, 200, 0.3)
  #get
  #logout
    hw(100)
</style>