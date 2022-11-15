import { ApolloClient, InMemoryCache, HttpLink } from '@apollo/client/core'
import { onError } from '@apollo/client/link/error'
import { logErrorMessages } from '@vue/apollo-util'

function getHeaders () {
  const headers: {Authorization?: string, 'x-hasura-admin-secret'?: string} = {}
  // const token = window.localStorage.getItem("apollo-token")
  // if (token) {
  //     headers["Authorization"] = `Bearer ${token}`
  // }
  headers['x-hasura-admin-secret'] = process.env.VUE_APP_HASURA_ADMIN_SECRET // TO DO: handle authorization

  return headers
}

const httpLink = new HttpLink({
  uri: process.env.VUE_APP_GRAPHQL_ENDPOINT,
  fetch: (uri: RequestInfo, options: RequestInit) => {
    options.headers = getHeaders()
    return fetch(uri, options)
  }
})

const errorLink = onError((error) => {
  if (process.env.NODE_ENV !== 'production') {
    logErrorMessages(error)
  }
})

export const apolloClient = new ApolloClient({
  cache: new InMemoryCache(),
  link: errorLink.concat(httpLink)
})
