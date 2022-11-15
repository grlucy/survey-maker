import { defineStore } from 'pinia'

export const useUserStore = defineStore('userStore', {
  // arrow function recommended for full type inference
  state: () => {
    return {
      accessToken: null as string | null,
      user: null as {sub: string} | null,
      isAuthenticated: false as boolean
    }
  },
  getters: {

  },
  actions: {
    setUserProps (accessToken: string | null, user: {sub: string} | null, isAuthenticated: boolean) {
      this.accessToken = accessToken
      this.user = user
      this.isAuthenticated = isAuthenticated
    }
  }
})
