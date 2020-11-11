*** Settings ***
Documentation    Arquivo contendo as keywords para realizão dos tests

Library   Selenium2Library
Library    FakerLibrary
Library         String

Resource    ../keywords/utils_keywords.robot

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
Set User Email And Click In Create Account Button
    [Arguments]    ${email}
    Input Text If Element Is Visible    ${AUTENTICATION_PAGE_EMAIL_FIELD}    ${email}
    Click If Element Is Visible     ${AUTENTICATION_PAGE_HEADER}
    Wait Until Element Is Visible    ${AUTENTICATION_PAGE_EMAIL_CHECKED}
    Click If Element Is Visible     ${AUTENTICATION_PAGE_CREATE_ACCOUNT_BUTTON}    20s
    Wait Until Element Is Visible    ${ACCOUNT_CREATION_FORM}

Select User State
    ${random}=    Evaluate	random.randint(1, 53)
    ${random}=    Convert To String    ${random}
    Select From List By Value    ${ADDRESS_INFORMATION_STATE}    ${random}

Check If Email Is Visible In Personal Information Form
    [Arguments]    ${email}

    ${email}    Replace String    ${PERSONAL_INFORMATION_EMAIL}    $$    ${user.email}          
    Wait Until Element Is Visible    ${email}

Select Especial Offers Checkbox
    [Arguments]    ${user_can_receive_especial_offers}
    
    Page Should Contain Checkbox           ${CHECKBOX_SPECIAL_OFFERS}  
    Run Keyword If    '${user_can_receive_especial_offers}' == 'true'    Select Checkbox    ${CHECKBOX_SPECIAL_OFFERS}
    Run Keyword If    '${user_can_receive_especial_offers}' == 'true'    Checkbox Should Be Selected    ${CHECKBOX_SPECIAL_OFFERS}

Set Password In Personal Information Form
    [Arguments]    ${password}

    Wait Until Element Is Visible    ${PERSONAL_INFORMATION_PASSWORD}
    Input Password      ${PERSONAL_INFORMATION_PASSWORD}      ${password}  
    Click If Element Is Visible  //label[@for="passwd"]
    Wait Until Element Is Visible    //label[@for="passwd"]//ancestor::div[contains(@class, "form-ok")]

Set User Personal Information
    [Arguments]    ${user}    ${user_can_receive_especial_offers}

    ${first_name}    ${last_name}=    Split String    ${user.name}
    Input Text If Element Is Visible      ${PERSONAL_INFORMATION_FIRST_NAME}    ${first_name}            
    Input Text If Element Is Visible      ${PERSONAL_INFORMATION_LAST_NAME}     ${last_name}  
       
    Check If Email Is Visible In Personal Information Form    ${user.email}   

    Select Especial Offers Checkbox    ${user_can_receive_especial_offers}

Set User Address Information
    [Arguments]    ${user}

    ${first_name}    ${last_name}=    Split String    ${user.name}
    Check Element Attribute               ${ADDRESS_INFORMATION_FIRST_NAME}     ${first_name}    value           
    Check Element Attribute               ${ADDRESS_INFORMATION_LAST_NAME}      ${last_name}     value    

    Input Text If Element Is Visible      ${ADDRESS_INFORMATION_ADDRESS}        ${user.address}          
    Input Text If Element Is Visible      ${ADDRESS_INFORMATION_CITY}           ${user.city}    
    Select User State      
    Select From List By Value             ${ADDRESS_INFORMATION_COUNTRY}     21         
    Input Text If Element Is Visible      ${ADDRESS_INFORMATION_POST_CODE}      ${user.postal_code}         
    Input Text If Element Is Visible      ${ADDRESS_INFORMATION_MOBILE_PHONE}   ${user.mobile_phone}   

    Set Password In Personal Information Form      ${user.password}

Click In Create Account Register Button And Check Register Success
    Click If Element Is Visible           ${PERSONAL_INFORMATION_REGISTER_BUTTON}
    Wait Until Element Is Not VIsible     ${USER_INFORMATION_ERROR_BANNER}

Set User Personal Information, Address And Click In Register Button
    [Arguments]    ${user}    ${user_can_receive_especial_offers}

    Set User Personal Information    ${user}    ${user_can_receive_especial_offers}               
    Set User Address Information     ${user}
    Click In Create Account Register Button And Check Register Success    
      
Verify If My Account Page Is Visible
    Wait Until Element Is Visible    ${MY_ACCOUNT_PAGE}