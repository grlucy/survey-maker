/* eslint-disable */
<template>

    <button @click="login">Log in</button>

</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component'
import { useAuth0 } from '@auth0/auth0-vue'

@Options({
    props: {
        msg: String
    }
})
export default class Login extends Vue {
    email = ''
    password = ''

    msg!: string

    login() {
        this.$auth0.loginWithRedirect()
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
    margin: 40px 0 0;
}

ul {
    list-style-type: none;
    padding: 0;
}

li {
    display: inline-block;
    margin: 0 10px;
}

a {
    color: #42b983;
}
</style>
