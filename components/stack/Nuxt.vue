<template lang="pug">
  .stack-badge(
    style="--badge-bg-image: url(\
      https://seeklogo.com/images/N/nuxt-logo-5EF50E1ABD-seeklogo.com.png \
      )"
    title="Nuxt"
      )
    .stack-list
      .first(
        style="--first-bg-image: url(\
          https://vuejs.org/images/logo.png \
          )"
        )
      .second(
        style="--second-bg-image: url(\
          https://firebasestorage.googleapis.com/v0/b/myawesomeasyncdb.appspot.com/o/stack%2Fcoffeescript.svg?alt=media&token=b9d28956-ffed-4251-abf7-52033eb616a4 \
          )"
        )
      .third(
        style="--third-bg-image: url(\
          https://dzone.com/storage/temp/4470476-js-logo.png \
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