pkg = require './package'
resolve = require('path').resolve

module.exports =
  mode: 'universal'
  head:
    title: pkg.name
    meta:
      [
        {
          charset: 'utf-8'
        }
        {
          name: 'viewport'
          content: 'width=device-width, initial-scale=1'
        }
        {
          hid: 'description'
          name: 'description'
          content: pkg.description
        }
      ]
    link:
      [
        rel: 'icon'
        type: 'image/x-icon'
        href: '/favicon.ico'
      ]
  loading:
    {
      color: '#0056FD'
      height: '5px'
    }
  plugins:
    [
      '~/store/index.coffee'
      '~/plugins/cookies'
    ]
  modules:
    [
      '@nuxtjs/style-resources'
      './modules/coffeescript'
      # '@nuxtjs/axios'
    ]
  # axios:
  #   {
  #   }
  css:
    [
      '~assets/cardbase.styl'
    ]
  styleResources:
    stylus:
      [
        '~assets/mixins.styl'
      ]
  serverMiddleware: ['~/serverMiddleware/selectiveSSR.js']
  build:
    vendor: ['three', 'vue-three']
  #   extend = (config, ctx) ->
  #     # minimize: false
  #     parallel: true