<template lang="pug">
  .stack-badge(
    style="--badge-bg-image: url(\
      https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fheroku.svg?alt=media&token=01d46c27-5551-45f2-bdda-4b2631ed7076 \
    ); cursor: default"
    title="Herokku"
  )
</template>
<script lang="coffee">
import Tooltip from './tooltip/Tooltip'
export default
  components:
    {
      Tooltip
    }
</script>
