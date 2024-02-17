# Created by Chrystian at 2/17/2024
*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    OperatingSystem
Library    jsonschema
Resource   ../../Resources/PageObject/TestData/APITestData.resource
Resource    ../../Resources/PageObject/Keywords/APICommon.resource


*** Test Cases ***
GET_Single User: Should return success with code 200
    ${response}    GET    ${base_url}${users}/${param_user_id}    expected_status=200

GET_Single User: Validate JSON Schema
    ${response}    GET    ${base_url}${users}/${param_user_id}
    Validate json by schema file    ${response.json()}   ${CURDIR}${/}json${/}get_single_user_schema.json

GET_Single User: Should return same passed user id
    ${response}    GET    ${base_url}${users}/${param_user_id}
    ${response_user_id}   get value from json     ${response.json()}      $.data.id
    Should be equal as strings    ${response_user_id[0]}   ${param_user_id}

GET_Single User: Should return 404 when user not found
    ${response}    GET    ${base_url}${users}/${invalid_user_id}      expected_status=404

GET_Single User: Should return correct support url
    ${response}    GET    ${base_url}${users}/${param_user_id}
    ${responseSupportUrl} =   get value from json     ${response.json()}      $.support.url
    Should be equal as strings    ${responseSupportUrl[0]}   ${supportUrl}

GET_Single User: Should return correct support text
    ${response}    GET    ${base_url}${users}/${param_user_id}
    ${responseSupportText}   get value from json     ${response.json()}      $.support.text
    Should be equal as strings    ${responseSupportText[0]}   ${supportText}




