# Created by Chrystian at 2/16/2024
*** Settings ***
Library    SeleniumLibrary
Resource    ../Locators/LoginPageLocators.resource

*** Variables ***
${inventoryPageUrl}   ${base_url}/inventory.html
${inventoryTitlePage}  //*[@id="header_container"]
${addToCartButton}  //*[@id="add-to-cart-sauce-labs-backpack"]
${removeFromCart}   //*[@id="remove-sauce-labs-backpack"]