*** Settings ***
Documentation    test för selenium.com
Library    SeleniumLibrary
Suite Setup    Open Browser    ${url}    ${browser}

*** Variables ***
${url}    https://automationplayground.com/crm/
${name}    John
${surname}    Doe
${city}    Boston
${username}    user@gmail.se
${password}    password
${browser}    Chrome

*** Test Cases ***
Create new costumer
    Given User has logged in
    When User creates new customer
    Then Customer information is added

*** Keywords ***
User has logged in
    [Setup]    
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
    Select From List By Index    //select[@id='StateOrRegion']    4
    Click Element    //input[@value='male']
    Click Element    //input[@name='promos-name']
    Click Button    //button[normalize-space()='Submit']

Customer information is added
    Wait Until Page Contains    Success! New customer added.