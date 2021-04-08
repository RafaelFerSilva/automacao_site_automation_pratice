*** Settings ***
Documentation    Buy Products

Library   SeleniumLibrary

Resource    ../../resources/keywords/create_account_keywords.robot
Resource    ../../resources/keywords/products_keywords.robot

Suite Setup    Run Keywords    Suite Test Setup    
...                     AND    Create User Account    

Suite Teardown    Close Browser 

Force Tags    products    buy_products_gherkin

*** Test Cases ***
The User Can By A Product 
    [Tags]    smoke   p1-p1

    ${product}=    Create Product Data    Dresses    Evening Dresses     Printed Dress    Pink    S  

    Given The User Find A Product    ${product} 
    When The User Add Product to Car    ${product}    ${USER} 
    And The User Select Payment Method    ${product}
    And The User Confirm Order
    Then The Product Will Appear In The User's Purchase History    ${product}    ${USER} 

The User Can Evaluate A Product
    [Tags]    p1-p1

    ${product}=    Create Product Data    Dresses    Evening Dresses     Printed Dress    Beige    M

    Given The User By A Product    ${product}    ${USER}
    When The User Evaluate A Product    ${product}     5    New Title    New Comment
    Then The Product Review Will Display In Product Page    ${product}
