<template>
  <div>
    <input v-model="msgBox" placeholder="message here"></input>
    <button v-if="messageChannel" @click="speak">送信</button>
  </div>
</template>

<script>
export default {
data() {
  return {
    msgBox: "",
    messages: [],
    messageChannel: null,
  };
},
created() {
  this.messageChannel = this.$cable.subscriptions.create( "messageChannel",{
    received: (data) => {
      this.messages.push(data)
    },
  })
},
methods: {
  speak() {
    this.messageChannel.perform('speak', { 
    message: msgBox,
    });
  },
},
}
</script>
