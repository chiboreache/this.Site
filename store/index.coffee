import pathify from 'vuex-pathify'


import todo from './modules/todo'
import main from './modules/main'


# console.log('STORE FILE LOADED!')


export plugins = [ pathify.plugin ]
export modules =
  {
    main
    todo
  }
# export actions =
#   nuxtServerInit: (context, value) ->
#     console.log('NUXT_SERVER_INIT!')

