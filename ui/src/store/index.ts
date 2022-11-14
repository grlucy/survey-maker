import { defineStore } from 'pinia'

export const useUserStore = defineStore('userStore', {
  // arrow function recommended for full type inference
  state: () => {
    return {
      accessToken: null,
      user: null,
      isAuthenticated: false
    }
  },
  getters: {

  },
  actions: {
    setUserProps (accessToken: any, user: any, isAuthenticated: boolean) {
      this.accessToken = accessToken
      this.user = user
      this.isAuthenticated = isAuthenticated
    }
  }
})
