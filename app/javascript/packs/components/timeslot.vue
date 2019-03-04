<template lang="html">
  <div class="timeslot">
    <p>{{  }}</p>
    <button>book!</button>
  </div>
</template>

<script>
export default {
  props: ['data'],
  data: function () {
    return {
      timeSlot: JSON.parse(this.data).timeSlot
    }
  }
}
</script>

<style lang="scss">
.index {
  height: 30px;
  width: 100px;
  border: 3px solid blue;
    p {
    font-size: 2em;
    text-align: center;
  }
}
</style>
