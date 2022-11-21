/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: getUser
// ====================================================

export interface getUser_user_user_roles_lkp_role {
  __typename: "svm_lkp_roles";
  name: string;
}

export interface getUser_user_user_roles {
  __typename: "svm_user_roles";
  /**
   * An object relationship
   */
  lkp_role: getUser_user_user_roles_lkp_role;
}

export interface getUser_user {
  __typename: "svm_user";
  email: string;
  /**
   * An array relationship
   */
  user_roles: getUser_user_user_roles[];
  country: string | null;
  date_of_birth: any | null;
  education_level: string | null;
  first_name: string | null;
  gender: string | null;
  income_level: string | null;
  last_name: string | null;
  marital_status: string | null;
  number_of_children: number | null;
  race: string | null;
}

export interface getUser {
  /**
   * fetch data from the table: "svm.user"
   */
  user: getUser_user[];
}

export interface getUserVariables {
  userId: string;
}
