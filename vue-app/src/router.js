import Vue from 'vue'
import Router from 'vue-router'
import About from './components/About.vue'
import LandingPage from './components/LandingPage.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
    path: '/',
    name: 'landing-page',
    component: LandingPage,
   },
   {
    path: '/about',
    name: 'about',
    component: About,
   }
  ]
})

