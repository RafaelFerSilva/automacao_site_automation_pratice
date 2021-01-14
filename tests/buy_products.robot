*** Settings ***
Documentation    Buy Products

Library   SeleniumLibrary

Resource    ../keywords/create_account_keywords.robot
Resource    ../keywords/products_keywords.robot

Suite Setup    Run Keywords    Suite Test Setup    AND    Create User Account    ${USER}    
Suite Teardown    Close Browser 

*** Test Cases ***
Buy Products from Site
    ${product_1}=    Create Product Data    Dresses    Evening Dresses     Printed Dress    Pink    S
    ${product_2}=    Create Product Data    Dresses    Evening Dresses     Printed Dress    Beige    M
    
    Find Product    ${product_1} 
    Add Product To Car    ${product_1}
    Continue Shopping
    Add Product To Car    ${product_2}
    Proceed To Checkout
    Check Cart Summary    ${product_1}
    Check Cart Summary    ${product_2}
    Click Proceed To Checkout In Summary Page
    Check Delivery And Billing Address    ${USER}
    Select Terms Of Service And Proceed To Checkout In Shipping Page
    Verify Product In Payment Page    ${product_1}
    Verify Product In Payment Page    ${product_2}
    Choose Payment Method And Confirm Order     Pay by check.
    Verify Order Confirmation
    Go To Order History Using Back To Orders Link
    Click Order History Item Details
    Verify History Delivery Address    ${USER}
    Verify History Invoice Address    ${USER}
    Verify Product In History Page    ${product_1}
    Verify Product In History Page    ${product_2}

Buy Products And Add Product Review
    ${product_1}=    Create Product Data    Dresses    Evening Dresses     Printed Dress    Pink    S
    ${product_2}=    Create Product Data    Dresses    Evening Dresses     Printed Dress    Beige    M

    Find Product    ${product_1} 
    Add Product To Car    ${product_1}
    Continue Shopping
    Add Product To Car    ${product_2}
    Proceed To Checkout
    Check Cart Summary    ${product_1}
    Check Cart Summary    ${product_2}
    Click Proceed To Checkout In Summary Page
    Check Delivery And Billing Address    ${USER}
    Select Terms Of Service And Proceed To Checkout In Shipping Page
    Verify Product In Payment Page    ${product_1}
    Verify Product In Payment Page    ${product_2}
    Choose Payment Method And Confirm Order     Pay by check.
    Verify Order Confirmation
    Go To Order History Using Back To Orders Link
    Click Order History Item Details
    Verify History Delivery Address    ${USER}
    Verify History Invoice Address    ${USER}
    Verify Product In History Page    ${product_1}
    Verify Product In History Page    ${product_2}

    Evaluate A Product    ${product_1}     5    "New Title"    "New Comment"
