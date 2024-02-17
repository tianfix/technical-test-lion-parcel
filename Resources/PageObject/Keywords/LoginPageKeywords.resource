# Created by Chrystian at 2/16/2024
*** Settings ***
Library    SeleniumLibrary
Resource    ../Locators/LoginPageLocators.resource

*** Keywords ***
close_browser
    Close all browsers

open_web_page
    Open browser    ${baseUrl}     chrome
    Page should contain element    ${loginTitlePage}

login_valid_credential
    Input text    ${userNameTextField}    standard_user
    Input text    ${passwordTextField}  secret_sauce
    Click button    ${loginButton}

validate_error_login_empty_password
    Page should contain element  ${loginErrMsg}
    ${err_msg} =    Get text    ${loginErrMsg}
    Should be equal    ${err_msg}   ${empty_password_err_msg}

validate_error_login_empty_username
    Page should contain element    ${loginErrMsg}
    ${err_msg} =    Get text    ${loginErrMsg}
    Should be equal    ${err_msg}   ${empty_username_err_msg}