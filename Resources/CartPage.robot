*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/CartPage.py
*** Variables ***
${ProductsPageTitle}      Swag Labs
*** Keywords ***

Verify Title Of Cart Page
    Title Should Be    ${ProductsPageTitle}
    capture page screenshot     Screenshots/CartPage.png

Check Quantity Of Products
    ${GetCount}     Get Text    ${Quantity_Xpath}
    Should Be Equal     ${GetCount}     1

Click On Checkout
    capture page screenshot     Screenshots/CartPage.png
    Click Element    ${Checkout_Button_ID}

