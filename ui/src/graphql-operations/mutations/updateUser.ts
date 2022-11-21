import gql from 'graphql-tag'
export const updateUser = gql`mutation updateUser($userId: String!, $userObj: svm_user_set_input) {
  update_svm_user(where: {auth0_id: {_eq: $userId}}, _set: $userObj) {
    affected_rows
  }
}`
