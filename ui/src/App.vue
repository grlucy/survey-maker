<template>
  <nav>
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
  </nav>
  <LogOut v-if="isAuthenticated" />
  <router-view/>
</template>

<script>
  import { useAuth0 } from '@auth0/auth0-vue'
  import LogOut from './components/LogOut.vue'

  export default {
    components: {
      LogOut
    },
    setup(){
      const { isAuthenticated } = useAuth0()
      return { isAuthenticated }
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
