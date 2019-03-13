<template lang="pug">
  .stack-badge(
    style="--badge-bg-image: url(\
      https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fnojs.svg?alt=media&token=de0b5820-fbcc-4a91-a163-97fe2067f907\
    ); cursor: not-allowed"
    title="No JS"
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