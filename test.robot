*** Settings ***
Documentation    test för selenium.com
Library    SeleniumLibrary

*** Variables ***
${url}    https://automationplayground.com/crm/
${name}    John
${surname}    Doe
${city}    Boston
${username}    user@gmail.se
${password}    password
${browser}    Chrome

*** Test Cases ***
Login with valid information
    Given User is on page
    When User logs in with username and password
    Then User should be logged in
    
Create new costumer
    Given User has logged in
    When User creates new customer
    Then Customer information is added

*** Keywords ***
User is on page
    Open Browser    browser=chrome
    Go To    ${url}
    Click Link    //a[@id='SignIn']

User logs in with username and password
    Input Text    //input[@id='email-id']    ${username}
    Input Password    //input[@id='password']    ${password}
    Click Button    //button[@id='submit-id']

User should be logged in
    Wait Until Page Contains Element    //a[@id='new-customer']
    
User has logged in
    Open Browser    browser=chrome
    Go To    ${url}
    Click Link    //a[@id='SignIn']
    Input Text    //input[@id='email-id']    ${username}
    Input Password    //input[@id='password']    ${password}
    Click Button    //button[@id='submit-id']

User creates new customer
    Click Link    //a[@id='new-customer']
    Input Text    //input[@id='EmailAddress']    ${username}
    Input Text    //input[@id='FirstName']    ${name}
    Input Text    //input[@id='LastName']    ${surname}
    Input Text    //input[@id='City']    ${city}
    Click Element    //input[@value='male']
    Click Element    //input[@name='promos-name']
    Click Button    //button[normalize-space()='Submit']

Customer information is added
    Wait Until Page Contains    Success! New customer added.