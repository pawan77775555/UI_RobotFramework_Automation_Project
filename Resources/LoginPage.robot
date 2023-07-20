*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/LoginPage.py
*** Variables ***

${LoginPageTitle}       Swag Labs
${SuccesfulLoginTitle}      Swag Labs

*** Keywords ***

Open My Browser
    [Arguments]    ${URL}   ${Browser}
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Title Should Be    ${LoginPageTitle}
    capture page screenshot     Screenshots/LoginPage.png

Enter UserName And Password
    [Arguments]    ${UserName}  ${Password}
    Element Should Be Enabled    ${UserName_TextBox_ID}
    Input Text    ${UserName_TextBox_ID}    ${UserName}
    Element Should Be Enabled    ${PassWord_TextBox_ID}
    Input Password      ${PassWord_TextBox_ID}    ${Password}

Click Sign In
    Click Button    ${Login_Button_ID}

Verify Successful Login
    Title Should Be    ${SuccesfulLoginTitle}
    capture page screenshot     Screenshots/HomePage.png