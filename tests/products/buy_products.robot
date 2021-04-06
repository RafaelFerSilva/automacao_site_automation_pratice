*** Settings ***
Documentation    Buy Products

Library   SeleniumLibrary

Resource    ../../resources/keywords/create_account_keywords.robot
Resource    ../../resources/keywords/products_keywords.robot

Suite Setup    Run Keywords    Suite Test Setup    
...                     AND    Create User Account    

Suite Teardown    Close Browser 

Force Tags    products    buy_products

*** Test Cases ***
The User Can By A Product   
    [Tags]    p1-p1

    ${product}=    Create Product Data    Dresses    Evening Dresses     Printed Dress    Pink    S
    Buy A Product    ${product}    ${USER}       

The User Can Evaluate A Product
    [Tags]    p1-p1

    ${product}=    Create Product Data    Dresses    Evening Dresses     Printed Dress    Beige    M
    Buy A Product    ${product}    ${USER}
    Evaluate A Product    ${product}     5    New Title    New Comment
