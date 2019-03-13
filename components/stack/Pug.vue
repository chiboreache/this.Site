<template lang="pug">
  .stack-badge(
    title="Pug"
    style="--badge-bg-image: url(\
      https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fpug.svg?alt=media&token=6d7e873e-23a5-4938-8bee-4d75901cba28 \
    )"
  )
    .stack-list
      .first(
        style="--first-bg-image: url(\
          https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fhtml.svg?alt=media&token=897e0422-8495-40b2-8225-d3569040388d \
        )"
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