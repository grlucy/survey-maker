<template>
  <div class="about">
    <h1>User Information</h1>
    <p>
      Please tell us a little bit about yourself!
    </p>
    <form>
      <p>
        <label for="firstName">First Name</label>
        <input type="text" id="firstName" pattern="/^[a-z ,.'-]+$/i" />
        <label for="lastName">Last Name</label>
        <input type="text" id="lastName" pattern="/^[a-z ,.'-]+$/i" />
      </p>
      <fieldset>
        <legend>I would like to use this site to... (Select at least one)</legend>
        <input id="creator" type="checkbox" name="creator" value="creator">
        <label for="creator">Make surveys</label><br>
        <input id="taker" type="checkbox" name="taker" value="taker">
        <label for="taker">Take surveys</label>
      </fieldset>
      <p>
        <label for="dateOfBirth">Date of Birth</label>
        <input type="date" id="dateOfBirth" />
      </p>
      <p class="selectFlex">
        <label for="country">Country</label>
        <select name="country" id="country">
          <option v-for="item in countries" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p class="selectFlex">
        <label for="race">Race</label>
        <select name="race" id="race">
          <option v-for="item in races" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p class="selectFlex">
        <label for="gender">Gender</label>
        <select name="gender" id="gender">
          <option v-for="item in genders" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p class="selectFlex">
        <label for="maritalStatus">Marital Status</label>
        <select name="maritalStatus" id="maritalStatus">
          <option v-for="item in maritalStatus" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p class="selectFlex">
        <label for="educationLevel">Highest Education Level</label>
        <select name="educationLevel" id="educationLevel">
          <option v-for="item in educationLevels" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p class="selectFlex">
        <label for="incomeLevel">Income Level</label>
        <select name="incomeLevel" id="incomeLevel">
          <option v-for="item in incomeLevels" :key="item" :value="item">{{item}}</option>
        </select>
      </p>
      <p>
        <label for="numberOfChildren">Number of Children</label>
        <input type="number" name="numberOfChildren" id="numberOfChildren" min="0" max="50">
      </p>
      <input type="reset" name="reset" value="Reset">
    </form>
    <hr />
    <p>postgres user: {{result?.user?.[0]}}</p>
  </div>
</template>

<script lang="ts">
import gql from 'graphql-tag'
import { useQuery } from '@vue/apollo-composable'
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
  setup () {
    const userStore = useUserStore()
    const { result }: {result: any} = useQuery(gql`
      query getUser($userId: String!) {
        user: svm_user(where: {auth0_id: {_eq: $userId}}) {
          email
          user_roles {
            lkp_role {
              name
            }
          }
          country
          date_of_birth
          education_level
          first_name
          gender
          income_level
          last_name
          marital_status
          number_of_children
          race
        }
      }
    `, {
      userId: userStore.user?.sub
    })

    return {
      result,
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
