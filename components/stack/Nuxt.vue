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
          https://cdn-images-1.medium.com/max/1200/1*ktJUMJO60oHoluiEV6KBmA.png \
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