*** Settings ***
Documentation    Create User Account

Library   SeleniumLibrary

Resource    ../../resources/keywords/create_account_keywords.robot

Suite Setup    Suite Test Setup
Suite Teardown    Close Browser

Force Tags    create_account

*** Test Cases ***

A New User Must Be Able To Create An Account
    [Tags]    smoke    p1-p1

    Open Autenticantion Page
    Set User Email And Click In Create Account Button    ${USER.email}

    Set User Informations    ${USER}    true
    Click In Create Account Register Button And Check Register Success 
    Check If My Account Page Is Visible
