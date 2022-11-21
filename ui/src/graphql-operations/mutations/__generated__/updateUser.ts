/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

import { svm_user_set_input } from "./../../../../__generated__/globalTypes";

// ====================================================
// GraphQL mutation operation: updateUser
// ====================================================

export interface updateUser_update_svm_user {
  __typename: "svm_user_mutation_response";
  /**
   * number of rows affected by the mutation
   */
  affected_rows: number;
}

export interface updateUser {
  /**
   * update data of the table: "svm.user"
   */
  update_svm_user: updateUser_update_svm_user | null;
}

export interface updateUserVariables {
  userId: string;
  userObj?: svm_user_set_input | null;
}
