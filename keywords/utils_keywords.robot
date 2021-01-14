*** Settings ***
Documentation    Utils/Common keywords

Library   SeleniumLibrary
Library    FakerLibrary
Library         String

Variables    ../robot_local_variables.py

*** Variables ***
${PAGE_INDEX_LOCATOR}                           css=#index
${SIGN_IN_LINK}                                 //a[contains(@class, "login")]
${AUTENTICATION_PAGE_HEADER}                    //h1[text()="Authentication"]

*** Keywords ***
Open Home Page
    Open Browser    ${TESTED_HOST}    ${BROWSER}    
    Maximize Browser Window
    Wait Until Element Is Visible    ${PAGE_INDEX_LOCATOR}

Suite Test Setup
    ${user_data}=    Creat Test User
    Set Suite Variable    ${USER}    ${user_data}
    Open Home Page

Open Autenticantion Page
    Click If Element Is Visible    ${SIGN_IN_LINK}
    Wait Until Element Is Visible    ${AUTENTICATION_PAGE_HEADER}

Get User Email
    [Arguments]    ${first_name}    ${last_name}
    ${first_name_lower_case}=    Convert To Lower Case    ${first_name}
    ${last_name_lower_case}=    Convert To Lower Case    ${last_name}
    
    ${emailname}=    Catenate    SEPARATOR=    ${first_name_lower_case}    ${last_name_lower_case}
    ${email}=    Catenate    SEPARATOR=    ${emailname}    @orbia.ag

    Should Not Be Empty    ${email}

    [Return]    ${email}

Get User Password
    ${random}=    Evaluate	random.randint(5, 10)
    ${password}             FakerLibrary.Password    length=${random}    special_chars=False    digits=True    upper_case=True    lower_case=True
    Should Not Be Empty    ${password}

    [Return]    ${password}

Creat Test User
    ${name}=    FakerLibrary.Name
    ${first_name}    ${last_name}=    Split String    ${name}
    ${email}=   Get User Email    ${first_name}    ${last_name}
    ${password}=    Get User Password
    ${address}=    FakerLibrary.Address 
    ${city}=       FakerLibrary.City
    ${postal_code}=    FakerLibrary.postcode 
    ${mobile_phone}=    Set Variable    8573931196

    &{user}     Create Dictionary    name=${name}    email=${email}    password=${password}    address=${address}    city=${city}    postal_code=${postal_code}    mobile_phone=${mobile_phone}

    [Return]    ${user}

Mouse Over If Element Is Visible
    [Arguments]   ${element}  ${wait_time}=10s

    Wait Until Element Is Visible     ${element}    ${wait_time}
    Mouse Over    ${element}

Click If Element Is Visible
    [Arguments]   ${element}  ${wait_time}=10s

    Mouse Over If Element Is Visible     ${element}    ${wait_time}
    Click Element  ${element}

Input Text If Element Is Visible
    [Arguments]   ${element}    ${text}    ${wait_time}=10s

    Wait Until Element Is Visible     ${element}    ${wait_time}
    Input Text  ${element}    ${text}

Check Element Attribute
    [Arguments]    ${element_locator}    ${expected_value}    ${attribute}

    Wait Until Element Is Visible    ${element_locator}
    ${return_value}=    Get Element Attribute    ${element_locator}    ${attribute}

    Should Be Equal    ${return_value}    ${expected_value}

Create User Account
    [Arguments]    ${user}    ${user_can_receive_especial_offers}=true

    Open Autenticantion Page
    Set User Email And Click In Create Account Button    ${user.email}
    Set User Personal Information, Address And Click In Register Button    ${user}    ${user_can_receive_especial_offers}
    Verify If My Account Page Is Visible

String Replace
    [Documentation]  Replaces the ocurrences of '$$' for the respective strings.
    [Arguments]  ${template_string}  @{replacement_strings}

    FOR    ${string}    IN    @{replacement_strings}
        ${template_string} =   Replace String    ${template_string}   $$   ${string}    count=1
    END

    [Return]    ${template_string}
