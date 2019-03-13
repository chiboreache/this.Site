<template lang="pug">
  .stack-badge(
    style="--badge-bg-image: url(\
      https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fflask-wl.svg?alt=media&token=97898a60-ae2e-4fe4-982b-62f1b165747f \
    )"
    title="Flask"
  )
    .stack-list
      .first(
        style="--first-bg-image: url(\
          https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2FPandas.svg?alt=media&token=14f28b50-39ab-48a0-832d-62299fa7ba9f\
        )"
      )
      .second(
        style="--second-bg-image: url(\
          https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fsqlite-logo.svg?alt=media&token=db7f49be-9049-4c28-bd81-a720ada9a5f7\
        )"
      )
      .third(
        style="--third-bg-image: url(\
          https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fpython.svg?alt=media&token=a7b6f418-94a4-4fd6-b93c-865184c8ea1b\
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
