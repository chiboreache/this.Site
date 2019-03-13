<template lang="pug">
  .stack-badge(
    style="--badge-bg-image: url(\
      https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fpython.svg?alt=media&token=a7b6f418-94a4-4fd6-b93c-865184c8ea1b\
    ); cursor: default"
    title="Python"
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