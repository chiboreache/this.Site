export state = ->
  list:
    [
      {
        payload: 'build && deploy && repeat'
        bool: true
      }
      {
        payload: 'Convert Flask Server into REST API'
        bool: false
      }
      {
        payload: '[ ½ ] Connect Pathify to Nuxt Vuex Store.'
        bool: false
      }
      {
        payload: 'Xmodmap generator with heatmap.'
        bool: false
      }
      {
        payload: 'MultiSearchEngine Parser. {{ Python || Nim }}'
        bool: false
      }
      {
        payload: 'Pacstrap configurator.  ⨠  {{ Api Flask }} '
        bool: false
      }
      {
        payload: 'Onetab™ data visualisation.  ⨠  {{ Redis || MongoDB }} × {{ D3.js || Neo4j }}'
        bool: false
      }
      {
        payload: "Community web portal. Tut's storage.  ⨠  {{ Serverless ? SQLite }}"
        bool: false
      }
      {
        payload: 'Graph Browser.  ⨠  {{ Electron || Qt5 }}'
        bool: false
      }
    ]

export getters =
  todos: (state) -> state.list

export mutations =
  add: (state, payload) ->
    state.list.push(
      {
        payload
        bool: false
      }
    )
  remove: (state, payload) ->
    state.list.splice(
      state.list.indexOf(payload), 1
    )
  toggle: (state, payload) ->
    payload.bool = !payload.bool
