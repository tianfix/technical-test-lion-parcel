# Created by Chrystian at 2/17/2024
*** Settings ***
Library    SeleniumLibrary
Resource    ../Locators/LoginPageLocators.resource

*** Variables ***
#Url
${cartPageUrl}  ${baseUrl}/cart.html
${yourInformationPageUrl}  ${baseUrl}/checkout-step-one.html
${overviewPageUrl}  ${baseUrl}/checkout-step-two.html
${completeCheckoutPageUrl}  ${baseUrl}/checkout-complete.html

#Elements
${cancelCheckoutButton}     //*[@id="cancel"]
${cartButton}   //*[@id="shopping_cart_container"]
${titleCartPage}    //*[text()="Your Cart"]
${checkoutButton}   //*[@id="checkout"]
${titleYourInformationPage}    //*[text()="Checkout: Your Information"]
${titleOverviewPage}    //*[text()="Checkout: Overview"]
${titleCompleteCheckoutPage}    //*[text()="Checkout: Complete!"]
${finishButton}     //*[@id="finish"]
${continueButton}   //*[@id="continue"]
${successIcon}      //*[@id="checkout_complete_container"]
${successTitle}     //*[text()="Thank you for your order!"]
${successDesc}      //*[text()="Your order has been dispatched, and will arrive just as fast as the pony can get there!"]

#TextField
${firstNameTxtField}    //*[@id="first-name"]
${lastNameTxtField}     //*[@id="last-name"]
${postalCodeTxtField}   //*[@id="postal-code"]

#Error Message
${emptyFirstNameErrMsg}     Error: First Name is required
${emptyLastNameErrMsg}      Error: Last Name is required
${emptyPostalCodeErrMsg}    Error: Postal Code is required
