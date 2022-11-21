import gql from 'graphql-tag'
export const getUser = gql`
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
    `
