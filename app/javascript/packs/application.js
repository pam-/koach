/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue';
import axios from 'axios';

import './styles/index';

// Set a default CSRF token
let token = document.getElementsByName('csrf-token')[0].getAttribute('content');
axios.defaults.headers.common['X-CSRF-Token'] = token;
axios.defaults.headers.common['Accept'] = 'application/json';
window.axios = axios;

import App from "./components/app.vue";

// Declare a global component: modal
// Vue.component('base-modal', require('./components/base-modal.vue').default);

const app = new Vue({
  el: '#app',
  components: {
    App
  }
});
