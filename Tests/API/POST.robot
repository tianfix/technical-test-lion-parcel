# Created by Chrystian at 2/17/2024
*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    OperatingSystem
Library    jsonschema
Resource   ../../Resources/PageObject/TestData/APITestData.resource


*** Test Cases ***
POST_Create User: Should return success with code 201
    ${body}   Create dictionary    name=morpheus  job=leader
    ${response}   POST  ${base_url}${users}/${param_user_id}  data=${body}    expected_status=201

POST_Create User: Validate JSON Schema
    ${body}   Create dictionary    name=morpheus  job=leader
    ${response}   POST  ${base_url}${users}/${param_user_id}  data=${body}    expected_status=201
    Validate json by schema file    ${response.json()}   ${CURDIR}${/}json${/}post_create_user_schema.json

POST_Create User: Should return same passed name and job
    ${name}     Set variable    morpheus
    ${job}      Set variable    leader
    ${body}     Create dictionary    name=${name}   job=${job}
    ${response}   POST  ${base_url}${users}/${param_user_id}  data=${body}    expected_status=201

    ${response_name}   get value from json     ${response.json()}      $.name
    Should be equal as strings  ${response_name[0]}    ${name}

    ${response_job}   get value from json     ${response.json()}      $.job
    Should be equal as strings  ${response_job[0]}    ${job}

POST_Create User: Should return success with name param only
    ${name}    Set variable    morpheus
    ${body}   Create dictionary    name=${name}
    ${response}   POST  ${base_url}${users}/${param_user_id}  data=${body}    expected_status=201

    ${response_name}   get value from json     ${response.json()}      $.name
    Should be equal as strings  ${response_name[0]}    ${name}

POST_Create User: Should return success with job param only
    ${job}     Set variable    leader
    ${body}   Create dictionary    job=${job}
    ${response}   POST  ${base_url}${users}/${param_user_id}  data=${body}    expected_status=201

    ${response_job}   get value from json     ${response.json()}      $.job
    Should be equal as strings  ${response_job[0]}    ${job}

POST_Create User: Should return success with no payload
    ${response}   POST  ${base_url}${users}/${param_user_id}  expected_status=201





