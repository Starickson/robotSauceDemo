*** Settings ***
Library     SeleniumLibrary
Documentation    VALIDATION DES COMPETENCES SUR ROBOT FRAMEWORK  
...              ENSEMBLE D'EXERCICES A RENDRE SUR 3 JOURS 
Resource    ../Resources/resource.robot
Suite Teardown    Run Keyword    Delete All Cookies


*** Test Cases ***

Exercice 3
    Given login page is open    ${saucedemo_url}    ${chrome}
    When valid username and password are inserted    ${email}    ${password}
    and credentials are submitted
    and welcome page is open
    and I sort the product list from highest to lowest price    ${HigherToLower}
    and I add the first two products to the cart
    and I go to cart 
    and I check that you have a nb of products in the basket    2
    and I enter the customer information "marc" and "letepe" and "59008"    ${firstNameSauce}  ${lastnameSauce}  ${postalCodeSauce}
    and I finalize the order
    Then I check that the order was completed correctly








        
    


 


        


