*** Settings ***
Documentation    Create User Account

Library   Selenium2Library

Resource    ../keywords/create_account_keywords.robot

Suite Setup    Suite Test Setup
Suite Teardown    Close Browser

*** Test Cases ***
A New User Must Be Able To Create An Account
    Open Autenticantion Page
    Set User Email And Click In Create Account Button    ${USER.email}
    Set User Personal Information, Address And Click In Register Button    ${USER}    true
    Verify If My Account Page Is Visible
