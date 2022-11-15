import { createApp, provide, h } from 'vue'
import { createAuth0 } from '@auth0/auth0-vue'
import { DefaultApolloClient } from '@vue/apollo-composable'
import { apolloClient } from './apollo-client'
import App from './App.vue'
import router from './router'
import store from './store'

createApp({
  setup () {
    provide(DefaultApolloClient, apolloClient)
  },
  render: () => h(App)
}).use(store).use(router).use(
  createAuth0({
    domain: process.env.VUE_APP_AUTH0_DOMAIN,
    client_id: process.env.VUE_APP_AUTH0_CLIENT_ID,
    redirect_uri: window.location.origin,
    audience: process.env.VUE_APP_AUTH0_AUDIENCE
  })
).mount('#app')
