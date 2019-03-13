<template lang="pug">
  .stack-badge(
    style='--badge-bg-image: url(\
    https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fstylus.svg?alt=media&token=d11a2864-df8a-4072-865d-524ed73d0887)'
    title="Stylus"
    )
    .stack-list
      .first(style='--first-bg-image: url(\
        https://icons-for-free.com/free-icons/svg/128/1313568.svg \
      )')
</template>
<script lang="coffee">
import Tooltip from './tooltip/Tooltip'
export default
  components:
    {
      Tooltip
    }
</script>