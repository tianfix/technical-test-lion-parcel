# Created by Chrystian at 2/17/2024
*** Settings ***
Library    SeleniumLibrary
Resource    ../Locators/InventoryPageLocators.resource
Resource    ../Locators/CheckoutPageLocators.resource
Resource    ../TestData/productData.resource

*** Keywords ***
open_cart_page
    Click element    ${cartButton}

validate_cart_page
    ${url}=   Get Location
    Should be equal  ${url}    ${cartPageUrl}
    Page should contain element    ${titleCartPage}

validate_product_on_cart_page
    Page should contain element     //*[text()="${exmProductName}"]
    Page should contain element     //*[text()="${exmProductDesc}"]
    Page should contain element     //*[text()="${exmProductPrice}"]

continue_checkout_step_one
    Click element    ${checkoutButton}

continue_checkout_step_two
    Click element    ${continueButton}

continue_checkout_finish
    Click element   ${finishButton}

validate_your_information_page
    ${url}=   Get Location
    Should be equal  ${url}    ${yourInformationPageUrl}
    Page should contain element    ${titleYourInformationPage}

input_valid_user_information
    Input text    ${firstNameTxtField}      Ratih
    Input text    ${lastNameTxtField}       Yoyo
    Input text    ${postalCodeTxtField}     123

validate_overview_page
    ${url}=   Get Location
    Should be equal  ${url}    ${overviewPageUrl}
    Page should contain element    ${titleOverviewPage}

validate_err_information
    [Arguments]     ${errMsg}
    Page should contain element    //*[text()="${errMsg}"]

validate_product_on_overview_page
    Page should contain element     //*[text()="${exmProductName}"]
    Page should contain element     //*[text()="${exmProductDesc}"]
    Page should contain element     //*[text()="${exmProductPrice}"]

validate_complete_checkout_page
    ${url}=   Get Location
    Should be equal  ${url}    ${completeCheckoutPageUrl}
    Page should contain element    ${titleCompleteCheckoutPage}
    Page should contain element    ${successIcon}
    Page should contain element    ${successTitle}
    Page should contain element    ${successDesc}

cancel_checkout
    Click element    ${cancelCheckoutButton}
