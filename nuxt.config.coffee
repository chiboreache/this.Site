pkg = require './package'
resolve = require('path').resolve

module.exports =

  mode: 'universal'

  #
  # Headers of the page
  #
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


  # Customize the progress-bar color
  loading:
    {
      color: '#3B8070'
    }



  # Plugins to load before mounting the App
  # plugins:
  #   [
  #   ]


  # Nuxt.js modules
  modules:
    [
      '@nuxtjs/style-resources'
      # '@nuxtjs/axios'
      './modules/coffeescript'
    ]
  # axios:
  #   {
  #   }


  # Global CSS
  css:
    [
      '~assets/cardbase.styl'
    ]

  # Global Stylus
  styleResources:
    stylus:
      [
        '~assets/mixins.styl'
      ]

  # build:
  #   extend = (config, ctx) ->
  #     # minimize: false
  #     parallel: true