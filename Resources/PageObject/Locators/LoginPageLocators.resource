# Created by Chrystian at 2/16/2024
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#Url
${baseUrl}     https://www.saucedemo.com

#Expected Message
${empty_password_err_msg}   Epic sadface: Password is required
${empty_username_err_msg}   Epic sadface: Username is required

#Component
${userNameTextField}  //*[@id="user-name"]
${passwordTextField}  //*[@id="password"]
${loginButton}  //*[@id="login-button"]
${loginTitlePage}    //title[text()="Swag Labs"]

#Appears When Err
${loginErrMsg}  //h3[contains(text(),"Epic sadface")]
${dismissErrButton}     //button[@class="error-button"]
