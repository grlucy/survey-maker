<template>
  <div class="about">
    <h1>User Information</h1>
    <p>
      Please tell us a little bit about yourself!
    </p>
    <form @submit.prevent="handleUserSubmit">
      <p>
        <label for="firstName">First Name</label>
        <input type="text" name="first_name" id="firstName" :value="user.first_name" />
        <label for="lastName">Last Name</label>
        <input type="text" name="last_name" id="lastName" :value="user.last_name" />
      </p>
      <fieldset>
        <legend>I would like to use this site to... (Select at least one)</legend>
        <input id="creator" type="checkbox" name="creator" value="creator" :checked="user.user_roles?.find(role => role.lkp_role.name === 'Creator') ? true : false">
        <label for="creator">Make surveys</label><br>
        <input id="taker" type="checkbox" name="taker" value="taker" :checked="user.user_roles?.find(role => role.lkp_role.name === 'Taker') ? true : false">
        <label for="taker">Take surveys</label>
      </fieldset>
      <p>
        <label for="dateOfBirth">Date of Birth</label>
        <input type="date" name="date_of_birth" id="dateOfBirth" :value="user.date_of_birth" />
      </p>
      <p class="selectFlex">
        <label for="country">Country</label>
        <select name="country" id="country" :value="user.country">
          <option v-for="item in countries" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p class="selectFlex">
        <label for="race">Race</label>
        <select name="race" id="race" :value="user.race">
          <option v-for="item in races" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p class="selectFlex">
        <label for="gender">Gender</label>
        <select name="gender" id="gender" :value="user.gender">
          <option v-for="item in genders" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p class="selectFlex">
        <label for="maritalStatus">Marital Status</label>
        <select name="marital_status" id="maritalStatus" :value="user.marital_status">
          <option v-for="item in maritalStatus" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p class="selectFlex">
        <label for="educationLevel">Highest Education Level</label>
        <select name="education_level" id="educationLevel" :value="user.education_level">
          <option v-for="item in educationLevels" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p class="selectFlex">
        <label for="incomeLevel">Income Level</label>
        <select name="income_level" id="incomeLevel" :value="user.income_level">
          <option v-for="item in incomeLevels" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p>
        <label for="numberOfChildren">Number of Children</label>
        <input type="number" name="number_of_children" id="numberOfChildren" min="0" max="50" :value="user.number_of_children">
      </p>
      <input type="submit" value="Submit">
    </form>
  </div>
</template>

<script lang="ts">
/* eslint-disable camelcase */
import { useMutation, useQuery } from '@vue/apollo-composable'
import { computed } from 'vue'
import { getUser } from '../graphql-operations/queries/getUser'
import type { getUser_user } from '../graphql-operations/queries/__generated__/getUser'
import { updateUser } from '../graphql-operations/mutations/updateUser'
import { useUserStore } from '../store/index'
import { countryList } from '../enums/countries'
import { raceList } from '../enums/races'
import { educationLevels } from '../enums/educationLevels'
import { genderList } from '../enums/genders'
import { maritalStatus } from '../enums/maritalStatus'
import { incomeLevels } from '../enums/incomeLevels'

export default {
  data () {
    return {
      countries: countryList,
      races: raceList,
      educationLevels: educationLevels,
      genders: genderList,
      maritalStatus: maritalStatus,
      incomeLevels: incomeLevels
    }
  },
  methods: {
    handleUserSubmit (submitEvent: Event) {
      const target = submitEvent.target as HTMLFormElement
      const userObj: getUser_user = {}
      for (const el of target.elements) {
        const { name, value }: { name: keyof getUser_user | 'creator' | 'taker', value: string | boolean | null } = el
        if (name === 'creator' || name === 'taker') {
          // TO DO: handle updating roles
          console.log(name, el.checked)
        } else if (name) {
          userObj[name] = value || null
        }
      }
      this.mutateUser({
        userId: this.userStore.user?.sub,
        userObj
      })
    }
  },
  setup () {
    const userStore = useUserStore()
    const { result }: {result: any} = useQuery(getUser, {
      userId: userStore.user?.sub
    })
    const user = computed(() => result.value?.user?.[0] ?? {})

    const { mutate: mutateUser } = useMutation(updateUser)

    return {
      user,
      mutateUser,
      userStore
    }
  }
}
</script>

<style>
label {
  margin: 0 8px;
}
.selectFlex {
  margin: 0 auto;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}
.selectFlex label {
  width: 180px;
  text-align: left;
}
select {
  width: 370px;
}
</style>
