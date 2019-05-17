import Vue from 'vue/dist/vue.esm.js'
import Header from './components/header.vue'
import Router from './router/router'

// let app = new Vue({
//     router,
//     render(h) {
//         return h('router-view');
//     },
// }).$mount('#app');

var app=new Vue({
    router: Router,
    el:'#app',
    components: {
        'navbar': Header,
    }
});