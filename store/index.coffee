import pathify from 'vuex-pathify'


import todo from './modules/todo'


console.log('STORE FILE LOADED!')


export plugins = [ pathify.plugin ]
export modules =
  {
    todo
  }
export actions =
  nuxtServerInit: (context, value) ->
    console.log('NUXT_SERVER_INIT!')

