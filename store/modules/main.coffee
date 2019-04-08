import { make } from 'vuex-pathify'


export state = ->
  splashGreet: false

# export getters =

export mutations =
  {
    ...make.mutations(state)
  }

export default
  {
    namespaced: true
    state
    # getters
    mutations
  }
