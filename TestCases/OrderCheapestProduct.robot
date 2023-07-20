*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/LoginPage.robot
Resource    ../Resources/ProductsPage.robot
Resource    ../Resources/CartPage.robot
Resource    ../Resources/CheckOutPage.robot

*** Variables ***

${URL}      https://www.saucedemo.com/
${Browser}      Chrome
${UserName}     standard_user
${Password}     dummy
${FilterOption}     Price (low to high)
${FirstName}        Pawan
${LastName}     Nahar
${Postal}       445001

*** Test Cases ***
Order Cheapest Product
    Set Selenium Implicit Wait    5
    Open My Browser     ${URL}      ${Browser}
    Enter UserName And Password     ${UserName}     ${Password}
    Click Sign In
    Verify Successful Login
    Verify Title Of Products Page
    Filter the Products list        ${FilterOption}
    Select First Product From The List
    Navigate To Shopping Cart
    Verify Title Of Cart Page
    Check Quantity Of Products
    Click On Checkout
    Verify Title Of Checkout Page
    Provide FirstName       ${FirstName}
    Provide LastName        ${LastName}
    Provide PostalCode      ${Postal}
    Click On Continue
    Click On Finish
    Verify Successful Error Message
    Close All Browsers