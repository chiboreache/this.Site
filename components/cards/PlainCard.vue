<template lang="pug">
  .card-wrapper
    .card-body
      .content
        header
          h1
            slot(name='title') Title
        main
          h3
            slot(name='subtitle') Subtitle
          slot
        footer
          slot(name='footer')
</template>
<style lang="stylus" scoped>
.card-wrapper
  width 14em
  .card-body
    radius = 18px
    pos = -1px
    scale = 57px
    offset = scale / 2
    // radius = 2.5px
    // scale = 30px
    color = {
      background: white
      foreground: black
    }
    background:
        radial-gradient(color.foreground radius, transparent radius + 1),
        radial-gradient(color.foreground radius, transparent radius + 1),
        color.background
    background-position: (pos) (pos), (pos + offset) (pos + offset)
    background-size: (scale) (scale)
    .content
      display: grid;
      place-content: space-between;
      height: 100%;
      padding 1.1em
      h1
      h3
      a
        background white
        display inline-block
        padding 0.3em
      header
        margin-top 15%
        h1
          // font-size max(min(0.5vw, 1.9em), 3vw)
          font-size 2.7em
          font-weight 300
          margin-top 0
          margin-bottom -0.4em
        h3
          font-size 1.3em
          color dimgray
          font-weight 300
          margin-top 0.5em
          line-height 1.2em
          padding-bottom 1em
      main
        font-style italic
        p
          font-weight 300
          margin-top -0.7em
          line-height 1.2em
      footer
        padding-right 1em
        a
          margin-top -0.2em
</style>
