# Created by Chrystian at 2/16/2024
*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/PageObject/Locators/LoginPageLocators.resource
Resource    ../../Resources/PageObject/Locators/InventoryPageLocators.resource
Resource    ../../Resources/PageObject/Keywords/LoginPageKeywords.resource
Resource    ../../Resources/PageObject/Keywords/InventoryPageKeywords.resource

Test Setup  open_web_page
Test Teardown    close_browser

*** Test Cases ***
User able to login with valid credential
    Login_valid_credential
    #Expect user redirect to inventory page
    Validate_inventory_page

User able to login with empty username
    Input text    ${passwordTextField}    standard_user
    Click button   ${loginButton}
    Validate_error_login_empty_username

User not able to login with empty password
    Input text    ${userNameTextField}    standard_user
    Click button    ${loginButton}
    Validate_error_login_empty_password

User not able to login with empty username & password
    Click button    ${loginButton}
    Validate_error_login_empty_username

User able to dismiss error login message
    Click button    ${loginButton}
    Click button    ${dismissErrButton}
    Page should not contain element    ${loginErrMsg}
