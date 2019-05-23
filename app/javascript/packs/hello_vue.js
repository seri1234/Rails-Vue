import Vue from 'vue';
import ActionCable from 'actioncable';
import Chat from '../app.vue';


new Vue({
  components: {
    Chat,
  template: '<Chat/>',
  },
}).$mount('#app');