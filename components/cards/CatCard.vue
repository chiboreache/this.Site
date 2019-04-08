  <template lang="pug">
  .cat-card
    figure(
      @mouseover='isHover=true'
      @mouseleave='isHover=false, leaveCheck()'
      @click='isChoosed=!isChoosed'
      :class='{ disabled: isDisabled }'
      )
      svg( id='background' viewBox="0 0 320 480" fill='#F2F2F2' )
        path(d='M318 12V468C318 473.523 313.523 478 308 478H12C6.47716 478 2 473.523 2 468V47.4705C2 44.8184 3.05357 42.2749 4.92893 40.3995L40.3995 4.92893C42.2749 3.05357 44.8184 2 47.4706 2H308C313.523 2 318 6.47715 318 12Z')
      img(src='~/static/kot.png')
      svg( id='border' viewBox="0 0 320 480" fill='none' :stroke="colorStroke" stroke-width='6' )
        path(d='M318 12V468C318 473.523 313.523 478 308 478H12C6.47716 478 2 473.523 2 468V47.4705C2 44.8184 3.05357 42.2749 4.92893 40.3995L40.3995 4.92893C42.2749 3.05357 44.8184 2 47.4706 2H308C313.523 2 318 6.47715 318 12Z')
      figcaption
        transition(name="fade" mode="out-in")
          span(
            key='1'
            v-if='isHover && isChoosed && isLeaved'
            :style='{ color: colorStroke }'
            )#nee Котэ не одобряет?
          span(
            key='2'
            v-else
            )#default Сказочное заморское яство
        h1 Нямушка
        h3 {{ data.filling }}
        p
          b {{ data.portions }} 
          | порций
        p
          slot(name='gift')
      .circle(:style='{ background: colorStroke }')
        h2 {{ data.amount }}
          h5 кг
      .choosed-card(
        v-if='isChoosed'
        :style="choosedStyles"
        )
    footer
      p(v-if='isChoosed' v-text='data.footer')
      p(v-else-if='isDisabled' v-text='soldOut')#soldOut
      p(v-else) Чего сидишь? Порадуй котэ, 
        a(href='#!' @click='isChoosed = !isChoosed') купи.
    label(:class='{ switchOn: !isDisabled }' )
      input(
        @click='isDisabled=!isDisabled, isChoosed=false'
        type='checkbox'
        )
</template>
<script lang="coffee">
export default
  props:
    [
      'rgb'
      'data'
    ]
  name: 'cat-card'
  data: ->
    isDisabled: false
    isChoosed: false
    isHover: false
    isLeaved: false
  computed:
    soldOut: -> "Печалька, #{ @data.filling } закончился."
    rgbSlice: -> @rgb[1...-1]
    colorStroke: -> "rgba(#{ @rgbSlice }, 1)"
    choosedStyles: ->
      background: "rgba(#{ @rgbSlice }, 0.5)"
      transform: 'scale(1.1)'
  methods:
    leaveCheck: ->
      if @isChoosed and not @isHover
        @isLeaved=true
      else
        @isLeaved=false
</script>
<style lang="stylus" scoped>
.fade-enter-active
.fade-leave-active
  transition opacity 0.2s
.fade-enter
.fade-leave-to
  opacity: 0

.disabled
  filter contrast(0.4) brightness(1.2) grayscale(0.7)
  cursor not-allowed
  pointer-events none

fonts = {
  title: 48px
  subtitle: 24px
  slogan: 16px
  info: 14px
  boxw: 46px
}

factorCard = 1
card = {
  height: 480px * factorCard
  width: 320px * factorCard
}

.cat-card
  gci()
  margin-bottom 12em
  margin-top 5em
  user-select none
  position relative
  hwpx(card.height, card.width)
  .choosed-card
    hwpx(card.height, card.width)
    border-radius 0.5em
  figure
    hw(100)
    outline none
    cursor pointer
    figcaption
      rd(48px, 28px)
      z-index 3
      line-height 0.2em
      span
        font-size: fonts.slogan
        color gray
        font-weight 500
      span#default
        font-weight 300
        opacity 1
      h1
        font-size: fonts.title
        margin-top 45px
        font-weight 500
      h3
        font-size: fonts.subtitle
        padding-bottom 14px
        font-weight 500
      p
        font-size: fonts.info
        font-weight 300
        color gray
    .circle
      radius = 80px
      factorCircle = 1.2
      rd(
        card.width - radius * factorCircle,
        card.height - radius * factorCircle
        )
      width radius
      height @width
      border-radius 50%
      color white
      text-align center
      line-height 0.2em
      z-index 5
      position absolute
      h2
        font-size: fonts.boxw
        tdown(-0.15em)
        font-weight 400
        h5
          font-size: @font-size * 0.5
          ttop(0.6em)
          font-weight 300
          font-variant small-caps
  footer
    tdown(card.width)
    position absolute
    text-align center
    color white
    font-size 13px
    p#soldOut
      color #FFFF66
    a:any-link
      font-style italic
      color: #1698D9
      text-decoration: underline dashed
  figure
    figcaption
    img
    svg
      position absolute
    img
      z-index 2
      sc(factorCard)
    svg#border
      z-index 3
    svg#background
      z-index 1


factorSwitch = 10
factorSwitch = 2

switchSize = {
  h: (11)px * factorSwitch
  w: (26)px * factorSwitch
  dot: 1
}

colors = {
  active: rgb(30, 70, 30)
  switch: rgb(200, 20, 20)
  switchActive: lawngreen
  bg: rgb(80, 40, 40)
}

.switchOn
  background: colors.active
  &:after
    tr( r(switchSize.w - switchSize.h) s(switchSize.dot))
    background: colors.switchActive

label
  tdown(card.width + 50)
  position: absolute
  background: colors.bg
  display: block
  cursor: pointer
  border-radius: switchSize.h
  hwpx(switchSize.h, switchSize.w)
  box-shadow inset 0 0 5px 1px black
  border 2px solid black
  &:after
    background: colors.switch
    transition 0.5s
    content: ''
    position: absolute
    left 0
    top -2px
    sc(switchSize.dot)
    width: switchSize.h
    height @width
    border-radius @width
  &:active:after
    tr( rx(-180) s(switchSize.dot) )
  input[type=checkbox]
    visibility hidden
</style>