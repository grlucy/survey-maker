<template>
  <nav>
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
  </nav>
  <LogOut v-if="isAuthenticated" />
  <Login v-else />
  <p>
    {{                                                                                                                              user                                                                                                                              }}
  </p>
  <router-view />
</template>

<script>
import Login from './components/Login.vue'
import LogOut from './components/LogOut.vue'
import { useAuth0 } from '@auth0/auth0-vue'
import { mapState } from 'pinia'
import { useUserStore } from './store/index'

export default {
  name: 'app',
  components: {
    Login,
    LogOut
  },
  setup: function () {
    const userStore = useUserStore()

    return {
      userStore
    }
  },
  computed: {
    ...mapState(useUserStore, ['accessToken', 'isAuthenticated', 'user'])
  },
  mounted: async function () {
    const { getAccessTokenSilently, user, isAuthenticated } = useAuth0()

    this.userStore.$patch(
      {
        accessToken: await getAccessTokenSilently(),
        user,
        isAuthenticated
      }
    )
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
