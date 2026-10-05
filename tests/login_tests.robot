*** Settings ***
Documentation     Basic Robot Framework test suite for the SauceDemo login page.
...               Covers a valid login and an invalid login scenario.
Library           SeleniumLibrary

*** Variables ***
${URL}                https://www.saucedemo.com/
${BROWSER}             chrome
${USERNAME_FIELD}      id:user-name
${PASSWORD_FIELD}      id:password
${LOGIN_BUTTON}        id:login-button
${ERROR_MESSAGE}       css:h3[data-test="error"]
${VALID_USERNAME}      standard_user
${VALID_PASSWORD}      secret_sauce
${INVALID_PASSWORD}    wrong_password

*** Test Cases ***
Valid Login Should Open Products Page
    [Documentation]    Logs in with a valid username and password and checks the Products page loads.
    Open Browser To Login Page
    Input Text          ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Password       ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Button         ${LOGIN_BUTTON}
    Wait Until Page Contains    Products
    Title Should Be      Swag Labs
    [Teardown]    Close Browser

Invalid Login Should Show Error Message
    [Documentation]    Logs in with a wrong password and checks the error message appears.
    Open Browser To Login Page
    Input Text          ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Password       ${PASSWORD_FIELD}    ${INVALID_PASSWORD}
    Click Button         ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${ERROR_MESSAGE}
    Element Should Contain    ${ERROR_MESSAGE}    Username and password do not match
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_FIELD}
