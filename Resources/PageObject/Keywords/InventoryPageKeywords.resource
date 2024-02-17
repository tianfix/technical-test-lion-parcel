# Created by Chrystian at 2/16/2024
*** Settings ***
Library    SeleniumLibrary
Resource    ../Locators/LoginPageLocators.resource
Resource    ../Locators/InventoryPageLocators.resource
Resource    ../TestData/productData.resource

*** Variables ***

*** Keywords ***
validate_inventory_page
    ${url}=   Get Location
    Should be equal  ${url}    ${inventoryPageUrl}
    Page should contain element    ${inventoryTitlePage}

open_product_detail
    [Arguments]     ${productName}
    Click element    //*[text()="${productName}"]

validate_product_detail
    Page should contain element     //*[text()="${exmProductDesc}"]
    Page should contain element    //*[text()="${exmProductPrice}"]

add_product_to_cart
    Click button    ${addToCartButton}
    Page should contain button    ${removeFromCart}

remove_product_from_cart
    Click button    ${removeFromCart}