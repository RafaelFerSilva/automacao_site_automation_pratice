*** Settings ***
Documentation    Arquivo contendo as keywords para realizão dos tests

Resource    ../pages/create_account_page.robot

*** Keywords ***
Set User Email And Click In Create Account Button
    [Arguments]    ${email}
    Input User Email In Autentication Page    ${email}
    Click In Create Account Button In Autentication Page

Select Random User State
    ${random}=    Evaluate	random.randint(1, 53)
    ${random}=    Convert To String    ${random}
    Select Personal State    ${random}

Select Especial Offers Checkbox
    [Arguments]    ${user_can_receive_especial_offers}
    
    Verify If Page Contains Special Offers Checkbox 
    Selecting Special Offers Checkbox    ${user_can_receive_especial_offers} 

Set Password In Personal Information Form
    [Arguments]    ${password}

    Verify If Personal Information Password is Visible
    Input Persoal Information Paswword
    Select Personal Information Password Label

Set User Personal Information
    [Arguments]    ${user}    ${user_can_receive_especial_offers}

    ${first_name}    ${last_name}=    Split String    ${user.name}
    Input First Name In Personal Information    ${first_name}            
    Input Last Name In Personal Information     ${last_name}  
       
    Verify If Personal Email Is Visible    ${user.email}   

    Select Especial Offers Checkbox    ${user_can_receive_especial_offers}

Set User Address Information
    [Arguments]    ${user}

    ${first_name}    ${last_name}=    Split String    ${user.name}
    Check Address First Name    ${first_name}           
    Check Address Last Name      ${last_name}   

    Input Address Information        ${user.address}          
    Input City Information    ${user.city}     
    Select Personal State    21    
           
    Input Post Code      ${user.postal_code}         
    Input Mobile Phone   ${user.mobile_phone}   

    Input Persoal Information Password      ${user.password}

Set User Informations
    [Arguments]    ${user}    ${user_can_receive_especial_offers}

    Set User Personal Information    ${user}    ${user_can_receive_especial_offers}              
    Set User Address Information     ${user}

Click In Create Account Register Button And Check Register Success
    Click In Personal Information Register Button
    Verify If Register Information Error Banner Is Not Visible 
    Check If My Account Page Is Visible  
      
The User Wants To Create An Account
    [Arguments]    ${user}

    Open Autenticantion Page
    Set User Email And Click In Create Account Button    ${user.email}

The User Adds His Information In The Account Registration Mode
    [Arguments]    ${user}    ${user_can_receive_especial_offers}

    Set User Informations    ${USER}    ${user_can_receive_especial_offers}

Register Account

    Click In Create Account Register Button And Check Register Success

The User Account Will Be Created

    Check If My Account Page Is Visible
