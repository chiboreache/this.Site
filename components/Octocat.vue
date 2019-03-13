<template lang="pug">
.octo-card
  a(
    :href='url'
    )
    .face
      img(
        src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Ei-sc-github.svg/200px-Ei-sc-github.svg.png"
        width="35px"
      )
    .back
        img(
          src="\
            https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fstar.svg?alt=media&token=2d373ccb-800e-4417-aa54-219910692028\
          "
        )
        h1 {{ stargazers }}
</template>
<script lang="coffee">
export default
  name: 'octocat'
  props:
    [
      'stargazers'
      'url'
    ]
</script>
<style lang="stylus" scoped>
w = 14rem
.octo-card
  display block
  position fixed
  down(5em)
  margin-left (w / 2) - 1.2em
  .face
  .back
    hwpx(30)
    position absolute
    backface-visibility hidden
    transition ease-in-out 600ms
    perspective 100em
    transition: cubic-bezier(0, 0.6, 1, -0.21) 600ms
  .back
    transform rotateY(180deg)
    img
      rd(0.45em, 0.5em)
    h1
      opacity 0
      rd(-1em, -1.8em)
      font-size 1.5em
      transition all 0.3s
      transition-timing-function cubic-bezier(0.21, 1.43, 0.04, 1.64)
  &:hover
    .face
      roty(180)
    .back
      rotx(0)
      h1
        opacity 1
        rd(2.5em, -1.8em)
        transition-delay .5s
</style>