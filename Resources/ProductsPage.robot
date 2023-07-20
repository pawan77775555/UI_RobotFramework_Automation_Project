*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/ProductsPage.py
*** Variables ***
${ProductsPageTitle}      Swag Labs
${ProductsPageHeaders}      Products
*** Keywords ***

Verify Title Of Products Page
    Title Should Be    ${ProductsPageTitle}
    Page Should Contain    ${ProductsPageHeaders}
    #Run Keyword And Ignore Error    Handle Alert    Accept
    capture page screenshot     Screenshots/HomePage.png

Filter the Products list
    [Arguments]    ${FilterOption}
    Element Should Be Visible    ${Filter_DropDown_Xpath}
    Click Element    ${Filter_DropDown_Xpath}
    Click Element   //option[text()='${FilterOption}']

Select First Product From The List
    ${AddToCart_OR_Remove}  Get Text    ${AddToCart_FirstProduct_Xpath}
    IF      "${AddToCart_OR_Remove}" == "Add to cart"
        Click Element    ${AddToCart_FirstProduct_Xpath}
    END

Navigate To Shopping Cart
    capture page screenshot     Screenshots/HomePage.png
    Element Should Be Visible    ${ShoppingCart_Icon_Xpath}
    Click Element    ${ShoppingCart_Icon_Xpath}