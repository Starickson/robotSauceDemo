*** Settings ***
Library    SeleniumLibrary
Library    ../Data/chromedriversync.py
Library    ../Data/utilitaires.py
Library    XML
Library    Collections


*** Variables ***

#------------------SAUCE DEMO ---------------
${emailLockedOut}     locked_out_user
${email}     standard_user
${password}     secret_sauce
${chrome}     chrome
${saucedemo_url}    https://www.saucedemo.com/

${firefox}    firefox
${cdiscount}    https://www.cdiscount.com/

${HigherToLower}     hilo
${LowerToHigher}     lohi
${firstnameSauce}    Pierre
${lastnameSauce}     MDEUXIFORMATION
${postalCodeSauce}    59000
@{listToCompare}       49.99     29.99    15.99    15.99    9.99    7.99
@{listSortedDescFaild}       9.99     29.99    15.99    15.99    9.99    7.99
@{listToCompareLowToH}    7.99     9.99     15.99    15.99     29.99    49.99


#---------------------------------------


${gender}     male
${firstName}      franck
${lastName}         DUPONT    
${dayOfBirth}      2
${monthOfBirth}     2
${yearOfBith}     2000
&{user}       gender=${gender}    firstName=${firstName}    lastName=${lastName}    dayOfBirth=${dayOfBirth}    
...    monthOfBirth=${monthOfBirth}    yearOfBith=${yearOfBith}    email=${email}    password=${password}
${euro_currency}    Euro
${dollars_currency}    US Dollar
@{categories}    Computers     Electronics    Apparel    Digital    downloads    Books    Jewelry    Gift Cards 


#---------------------------------------


*** Keywords ***



Add_to_cart_button
    TRY
        Click Button      //button[starts-with(@id,'add-to-cart-button')]
    EXCEPT    
        Log  message=Ce produit n'a pu être ajouté au panier 
    END


    # Click Button    //button[@type='submit' and contains(.,'Log in')]
    # Sleep    5






Close the Browser
    Close All Browsers

Check if 
    Click Link    //


Check error message 
    Element Should Be Visible    //h3
    checkELelmentShouldBe  //h3     Epic sadface: Sorry, this user has been locked out.

 checkELelmentShouldBe
     [Arguments]    ${locator}    ${valueToCompare}
     SeleniumLibrary.Element Text Should Be    ${locator }    ${valueToCompare}  
  

Check_nb_element_cart
    [Arguments]    ${quantite}
    Click Link    //*[@id="shopping_cart_container"]/a
    checkELelmentShouldBe      //*[@id="shopping_cart_container"]/a/span    ${quantite}
    Sleep    2
    


# Selection de side menu 
Check_side_menu
    [Arguments]    ${var}
    Click Element    locator=//div[@class='block block-category-navigation']//div[@class='listbox']/ul/li[${var}]


GoToCheckout
    Click Element    checkout
    Page Should Contain    Checkout: Your Information


fillInformationClientSauceDemo
   [Arguments]    ${firstnameSauceDemo}    ${lastnameSauceDemo}    ${postalCodeSauceDemo}
   Input Text   first-name    ${firstnameSauceDemo}
   Input Text   last-name   ${lastnameSauceDemo}
   Input Text   postal-code  ${postalCodeSauceDemo}
   Sleep    2
   Click Element    continue
   Page Should Contain    Checkout: Overview

finishCommand
    Click Element    finish
    checkELelmentShouldBe    //h2[@data-test="complete-header"]   Thank you for your order!


checkcartNbNotvisible
    Element Should Not Be Visible    //*[@id="shopping_cart_container"]/a/span

 
 Create account
     [Arguments]      ${gender}     ${firstName}      ${lastName}     ${dayOfBirth}     ${monthOfBirth}     ${yearOfBith}     ${email}     ${password}
    #  il faut avant tout acceder au formulaire de création de compte 
     register_button_access

    #  Traitement Formulaire  
     IF  '$gender == male'
         Click Button    gender-male 
     END
     IF  '$gender == female'
         Click Button    gender-female 
     END
     Input Text    FirstName    ${firstName}
     Input Text    LastName     ${lastName}
     Select From List By Value   name=DateOfBirthDay    ${dayOfBirth}
     Select From List By Value   name=DateOfBirthMonth    ${monthOfBirth}
     Select From List By Value   name=DateOfBirthYear    ${yearOfBith}
     Input Text    Email    ${email}
     Input Password    Password    ${password}
     Input Password    ConfirmPassword    ${password}

     register_form_validation


