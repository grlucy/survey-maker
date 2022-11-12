<template>
  <div class="about">
    <h1>This is an about page</h1>
    <form>
      <p>
        <label for="text1">Text</label>
        <input type="text" id="text1" />
      </p>
      <p>
        <input type="checkbox" value="checkbox" id="checkbox1" />
        <label for="checkbox1">Checkbox</label>
      </p>
      <p>
        <input type="radio" value="radio" id="radio1" />
        <label for="radio1">Radio</label>
      </p>
    </form>
    <hr />
    <p>user roles: {{result}}</p>
  </div>
</template>

<script lang="ts">
import gql from 'graphql-tag'
import { useQuery } from '@vue/apollo-composable'
export default {
  setup() {
    const {result} = useQuery(gql`
      query {
        svm_user {
          email
                user_roles {
                  lkp_role {
              name
            }
          }
        }
      }
    `)
    return {result}
  },
}
</script>