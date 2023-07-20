*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/CartPage.py
*** Variables ***
${CartPageTitle}      Swag Labs
${ProductNameContains}      Sauce Labs
*** Keywords ***

Verify Title Of Cart Page
    Title Should Be    ${ProductsPageTitle}
    capture page screenshot     Screenshots/CartPage.png

Check Number of Products
    Element Should Be Visible    ${Cart_Icon_Xpath}
    ${GetCount}     Get Text    ${Cart_Icon_Xpath}
    Should Be Equal     ${GetCount}     1

Check Quantity Of Products
    Page Should Contain    ${ProductNameContains}
    ${GetCount}     Get Text    ${Quantity_Xpath}
    Should Be Equal     ${GetCount}     1

Click On Checkout
    capture page screenshot     Screenshots/CartPage.png
    Click Element    ${Checkout_Button_ID}