#--------------------------SAUCE DEMO 

 AddProductTocartSauceDemo
    Sleep    2
    Click Element    (//div/button[text()="Add to cart"])[1]
    Sleep    2
    Click Element    (//div/button[text()="Add to cart"])[2]


credentials are submitted
    Click Button    login-button

    

valid username and password are inserted
    [Arguments]  ${email}    ${password}
    Input Text     user-name    ${email}
    Input Text    password     ${password}
    Sleep    2


EnterEmailPasswordLogin
    [Arguments]  ${email}    ${password}
    Input Text     user-name    ${email}
    Input Text    password     ${password}
    Sleep    2


Login_account
    Wait Until Element Is Visible     //input[contains(@id,'user-name')]
    #login-button
    Sleep    1

Logout_application
    #Wait Until Element Is Visible     react-burger-menu-btn
    Click Button    id=react-burger-menu-btn
    Sleep    2
    Click Element    //a[@id="logout_sidebar_link"]
    #Click Element    id=logout_sidebar_link
    Sleep    2

logout the application 
    #Wait Until Element Is Visible     react-burger-menu-btn
    Click Button    id=react-burger-menu-btn
    Sleep    2
    Click Element    //a[@id="logout_sidebar_link"]
    #Click Element    id=logout_sidebar_link
    Sleep    2


I should return to the login page
    Location Should Be     https://www.saucedemo.com/
    
I should see error credentials message 
    Element Should Be Visible    //h3
    checkELelmentShouldBe  //h3     Epic sadface: Sorry, this user has been locked out.

welcome page is open
    Location Should Be    https://www.saucedemo.com/inventory.html



register_button_access
    Click Button    //button[@type='button' and contains(.,'Register')]


register_form_validation
    Click Button    register-button
    Wait Until Element Is Visible    //h1[text()='Register']
    checkELelmentShouldBe    //h1[text()='Register']    Register




FilterProducFromHigherToLowerPrice
    [Arguments]    ${value}
    Select From List By Value   //select[@data-test="product-sort-container"]    ${value}
    Sleep    2
 

I sort the product list from highest to lowest price
    [Arguments]    ${value}
    Select From List By Value   //select[@data-test="product-sort-container"]    ${value}
    Sleep    2

I sort the product list from lowest to highest price    
    [Arguments]    ${value}
    Select From List By Value   //select[@data-test="product-sort-container"]    ${value}
    Sleep    2

I add the first two products to the cart
    Sleep    2
    Click Element    (//div/button[text()="Add to cart"])[1]
    Sleep    5
    Click Element    (//div/button[text()="Add to cart"])[1]



I go to cart 
    Click Element    //*[@id="shopping_cart_container"]/a
    Sleep    3
    Click Element    checkout
    Page Should Contain    Checkout: Your Information
    Sleep    3


I check that you have a nb of products in the basket
    [Arguments]    ${quantite}
    Click Link    //*[@id="shopping_cart_container"]/a
    checkELelmentShouldBe      //*[@id="shopping_cart_container"]/a/span    ${quantite}
    Sleep    2


I enter the customer information "marc" and "letepe" and "59008"
   [Arguments]    ${firstnameSauceDemo}    ${lastnameSauceDemo}    ${postalCodeSauceDemo}
   GoToCheckout
   Input Text   first-name    ${firstnameSauceDemo}
   Input Text   last-name   ${lastnameSauceDemo}
   Input Text   postal-code  ${postalCodeSauceDemo}
   Sleep    2
   Click Element    continue
   Page Should Contain    Checkout: Overview

I finalize the order
    Click Element    finish
    checkELelmentShouldBe    //h2[@data-test="complete-header"]   Thank you for your order!
    Click Element    back-to-products
    Sleep    3

I check that the order was completed correctly
    Element Should Not Be Visible    //*[@id="shopping_cart_container"]/a/span
    Sleep    1



SelectCurrency
    # Selection d'une monnaie 
    [Arguments]    ${currency}
    Select From List By Value    customerCurrency    ${currency}
    # et verification que choix est validé dans un select 
    Page Should Contain    Euro
    ${var}    Get Selected List Label    customerCurrency
    Log    ${var}


Select_category_by_random
    [Arguments]    ${var}
    Wait Until Element Is Visible    //div[@class="header-menu"]//ul[@class="top-menu notmobile"]/li[${var}]/a
    Click Link    //div[@class="header-menu"]//ul[@class="top-menu notmobile"]/li[${var}]/a
    Sleep    3

   
login page is open
    [Arguments]    ${url}    ${browser}
    ${driver_path}=    chromedriversync.Get Driver Path With Browser        ${browser}
    Open Browser          ${url}         ${browser}      executable_path=${driver_path} 
    # Go to    ${url}
    Maximize Browser Window


Start_webdriver
    [Arguments]    ${url}    ${browser}
    ${driver_path}=    chromedriversync.Get Driver Path With Browser        ${browser}
    Open Browser          ${url}         ${browser}      executable_path=${driver_path} 
    # Go to    ${url}
    Maximize Browser Window
    

    

Traiter cookies condition
    [Arguments]     ${ActionCookies}
    IF  ${ActionCookies}=='Accepter'
        Wait Until Element Is Visible    //button[@title="Accepter"]    15
        Click Element    footer_tc_privacy_button_2
    ELSE IF    ${ActionCookies} == 'Refuser'
        Wait Until Element Is Visible    //button[@title="Continer sans accepter"]    15
        Click Element    footer_tc_privacy_button_3

    END    

Valid_product_with_subtitle
    [Arguments]    ${var}
    Click Element     //div[@class='block block-category-navigation']//div[@class='listbox']/ul/li[${var}]//ul/li[1]/a  
    Click Link        //div[@class='item-box'][1]/div[@class='product-item']/div[@class='picture']/a
    Add_to_cart_button
  
Valid_product_without_subtitle
    [Arguments]    ${var}
    Click Link     //div[@class='block block-category-navigation']//div[@class='listbox']/ul/li[${var}]/a
    Click Link        //div[@class='item-box'][1]/div[@class='product-item']/div[@class='picture']/a
    Add_to_cart_button
    

The products are sorted in the right direction High to Low
    Sleep    2
    
    @{listeVide3}    Create List

     FOR    ${index}     IN RANGE     1    7
        ${element}=    Get Text   (//div[@class="inventory_item_price"])[${index}]
        Append To List    ${listeVide3}    ${element.strip('$')}
    END


    Log    ${listeVide3}

    ${length} =	Get Length	${listeVide3}

    Log    ${length}

    # Should be Equal   ${listeVide3}    ${listToCompare}

    # ${listSortedDescFaild}   

    ${response} =       Get Sorted Desc    ${listeVide3}   

    log    -----------
    log    ${response}
    log    -----------

    Should Be True    ${response}




The products are sorted in the right direction High to Low 2
    Sleep    2
    
    @{listeVide3}    Create List

     FOR    ${index}     IN RANGE     1    7
        ${element}=    Get Text   (//div[@class="inventory_item_price"])[${index}]
        Append To List    ${listeVide3}    ${element.strip('$')}
    END
    Log    ${listeVide3}

    ${length} =	Get Length	${listeVide3}

    Should be Equal   ${listeVide3}    ${listToCompare}

    FOR    ${index}     IN     ${length}
    IF    ${listeVide3} == 'True'    
           Valid_product_with_subtitle    1
    END
    END
    Log    ${listeVide3}


The products are sorted in the right direction Low to High
    Sleep    2
    
    @{listeVide3}    Create List

     FOR    ${index}     IN RANGE     1    7
        ${element}=    Get Text   (//div[@class="inventory_item_price"])[${index}]
        Append To List    ${listeVide3}    ${element.strip('$')}
    END
    Log    ${listeVide3}

    # Should be Equal   ${listeVide3}    ${listToCompareLowToH}
    
    Log    ${listeVide3}

    ${length} =	Get Length	${listeVide3}

    Log    ${length}

    # Should be Equal   ${listeVide3}    ${listToCompare}

    # ${listSortedDescFaild}   

    ${response} =       Get Sorted Asc    ${listeVide3}   

    log    -----------
    log    ${response}
    log    -----------

    Should Be True    ${response}

    
 I select the second product 
    Sleep    2
    Click Element    (//div[@class="inventory_item_label"])[2]/a
   # Click Element    (//div/button[text()="Add to cart"])[2]   
    Sleep    4


 I Check that the main elements of the product sheet are correctly displayed
     [Arguments]    ${titleValue}    ${partailDescValue}     ${productprice}
     Sleep    2


     Element Should Be Visible    (//div[@class="inventory_details_name large_size"])
     Page Should Contain   ${titleValue}

     Element Should Be Visible    (//div[@class="inventory_details_desc large_size"])
     Page Should Contain    ${partailDescValue}

     Element Should Be Visible    (//div[@class="inventory_details_price"])
     Page Should Contain    ${productprice}

     Element Should Be Visible    add-to-cart

    Element Should Be Visible    (//img[@class="inventory_details_img"])
    ${src}=     SeleniumLibrary.Get Element Attribute  (//img[@class="inventory_details_img"])    src
    Should Not Be Equal	${src}	 ""
    
     
I add the product to the cart
    Sleep    2
    Click Element    add-to-cart
   


    

