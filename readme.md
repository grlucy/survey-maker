# Survey Maker

## Requirements

- Node v16 (npm v8)
- Docker

## Data

1. From the data/docker directory, run `docker compose up`.
1. In the docker container, find the graphql engine and open in browser. This will open the Hasura console.
1. Go to settings and import metadata from the data/hasura/hasura_metadata.json file.
1. Go to the API tab and use the GraphiQL Explorer to interact with the database.

Sample query:

```
query getSurvey ($surveyId: Int!) {
  survey: svm_survey(where: {survey_id: {_eq: $surveyId}}) {
    creator {
      email
    }
    survey_title
    survey_short_description
    survey_long_description
    questions {
      question_text
      responses {
        response_text
        response_value
      }
    }
  }
}
```

## UI

In the `/ui` directory you will need a .env file with the following variables:

```
VUE_APP_AUTH0_DOMAIN=
VUE_APP_AUTH0_CLIENT_ID=
VUE_APP_AUTH0_AUDIENCE=
```
