*** Settings ***
Documentation    Arquivo contendo as keywords para mapeamento dos elementos da UI relacionados a criação de contas

Library         SeleniumLibrary
Library         FakerLibrary
Library         String

Resource    ../keywords/common_keywords.robot

*** Variables ***
${AUTENTICATION_PAGE_EMAIL_FIELD}               id:email_create
${AUTENTICATION_PAGE_EMAIL_CHECKED}             //div[contains(@class, "form-ok")]
${AUTENTICATION_PAGE_CREATE_ACCOUNT_BUTTON}     id:SubmitCreate

${ACCOUNT_CREATION_FORM}                        id:account-creation_form
${PERSONAL_INFORMATION_FIRST_NAME}              id:customer_firstname
${PERSONAL_INFORMATION_LAST_NAME}               id:customer_lastname
${PERSONAL_INFORMATION_EMAIL}                   //input[@id="email" and @value="$$"]
${PERSONAL_INFORMATION_PASSWORD}                id:passwd
${CHECKBOX_SPECIAL_OFFERS}                      id:optin

${ADDRESS_INFORMATION_FIRST_NAME}               id:firstname
${ADDRESS_INFORMATION_LAST_NAME}                id:lastname
${ADDRESS_INFORMATION_ADDRESS}                  id:address1
${ADDRESS_INFORMATION_CITY}                     id:city
${ADDRESS_INFORMATION_STATE}                    //select[@id="id_state"]
${ADDRESS_INFORMATION_POST_CODE}                id:postcode
${ADDRESS_INFORMATION_COUNTRY}                  //select[@id="id_country"]
${ADDRESS_INFORMATION_MOBILE_PHONE}             id:phone_mobile
${PERSONAL_INFORMATION_REGISTER_BUTTON}         id:submitAccount

${USER_INFORMATION_ERROR_BANNER}                //div[contains(@class, "alert-danger")]

${MY_ACCOUNT_PAGE}                              id:my-account

*** Keywords ***
Input User Email In Autentication Page
    [Arguments]    ${email}

    Input Text If Element Is Visible    ${AUTENTICATION_PAGE_EMAIL_FIELD}    ${email}
    Click If Element Is Visible         ${AUTENTICATION_PAGE_HEADER}
    Wait Until Element Is Visible       ${AUTENTICATION_PAGE_EMAIL_CHECKED}

Click In Create Account Button In Autentication Page

    Click If Element Is Visible         ${AUTENTICATION_PAGE_CREATE_ACCOUNT_BUTTON}    20s
    Wait Until Element Is Visible       ${ACCOUNT_CREATION_FORM}

Select Personal State
    [Arguments]    ${state}

    Select From List By Value    ${ADDRESS_INFORMATION_STATE}    ${state}

Verify If Personal Email Is Visible
    [Arguments]    ${email}

    ${user_email}    Replace String    ${PERSONAL_INFORMATION_EMAIL}    $$    ${email} 
    Wait Until Element Is Visible    ${user_email}

Verify If Page Contains Special Offers Checkbox

    Page Should Contain Checkbox           ${CHECKBOX_SPECIAL_OFFERS} 

Selecting Special Offers Checkbox
    [Arguments]    ${user_can_receive_especial_offers} 
    
    Run Keyword If    '${user_can_receive_especial_offers}' == 'true'    Select Checkbox    ${CHECKBOX_SPECIAL_OFFERS}
    Run Keyword If    '${user_can_receive_especial_offers}' == 'true'    Checkbox Should Be Selected    ${CHECKBOX_SPECIAL_OFFERS}

Verify If Personal Information Password is Visible

    Wait Until Element Is Visible    ${PERSONAL_INFORMATION_PASSWORD}

Input Persoal Information Password
    [Arguments]    ${password}

    Input Password      ${PERSONAL_INFORMATION_PASSWORD}      ${password}

Select Personal Information Password Label

    Click If Element Is Visible  //label[@for="passwd"]
    Wait Until Element Is Visible    //label[@for="passwd"]//ancestor::div[contains(@class, "form-ok")]

Input First Name In Personal Information
    [Arguments]    ${first_name}

    Input Text If Element Is Visible      ${PERSONAL_INFORMATION_FIRST_NAME}    ${first_name} 

Input Last Name In Personal Information
    [Arguments]    ${last_name}

    Input Text If Element Is Visible      ${PERSONAL_INFORMATION_LAST_NAME}     ${last_name}

Check Address First Name
    [Arguments]    ${first_name}

    Check Element Attribute               ${ADDRESS_INFORMATION_FIRST_NAME}     ${first_name}    value 

Check Address Last Name
    [Arguments]    ${last_name}

    Check Element Attribute               ${ADDRESS_INFORMATION_LAST_NAME}      ${last_name}     value

Input Address Information
    [Arguments]    ${address}

    Input Text If Element Is Visible      ${ADDRESS_INFORMATION_ADDRESS}        ${address}

Input City Information  
    [Arguments]    ${city}

    Input Text If Element Is Visible      ${ADDRESS_INFORMATION_CITY}           ${city}   

Input Post Code
    [Arguments]    ${postal_code}

    Input Text If Element Is Visible      ${ADDRESS_INFORMATION_POST_CODE}      ${postal_code} 

Input Mobile Phone
    [Arguments]    ${mobile_phone}

    Input Text If Element Is Visible      ${ADDRESS_INFORMATION_MOBILE_PHONE}   ${mobile_phone}

Click In Personal Information Register Button

    Click If Element Is Visible           ${PERSONAL_INFORMATION_REGISTER_BUTTON}

Verify If Register Information Error Banner Is Not Visible 

    Wait Until Element Is Not VIsible     ${USER_INFORMATION_ERROR_BANNER}  
      
Check If My Account Page Is Visible
    Wait Until Element Is Visible    ${MY_ACCOUNT_PAGE}
