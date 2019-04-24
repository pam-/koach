<template lang="html">
  <div class="timeslot">
    <button v-if="openTimeSlot" @click="sendApptRequest">Book!</button>
    <div v-else class="coach-schedule__timeslots-booked">{{ from }} - {{ to  }}</div>
  </div>
</template>

<script>
import moment from 'moment';

export default {
  props: ['data'],
  data: function () {
    return {
      timeSlot: JSON.parse(this.data).timeSlot,
      clientId: JSON.parse(this.data).clientId
    }
  },
  methods: {
    sendApptRequest() {
      let slot = this.timeSlot
      axios.post('appointments', {
        coach_id: this.timeSlot.coach_id,
        client_id: this.clientId,
        time_slot_id: this.timeSlot.id
      })
      .then(function(res) {
        // need flash message
        slot.is_open = false
      })
      .catch(function(err) {
        // better error handling here
        console.log(err)
      })
    }
  },
  computed: {
    openTimeSlot() {
      return this.timeSlot.is_open
    },
    from() {
      return moment(this.timeSlot.from).format("HH:mm");
    },
    to() {
      return moment(this.timeSlot.to).format("HH:mm");
    },
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
