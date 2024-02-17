# Created by Chrystian at 2/16/2024
*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/PageObject/Locators/LoginPageLocators.resource
Resource    ../../Resources/PageObject/Locators/InventoryPageLocators.resource
Resource    ../../Resources/PageObject/Keywords/LoginPageKeywords.resource
Resource    ../../Resources/PageObject/Keywords/InventoryPageKeywords.resource
Resource    ../../Resources/PageObject/TestData/productData.resource
Resource    ../../Resources/PageObject/Keywords/CheckoutPageKeywords.resource

Test Setup  open_web_page
Test Teardown    close_browser

*** Test Cases ***
#Add/Remove Product to/from Cart
User able to add product to cart
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Close browser

User able to remove product from inventory page
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Remove_product_from_cart
    Close browser

User able to remove product from cart page
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Open_cart_page
    Remove_product_from_cart
    Page should not contain element  ${exmProductName}

#Checkout Process
User able to checkout cart and input information
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Open_cart_page
    Validate_product_on_cart_page
    Continue_checkout_step_one
    Validate_your_information_page

User able to continue checkout process by fulfill all information
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Open_cart_page
    Validate_product_on_cart_page
    Continue_checkout_step_one
    Validate_your_information_page
    Input_valid_user_information
    Continue_checkout_step_two
    Validate_overview_page

User not able to continue checkout process with empty first name
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Open_cart_page
    Validate_product_on_cart_page
    Continue_checkout_step_one
    Validate_your_information_page
    Input text    ${lastNameTxtField}   Yoyo
    Input text    ${postalCodeTxtField}     123
    Continue_checkout_step_two
    Validate_err_information    ${emptyFirstNameErrMsg}

User not able to continue checkout process with empty last name
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Open_cart_page
    Validate_product_on_cart_page
    Continue_checkout_step_one
    Validate_your_information_page
    Input text    ${firstNameTxtField}   Rara
    Input text    ${postalCodeTxtField}     123
    Continue_checkout_step_two
    Validate_err_information    ${emptyLastNameErrMsg}

User not able to continue checkout process with empty postal code
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Open_cart_page
    Validate_product_on_cart_page
    Continue_checkout_step_one
    Validate_your_information_page
    Input text    ${firstNameTxtField}   Rara
    Input text    ${lastNameTxtField}    Yaya
    Continue_checkout_step_two
    Validate_err_information    ${emptyPostalCodeErrMsg}

User able to finish checkout process
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Open_cart_page
    Validate_product_on_cart_page
    Continue_checkout_step_one
    Validate_your_information_page
    Input_valid_user_information
    Continue_checkout_step_two
    Validate_overview_page
    Validate_product_on_overview_page
    Continue_checkout_finish
    Validate_complete_checkout_page

#Cancelation
User able to cancel checkout on your information page
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Open_cart_page
    Validate_product_on_cart_page
    Continue_checkout_step_one
    Validate_your_information_page
    Cancel_checkout
    Validate_cart_page

User able to cancel checkout on checkout overview page
    Login_valid_credential
    Validate_inventory_page
    Open_product_detail     ${exmProductName}
    Validate_product_detail
    Add_product_to_cart
    Open_cart_page
    Validate_product_on_cart_page
    Continue_checkout_step_one
    Validate_your_information_page
    Input_valid_user_information
    Continue_checkout_step_two
    Cancel_checkout
    Validate_inventory_page