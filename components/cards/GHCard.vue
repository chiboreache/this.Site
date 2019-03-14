<template lang="pug">
  .card-wrapper(:created='getGitHubData')
    .card-body(
      :class="{ cardBackface: cardBackfaceEnabled, cardHovered: isCardHovered }"
      :style="{ '--bg-comp': 'url(' + getImg + ')'}"
      )
      .hover-zone(
        @click="cardBackfaceEnabled = !cardBackfaceEnabled"
        @mouseover="isCardHovered = !isCardHovered"
        @mouseout="isCardHovered = !isCardHovered"
        :class="{ cardHovered: isCardHovered }"
        )
      .content(
        v-show="!cardBackfaceEnabled"
        )
        header
            h1(
              :class="lenTitle"
              v-text="repoName"
              v-if='!link'
              )
            a(
              :href="'http://' + link"
              v-else
              )
              h1(
                :class="lenTitle"
                v-text="repoName"
                )
            hr
            h3 {{ description }}
            #dev
              p lenTitle is tooMuch: {{ lenTitle }}
              //- p ratelimit: {{ ratelimit }}
              p(v-once) ratelimit: {{ ratelimit }}
        main
          slot
        footer
          slot(name="stack-list")
            li stack-list slot
    .octocat-widget
      Octocat(
        :stargazers='stargazersCount'
        :url='htmlUrl'
      )
</template>
<script lang="coffee">
import axios from 'axios'
import Octocat from '~/components/Octocat'
export default
  name: 'ghcard'
  props: ['repoName', 'link']
  components:
    {
      Octocat
    }
  data: ->
    statusText: ''
    status: ''
    stargazersCount: ''
    description: ''
    htmlUrl: ''
    ratelimit: ''
    url: 'https://api.github.com/repos/chiboreache/'
    urlImage: 'https://raw.githubusercontent.com/chiboreache/'
    cardBackfaceEnabled: false
    isCardHovered: false
  computed:
    lenTitle: ->
      if @repoName.length > 10
        'tooMuch'
    getGitHubData: ->
      response = await axios.get(@url + @repoName)
      @statusText = response.statusText
      @status = response.status
      @stargazersCount = response.data.stargazers_count
      @description = response.data.description
      @htmlUrl = response.data.html_url
      @ratelimit = response.headers['x-ratelimit-remaining']
    getImg: ->
      @urlImage + @repoName + '/master/img/image-1.png'
</script>
<style lang="stylus" scoped>
#dev
  position absolute
  tl(-10em)
  color transparent
  cursor default
.content
  display: grid;
  place-content end
  place-content: space-between;
  height: 100%;
  padding 1.2em
  header
    margin-top 15%
    a
      text-decoration none
    hr
      border: none;
      border-top: 1.5px solid #333;
      color: #333;
      overflow: visible;
      text-align: center;
    h1
      font-size max(min(0.5vw, 1.9em), 3vw)
      font-size 2.7em
      font-weight lighter
      font-weight 300
      margin-top 0
      margin-bottom -0.4em
    .tooMuch
      margin-top 0.7em
      font-weight 400
      font-size 1.5em
      white-space: nowrap
    h3
      font-size 1.3em
      color dimgray
      font-weight 300
      margin-top 0.5em
      line-height 1.2em
      padding-bottom 1em
  main
    margin-top -23%
    font-style italic
    a
      text-decoration underline
    p
      font-size 1.05em
      font-weight 300
</style>
