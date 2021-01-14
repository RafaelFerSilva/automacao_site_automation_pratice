*** Settings ***
Documentation    Keywords about product page

Library   SeleniumLibrary
Library    FakerLibrary
Library         String

Resource    ../keywords/utils_keywords.robot

*** Variables ***
${PRODUCTS_TOP_MENU}                      //div[@id="block_top_menu"]

&{PRODUCTS_TOP_MENU_ITEMS}                Women=(${PRODUCTS_TOP_MENU}//a[text()="Women"])
...                                       Dresses=(${PRODUCTS_TOP_MENU}//a[text()="Dresses"])[2]
...                                       T-shirts=(${PRODUCTS_TOP_MENU}//a[text()="T-shirts"])[2]

${PRODUCTS_TOP_MENU_ITEM_HOVER}           //a[@title="$$"]//ancestor::li[contains(@class,"sfHover")]
${PRODUCTS_TOP_MENU_SUBMENU_ITEMS}        ${PRODUCTS_TOP_MENU_ITEM_HOVER}//a[@title="$$"]
${PRODUCTS_SUBMENU_HEADER}                //h1[contains(@class, "page-heading")]//span[contains(normalize-space(), "$$")]
${PRODUCT_ITEM}                           //a[@title="$$"]//ancestor::div[contains(@class, "product-image-container")]
${PRODUCT_ITEM_MORE_DETAILS}              //a[@title="$$"]//ancestor::div[contains(@class, "product-container")]//a[@title="View"]
${PRODUCT_DETAILS_IMAGE}                  //span[@id="view_full_size"]//img[@title="$$"]
${PRODUCT_COLOR}                           //ul[@id="color_to_pick_list"]//a[@title="$$"]
${SELECTED_PRODUCT_COLOR}                  //li[contains(@class, "selected")]//a[@title="$$"]
${DRESS_SIZE_DROPDOWN}                    //select[@id="group_1"]

&{DRESS_SIZE_ITEMS}                       S=1
...                                       M=2 
...                                       L=3 

${DRESS_SIZE_ITEM}                        //div[@id="uniform-group_1"]//span[normalize-space()="$$"]

${ADDED_TO_CARD_MODAL_BUTTON}                     id:add_to_cart
${ADDED_TO_CARD_MODAL_SUCCESS_MESSAGE}            //h2[normalize-space()="Product successfully added to your shopping cart"]
${ADDED_TO_CARD_MODAL_PRODUCT_TITLE}              //span[@id="layer_cart_product_title"]
${ADDED_TO_CARD_PRODUCT_COLOR_SIZE}               //span[@id="layer_cart_product_attributes" and normalize-space()="$$, $$"]
${PROCEED_TO_CHECKOUT_BUTTON}                     //a[@title="Proceed to checkout"]    
${CONTINUE_SHOPPING}                              //span[@title="Continue shopping"]  

${CARD_TITLE}                                     id:cart_title

${CARD_SUMMARY_DESCR_PROD_NAME}                   //td[contains(@class,"cart_description")]//a[normalize-space()="$$"]
${CARD_SUMMARY_DESCR_PROD_COLOR_SIZE}             //td[contains(@class,"cart_description")]//a[normalize-space()="Color : $$, Size : $$"]

${CARD_DELIVERY_ADDRESS_SECTION}                  //ul[@id="address_delivery"]
${CARD_BILLING_ADDRESS_SECTION}                   //ul[@id="address_invoice"]

${CARD_DELIVERY_ADDRESS_SECTION_TITLE}             ${CARD_DELIVERY_ADDRESS_SECTION}//h3
${CARD_DELIVERY_ADDRESS_SECTION_USER}              ${CARD_DELIVERY_ADDRESS_SECTION}//li[contains(@class, "address_firstname")]
${CARD_DELIVERY_ADDRESS_SECTION_CITY}              ${CARD_DELIVERY_ADDRESS_SECTION}//li[contains(@class, "address_city")]
${CARD_DELIVERY_ADDRESS_SECTION_PHONE}             ${CARD_DELIVERY_ADDRESS_SECTION}//li[contains(@class, "address_phone_mobile")]
${CARD_DELIVERY_ADDRESS_SECTION_ADREESS}           ${CARD_DELIVERY_ADDRESS_SECTION}//li[contains(@class, "address_address1")]

${CARD_BILLING_ADDRESS_SECTION_TITLE}             ${CARD_DELIVERY_ADDRESS_SECTION}//h3
${CARD_BILLING_ADDRESS_SECTION_USER}              ${CARD_DELIVERY_ADDRESS_SECTION}//li[contains(@class, "address_firstname")]
${CARD_BILLING_ADDRESS_SECTION_CITY}              ${CARD_DELIVERY_ADDRESS_SECTION}//li[contains(@class, "address_city")]
${CARD_BILLING_ADDRESS_SECTION_PHONE}             ${CARD_BILLING_ADDRESS_SECTION}//li[contains(@class, "address_phone_mobile")]
${CARD_BILLING_ADDRESS_SECTION_ADREESS}           ${CARD_DELIVERY_ADDRESS_SECTION}//li[contains(@class, "address_address1")]

${PROCEED_TO_CHECKOUT_ADREESS_PAGE}                //button[@name="processAddress"]

${SHIPPING_PAGE_TITLE}                             //div[@id="carrier_area"]//h1
${TERMS_OF_SERVICE}                               id:cgv
${PROCEED_TO_CHECKOUT_SHIPPING_PAGE}               //button[contains(@class, "standard-checkout")]
${PAYMENT_PAGE}                                    //h1[normalize-space()="Please choose your payment method"]
${ORDER_DETAILS_PRODUCT_NAME}                      //div[@id="order-detail-content"]//a[normalize-space()="Printed Dress"]
${ORDER_DETAILS_PRODUCT_COLOR_SIZE}                //div[@id="order-detail-content"]//a[normalize-space()="Color : $$, Size : $$"]
${PAYMENT_METHOD}                                  //div[@id="HOOK_PAYMENT"]//a[@title="$$"] 

${ORDER_SUMMARY_PAGE_TITLE}                        //h1[normalize-space()="Order summary"]          
${CHECK_PAYMENT_SECTION_TITLE}                     //h3[normalize-space()="Check payment"]  
${CONFIRM_MY_ODER_BUTTON}                          //p[@id="cart_navigation"]//button

${ORDER_CONFIRMARION_PAGE_TITLE}                   //h1[normalize-space()="Order confirmation"]
${ORDER_SUCCESS_BANNER}                            //p[contains(@class, "alert alert-success") and normalize-space()="Your order on My Store is complete."]
${BACKK_TO_ORDER_HISTORY_LINK}                     //a[@title="Back to orders"]
${ORDER_HISTORY_PAGE_TITLE}                        //h1[normalize-space()="Order history"]

${HISTORY_DELIVERY_ADDRESS}                        //h3[contains(@class, "page-subheading") and normalize-space()="Delivery address (My address)"]//ancestor::ul[contains(@class, "address")]
${HISTORY_DELIVERY_ADDRESS_FIRST_NAME}             ${HISTORY_DELIVERY_ADDRESS}//span[contains(@class, "address_firstname")]
${HISTORY_DELIVERY_ADDRESS_LAST_NAME}              ${HISTORY_DELIVERY_ADDRESS}//span[contains(@class, "address_lastname")]
${HISTORY_DELIVERY_ADDRESS_ADDRESS1}               ${HISTORY_DELIVERY_ADDRESS}//span[contains(@class, "address_address1")]
${HISTORY_DELIVERY_ADDRESS_CITY}                   ${HISTORY_DELIVERY_ADDRESS}//span[contains(@class, "address_city")]
${HISTORY_DELIVERY_ADDRESS_STATE}                  ${HISTORY_DELIVERY_ADDRESS}//span[contains(@class, "address_State:name")]
${HISTORY_DELIVERY_ADDRESS_POSTCODE}               ${HISTORY_DELIVERY_ADDRESS}//span[contains(@class, "address_postcode")]
${HISTORY_DELIVERY_ADDRESS_COUNTRY}                ${HISTORY_DELIVERY_ADDRESS}//span[contains(@class, "address_Country:name")]
${HISTORY_DELIVERY_ADDRESS_PHONE}                  ${HISTORY_DELIVERY_ADDRESS}//li[contains(@class, "address_phone_mobile")]



${HISTORY_INVOICE_ADDRESS}                        //h3[contains(@class, "page-subheading") and normalize-space()="Invoice address (My address)"]//ancestor::ul[contains(@class, "address")]
${HISTORY_INVOICE_ADDRESS_FIRST_NAME}             ${HISTORY_INVOICE_ADDRESS}//span[contains(@class, "address_firstname")]
${HISTORY_INVOICE_ADDRESS_LAST_NAME}              ${HISTORY_INVOICE_ADDRESS}//span[contains(@class, "address_lastname")]
${HISTORY_INVOICE_ADDRESS_ADDRESS1}               ${HISTORY_INVOICE_ADDRESS}//span[contains(@class, "address_address1")]
${HISTORY_INVOICE_ADDRESS_CITY}                   ${HISTORY_INVOICE_ADDRESS}//span[contains(@class, "address_city")]
${HISTORY_INVOICE_ADDRESS_STATE}                  ${HISTORY_INVOICE_ADDRESS}//span[contains(@class, "address_State:name")]
${HISTORY_INVOICE_ADDRESS_POSTCODE}               ${HISTORY_INVOICE_ADDRESS}//span[contains(@class, "address_postcode")]
${HISTORY_INVOICE_ADDRESS_COUNTRY}                ${HISTORY_INVOICE_ADDRESS}//span[contains(@class, "address_Country:name")]
${HISTORY_INVOICE_ADDRESS_PHONE}                  ${HISTORY_INVOICE_ADDRESS}//li[contains(@class, "address_phone_mobile")]

${HISTORY_PRODUCT}                                //td[contains(@class,"bold")]//label[normalize-space()="$$ - Color : $$, Size : $$"]

${PRODUCT_IN_EVALUATE_MESSAGE_SELECT}             //select[@name="id_product"]     

${PRODUCT_COMMENT_BLOCK}                          //div[@id="product_comments_block_extra"]//a
${NEW_COMMENT_FORM}                               id:new_comment_form
${STAR_CONTENT_SELECT}                            //div[contains(@class,"star_content")]//a[@title="$$"]
${STAR_CONTENT_SELECTED}                          //div[contains(@class,"star_content")]//a[@title="$$"]//ancestor::div[contains(@class, "star_on")]
${COMMENT_TITLE_ID}                               id:comment_title
${COMMENT_CONTENT_ID}                             id:content
${BUTTON_SUBMIT_NEW_MESSAGE}                      id:submitNewMessage
${NEW_COMMENT_MODAL_TITLE}                        //h2[normalize-space()="New comment"]
${ADMIN_COMMENT_INFORMARION}                      //p[normalize-space()="Your comment has been added and will be available once approved by a moderator"]
${CONFIRM_MODAL_OK_BUTTON}                        //button[@type="submit"]//span[text()="OK"]


*** Keywords ***
Create Product Data
    [Arguments]    ${category}    ${sub_category}    ${product_name}    ${color}    ${size}

    &{product}    Create Dictionary    category=${category}    sub_category=${sub_category}    product_name=${product_name}    color=${color}    size=${size}

    [Return]    ${product}

Open Dresses Product Submenu
    [Arguments]    ${menu}

    Mouse Over If Element Is Visible  ${PRODUCTS_TOP_MENU_ITEMS}[${menu}]

    ${hover_menu}=    Replace String    ${PRODUCTS_TOP_MENU_ITEM_HOVER}    $$    ${menu}
    Wait Until Element Is Visible     ${hover_menu}
    

Select Product Submenu Item
    [Arguments]    ${menu}    ${sub_menu_item} 

    ${submenu}=    String Replace    ${PRODUCTS_TOP_MENU_SUBMENU_ITEMS}    ${menu}    ${sub_menu_item}    
    ${header}=          Replace String    ${PRODUCTS_SUBMENU_HEADER}    $$    ${sub_menu_item}    

    Click If Element Is Visible       ${submenu}
    Wait Until Element Is Visible    ${header}

Select Product Color
    [Arguments]    ${color}

    ${item}=    Replace String    ${PRODUCT_COLOR}    $$    ${color}
    ${selected_item}=    Replace String    ${SELECTED_PRODUCT_COLOR}    $$    ${color}

    Click If Element Is Visible    ${item}
    Wait Until Element Is Visible    ${selected_item}

Select Product Size
    [Documentation]    value: S = 1
    ...                value: M = 2
    ...                value: L = 3
    [Arguments]    ${size}

    ${size_item}     Replace String    ${DRESS_SIZE_ITEM}    $$    ${size}
    Select From List By Value    ${DRESS_SIZE_DROPDOWN}   ${DRESS_SIZE_ITEMS}[${size}] 
    Wait Until Element Is Visible    ${size_item}

Select Product In Grid 
  [Arguments]    ${product}    ${color}    ${size}

    ${item}=    Replace String    ${PRODUCT_ITEM}    $$    ${product}
    ${item_details}=    Replace String    ${PRODUCT_ITEM_MORE_DETAILS}    $$    ${product}
    ${image_details}=    Replace String    ${PRODUCT_DETAILS_IMAGE}    $$    ${product}

    Mouse Over If Element Is Visible    ${item}  
    Click If Element Is Visible    ${item_details}
    Wait Until Element Is Visible    ${image_details}

Proceed To Checkout

    Click If Element Is Visible  ${PROCEED_TO_CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${CARD_TITLE}

Continue Shopping
    Click If Element Is Visible    ${CONTINUE_SHOPPING}

Add Product To Car
    [Arguments]    ${product}

    Select Product Color    ${product.color}
    Select Product Size    ${product.size}

    Click If Element Is Visible  ${ADDED_TO_CARD_MODAL_BUTTON}
    Wait Until Element Is Visible    ${ADDED_TO_CARD_MODAL_SUCCESS_MESSAGE}

    Wait Until Element Is Visible    ${ADDED_TO_CARD_MODAL_PRODUCT_TITLE}
    Element Should Contain    ${ADDED_TO_CARD_MODAL_PRODUCT_TITLE}    ${product.product_name}

    ${color_size}=    String Replace    ${ADDED_TO_CARD_PRODUCT_COLOR_SIZE}    ${product.color}    ${product.size}
    Wait Until Element Is Visible    ${color_size}

Check Cart Summary
    [Arguments]    ${product}

    ${desc_name}     Replace String    ${CARD_SUMMARY_DESCR_PROD_NAME}    $$    ${product.product_name}
    ${desc_color_size}     String Replace    ${CARD_SUMMARY_DESCR_PROD_COLOR_SIZE}    ${product.color}    ${product.size}

    Wait Until Element Is Visible    ${desc_name}
    Wait Until Element Is Visible    ${desc_color_size}
    
Click Proceed To Checkout In Summary Page

    Click If Element Is Visible  //p${PROCEED_TO_CHECKOUT_BUTTON}

Check Delivery And Billing Address
    [Arguments]    ${user}

    Element Should Contain    ${CARD_DELIVERY_ADDRESS_SECTION_TITLE}    YOUR DELIVERY ADDRESS
    Element Should Contain    ${CARD_DELIVERY_ADDRESS_SECTION_USER}    ${user.name}
    Element Should Contain    ${CARD_DELIVERY_ADDRESS_SECTION_CITY}    ${user.city}
    Element Should Contain    ${CARD_DELIVERY_ADDRESS_SECTION_PHONE}    ${user.mobile_phone}
    
    ${first_address}    ${last_address}=    Split String    ${user.address}    \n
    Element Should Contain    ${CARD_DELIVERY_ADDRESS_SECTION_ADREESS}    ${first_address}

    Element Should Contain    ${CARD_BILLING_ADDRESS_SECTION_TITLE}    YOUR DELIVERY ADDRESS
    Element Should Contain    ${CARD_BILLING_ADDRESS_SECTION_USER}    ${user.name}
    Element Should Contain    ${CARD_BILLING_ADDRESS_SECTION_CITY}    ${user.city}
    Element Should Contain    ${CARD_BILLING_ADDRESS_SECTION_PHONE}     ${user.mobile_phone}

    Element Should Contain    ${CARD_BILLING_ADDRESS_SECTION_ADREESS}    ${first_address}

    Click If Element Is Visible  ${PROCEED_TO_CHECKOUT_ADREESS_PAGE}
    Element Should Contain    ${SHIPPING_PAGE_TITLE}    SHIPPING

Proceed To Checkout in Shipping Page

    Click If Element Is Visible      ${PROCEED_TO_CHECKOUT_SHIPPING_PAGE}
    Wait Until Element Is Visible    ${PAYMENT_PAGE}

Select Terms Of Service And Proceed To Checkout In Shipping Page
    [Arguments]    ${accept}=true

    Page Should Contain Checkbox           ${TERMS_OF_SERVICE}  
    Run Keyword If    '${accept}' == 'true'    Select Checkbox    ${TERMS_OF_SERVICE}
    Run Keyword If    '${accept}' == 'true'    Checkbox Should Be Selected    ${TERMS_OF_SERVICE}
    Proceed To Checkout in Shipping Page

Verify Product In Payment Page
    [Arguments]    ${product}

    ${desc_name}     Replace String    ${ORDER_DETAILS_PRODUCT_NAME}    $$    ${product.product_name}
    ${desc_color_size}     String Replace    ${ORDER_DETAILS_PRODUCT_COLOR_SIZE}    ${product.color}    ${product.size}

    Wait Until Element Is Visible    ${desc_name}
    Wait Until Element Is Visible    ${desc_color_size}

Choose Your Payment Method
    [Documentation]     options is: 
    ...                 Pay by check.
    ...                 Pay by bank wire
    [Arguments]    ${payment}

    ${method}=    Replace String    ${PAYMENT_METHOD}  $$    ${payment}
    Click If Element Is Visible    ${method}

Verify Payment Page and Confirm Order

    Wait Until Element Is Visible    ${ORDER_SUMMARY_PAGE_TITLE}
    Wait Until Element Is Visible    ${CHECK_PAYMENT_SECTION_TITLE}

    Click If Element Is Visible    ${CONFIRM_MY_ODER_BUTTON}

Verify Order Confirmation

    Wait Until Element Is Visible    ${ORDER_CONFIRMARION_PAGE_TITLE}
    Wait Until Element Is Visible    ${ORDER_SUCCESS_BANNER}

Choose Payment Method And Confirm Order     
    [Arguments]    ${payment_method}

    Choose Your Payment Method    ${payment_method}
    Verify Payment Page and Confirm Order

Go To Order History Using Back To Orders Link

    Click If Element Is Visible    ${BACKK_TO_ORDER_HISTORY_LINK}
    Wait Until Element Is Visible    ${ORDER_HISTORY_PAGE_TITLE}

Click Order History Item Details

    Click If Element Is Visible    //td[contains(@class, "history_detail")]//span[normalize-space()="Details"]

Find Product
    [Arguments]     ${product}

    Open Dresses Product Submenu    ${product.category}
    Select Product Submenu Item    ${product.category}    ${product.sub_category}
    Select Product In Grid     ${product.product_name}    ${product.color}    ${product.size}
    
Verify History Delivery Address
    [Arguments]    ${user}

    ${first_address}    ${last_address}=    Split String    ${user.address}    \n
    ${first_name}    ${last_name}=    Split String    ${user.name}

    Wait Until Element Is Visible     ${HISTORY_DELIVERY_ADDRESS}
    Element Should Contain     ${HISTORY_DELIVERY_ADDRESS_FIRST_NAME}    ${first_name}              
    Element Should Contain     ${HISTORY_DELIVERY_ADDRESS_LAST_NAME}    ${last_name}            
    Element Should Contain     ${HISTORY_DELIVERY_ADDRESS_ADDRESS1}    ${first_address}         
    Element Should Contain     ${HISTORY_DELIVERY_ADDRESS_CITY}    ${user.city}                              
    Element Should Contain     ${HISTORY_DELIVERY_ADDRESS_POSTCODE}    ${user.postal_code}                       
    Element Should Contain     ${HISTORY_DELIVERY_ADDRESS_PHONE}    ${user.mobile_phone}

Verify History Invoice Address
    [Arguments]    ${user}

    ${first_address}    ${last_address}=    Split String    ${user.address}    \n
    ${first_name}    ${last_name}=    Split String    ${user.name}

    Wait Until Element Is Visible     ${HISTORY_INVOICE_ADDRESS}
    Element Should Contain     ${HISTORY_INVOICE_ADDRESS_FIRST_NAME}    ${first_name}              
    Element Should Contain     ${HISTORY_INVOICE_ADDRESS_LAST_NAME}    ${last_name}            
    Element Should Contain     ${HISTORY_INVOICE_ADDRESS_ADDRESS1}    ${first_address}         
    Element Should Contain     ${HISTORY_INVOICE_ADDRESS_CITY}    ${user.city}                              
    Element Should Contain     ${HISTORY_INVOICE_ADDRESS_POSTCODE}    ${user.postal_code}                       
    Element Should Contain     ${HISTORY_INVOICE_ADDRESS_PHONE}    ${user.mobile_phone}

Verify Product In History Page  
    [Arguments]    ${product}

    ${element}=    String Replace    ${HISTORY_PRODUCT}     ${product.product_name}    ${product.color}    ${product.size}
    Wait Until Element Is Visible    ${element}

Click In Write A Review

    Click If Element Is Visible     ${PRODUCT_COMMENT_BLOCK}
    Wait Until Element Is Visible    ${NEW_COMMENT_FORM} 

Set Product Star Review
    [Arguments]    ${star_number}

    ${star}=    Replace String    ${STAR_CONTENT_SELECT}   $$    ${star_number}
    ${selected_star}=    Replace String    ${STAR_CONTENT_SELECTED}    $$    ${star_number}
    Click If Element Is Visible    ${star}    
    Wait Until Element Is Visible    ${selected_star}

Input Review Title And Comment
    [Arguments]    ${title}    ${comment}

    Input Text If Element Is Visible    ${COMMENT_TITLE_ID}    ${title}
    Input Text If Element Is Visible    ${COMMENT_CONTENT_ID}    ${comment}

Click In Send Product Review

    Click If Element Is Visible  ${BUTTON_SUBMIT_NEW_MESSAGE}

Verify If Modal About Admin Available Information Is Visible

    Wait Until Element Is Visible    ${NEW_COMMENT_MODAL_TITLE}
    Wait Until Element Is Visible    ${ADMIN_COMMENT_INFORMARION}

Verify If Modal About Admin Available Information Is Not Visible

    Wait Until Element Is Not Visible    ${NEW_COMMENT_MODAL_TITLE}
    Wait Until Element Is Not Visible    ${ADMIN_COMMENT_INFORMARION}

Confim Admin Available Information Modal Clicking In Ok Button
    Click If Element Is Visible    ${CONFIRM_MODAL_OK_BUTTON}
    

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

    ${image_details}=    Replace String    ${PRODUCT_DETAILS_IMAGE}    $$    ${product.product_name}

    Wait Until Element Is Visible    ${image_details}
