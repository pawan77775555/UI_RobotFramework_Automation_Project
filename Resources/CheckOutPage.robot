*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/CheckOutPage.py
*** Variables ***
${CheckOutPageTitle}      Swag Labs
${CheckOutInfoPageHeader}        Checkout: Your Information
*** Keywords ***
Verify Title Of Checkout Page
    Title Should Be    ${CheckOutPageTitle}
    Page Should Contain     ${CheckOutInfoPageHeader}
    capture page screenshot     Screenshots/CheckoutPage.png

Provide FirstName
    [Arguments]    ${Name}
    Element Should Be Enabled    ${FirstName_InputBox_ID}
    Input Text    ${FirstName_InputBox_ID}      ${Name}
Provide LastName
    [Arguments]   ${LastName}
    Element Should Be Enabled    ${LastName_InputBox_ID}
    Input Text    ${LastName_InputBox_ID}       ${LastName}
Provide PostalCode
    [Arguments]    ${Postal}
    Element Should Be Enabled    ${Postal_InputBox_ID}
    Input Text    ${Postal_InputBox_ID}     ${Postal}

Click On Continue
    capture page screenshot     Screenshots/CheckoutPage.png
    Click Element    ${Continue_Button_ID}

Click On Finish
    capture page screenshot     Screenshots/CheckoutPage.png
    Click Element    ${Finish_Button_ID}

Verify Successful Message
    Page Should Contain    Thank you for your order!
    capture page screenshot     Screenshots/CheckoutPage.png

Verify Payment Information Is Visible
    Page Should Contain    Payment Information

Verify Shipping Information Is Visible
    Page Should Contain    Shipping Information

Verify Price Total Is Visible
    Page Should Contain    Price Total

