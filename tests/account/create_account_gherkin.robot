*** Settings ***
Documentation    Create User Account

Library   SeleniumLibrary

Resource    ../../resources/keywords/create_account_keywords.robot

Suite Setup    Suite Test Setup
Suite Teardown    Close Browser

Force Tags    create_account    create_account_gherkin

*** Test Cases ***

A New User Must Be Able To Create An Account - Gherkin
    [Tags]    smoke    p1-p1

    Given The User Wants To Create An Account    ${USER}
    When The User Adds His Information In The Account Registration Mode    ${USER}    true
    And Register Account
    Then The User Account Will Be Created
