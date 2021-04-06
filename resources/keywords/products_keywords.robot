*** Settings ***
Documentation    Keywords about product page

Resource    ./common_keywords.robot
Resource    ../pages/products_page.robot

*** Keywords ***
Create Product Data
    [Arguments]    ${category}    ${sub_category}    ${product_name}    ${color}    ${size}

    &{product}    Create Dictionary    category=${category}    sub_category=${sub_category}    product_name=${product_name}    color=${color}    size=${size}

    [Return]    ${product}

Open Dresses Product Submenu
    [Arguments]    ${menu}

    Mouse Over in Product Top Menu  ${menu}
    Verify Mouse Over In Produt Top Menu Item    ${menu} 

Select Product Submenu Item
    [Arguments]    ${menu}    ${sub_menu_item} 

    Click Product Sub Menu Item    ${menu}    ${sub_menu_item}    
    Check If Product Sub Menu Item Was Selected    ${sub_menu_item}

Select Product Color
    [Arguments]    ${color}

    Click Product Color    ${color}
    Check If Product Color Was Selected    ${color}

Select Product Size
    [Documentation]    value: S = 1
    ...                value: M = 2
    ...                value: L = 3
    [Arguments]    ${size}

    Select Product Size List Item    ${size} 
    Check if Product Size Was Selected   ${size}

Select Product In Grid 
    [Arguments]    ${product}

    Mouse Over On Product In Grid    ${product} 
    Click In Product Details    ${product}
    Check If Product Details Image Is Visible    ${product}

Proceed To Checkout In Card Page

    Click In Procceed To Checkbox Button
    Verify If Card Title Is Visible

Continue Shopping
    Click In Continue Shopping Item

Add Product To Car
    [Arguments]    ${product}

    Select Product Color    ${product.color}
    Select Product Size    ${product.size}

    Click Added To Card Button
    Check If Added To Card Success Message Is Visible

    Check If Card Product Title Is Visible In Modal
    Card Product Title Should Contain Product Name    ${product.product_name}

    Card Product Color And Size Should Be Visible    ${product.color}    ${product.size}

Check Cart Summary
    [Arguments]    ${product}

    Check Cart Summary Description Product Name    ${product}
    Check Cart Summary Description Color Size    ${product}

Proceed To Checkout In Sumary Page

    Click Proceed To Checkout In Summary Page

Check Delivery And Billing Address
    [Arguments]    ${user}

    Verify If Card Delivery Items Is Visible    ${user}
    Verify If Card Billing Address Items Is Visible    ${user}
    Click To Checkout Address Page

Proceed To Checkout in Shipping Page

    Click To Checkout Shipping Page
    Verify if Payment Page Is Visible

Verify Product In Payment Page
    [Arguments]    ${product}

    Check If Order Details Product Name Is Visible    ${product.product_name}
    Check If Order Details Product Color And Size Is Visible    ${product.color}    ${product.size}

Choose Your Payment Method
    [Documentation]     options is: 
    ...                 Pay by check.
    ...                 Pay by bank wire
    [Arguments]    ${payment}

    Select Payment Method    ${payment}

Verify Payment Page

    Verify If Payment Page Is Visible

Confirm Order In Page Order

    Confirm My Order
    Verify Order Confirmation

Verify Order Confirmation

    Check If Order Confirmation Page Is Visible
    Check If Order Confirmation Success Banner Is Visible

Choose Payment Method   
    [Arguments]    ${payment_method}

    Choose Your Payment Method    ${payment_method}
    # Verify Payment Page

Go To Order History Using Back To Orders Link

    Click To Back Order History
    Verify If Order History Page Is Visible

Check User Information In Order History
    [Arguments]    ${user}

    Click Order History Item Details
    Verify History Delivery Address    ${user}
    Verify History Invoice Address    ${user}

Find Product
    [Arguments]     ${product}

    Open Dresses Product Submenu    ${product.category}
    Select Product Submenu Item    ${product.category}    ${product.sub_category}
    Select Product In Grid     ${product}


Verify Product In History Page  
    [Arguments]    ${product}

    Verify If Product Is Visible In History Page    ${product} 

Click In Write A Review

    Click In Product Comment Block
    Verify if New Comment Form Is Visible

Set Product Star Review
    [Arguments]    ${star_number}

    Select Product Star Review    ${star_number}
    Verify Seleted Star Product Review    ${star_number}

Input Review Title And Comment
    [Arguments]    ${title}    ${comment}

    Input Review Title    ${title}
    Input Review Comment    ${comment}

Buy A Product
    [Arguments]    ${product}    ${user}

    Find Product    ${product} 
    Add Product To Car    ${product}
    Proceed To Checkout In Card Page
    Check Cart Summary    ${product}
    Proceed To Checkout In Sumary Page
    Check Delivery And Billing Address    ${user}
    Select Terms Of Service

    Proceed To Checkout in Shipping Page
    Verify Product In Payment Page    ${product}
    Choose Payment Method     Pay by check.

    Confirm Order In Page Order

    Go To Order History Using Back To Orders Link
    Check User Information In Order History    ${user}    
    Verify Product In History Page    ${product}

Evaluate A Product
    [Arguments]    ${product}    ${star_number}    ${comment_title}    ${comment_context}

    Find Product    ${product} 
    Click In Write A Review
    Set Product Star Review    ${star_number}
    Input Review Title And Comment    ${comment_title}    ${comment_context}
    Click In Send Product Review
    Verify If Modal About Admin Available Information Is Visible
    Confim Admin Available Information Modal Clicking In Ok Button
    Verify If Modal About Admin Available Information Is Not Visible

    Verify If Product Image Is Visible In Details    ${product}

The User Find A Product
    [Arguments]    ${product}

    Find Product    ${product} 

The User Add Product to Car
    [Arguments]    ${product}    ${user}

    Add Product To Car    ${product}
    Proceed To Checkout In Card Page
    Check Cart Summary    ${product}
    Proceed To Checkout In Sumary Page
    Check Delivery And Billing Address    ${user}
    Select Terms Of Service

The User Select Payment Method
    [Arguments]     ${product}    ${method}=Pay by check.

    Proceed To Checkout in Shipping Page
    Verify Product In Payment Page    ${product}
    Choose Payment Method     ${method}

The User Confirm Order

    Confirm Order In Page Order

The Product Will Appear In The User's Purchase History
    [Arguments]    ${product}    ${user}

    Go To Order History Using Back To Orders Link
    Check User Information In Order History    ${user}    
    Verify Product In History Page    ${product}

The User By A Product
    [Arguments]    ${product}    ${user}

    Buy A Product    ${product}    ${user}

The User Evaluate A Product
    [Arguments]    ${product}    ${star_number}    ${comment_title}    ${comment_context}

    Find Product    ${product} 
    Click In Write A Review
    Set Product Star Review    ${star_number}
    Input Review Title And Comment    ${comment_title}    ${comment_context}
    Click In Send Product Review
    Verify If Modal About Admin Available Information Is Visible
    Confim Admin Available Information Modal Clicking In Ok Button
    Verify If Modal About Admin Available Information Is Not Visible

The Product Review Will Display In Product Page
    [Arguments]    ${product}

    Verify If Product Image Is Visible In Details    ${product}
