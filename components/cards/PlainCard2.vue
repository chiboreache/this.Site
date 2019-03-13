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
    background:
      linear-gradient(90deg, white 30%, black 0) center / 1em,
      linear-gradient(white 50%, black 0) left / auto
    // background-blend-mode:exclusion
    background-position: 0.55em
    s = 3em
    background-size: (s) (s)
    .content
      display: grid;
      place-content: space-between;
      height: 100%;
      padding 1.2em
      h1
      h3
      a
        background white
        display inline-block
        padding 0.3em 0.4em
      header
        margin-top 14.5%
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
        margin-top -23%
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
