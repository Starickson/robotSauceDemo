*** Settings ***
Library     SeleniumLibrary
Documentation    VALIDATION DES COMPETENCES SUR ROBOT FRAMEWORK  
...              ENSEMBLE D'EXERCICES A RENDRE SUR 3 JOURS 
Resource    ../Resources/resource.robot
Suite Teardown    Run Keyword    Delete All Cookies


*** Test Cases ***

Exercice 5
    Given login page is open    ${saucedemo_url}    ${chrome}
    When valid username and password are inserted    ${email}    ${password}
    and credentials are submitted
    and welcome page is open
    and I select the second product 
    Then I Check that the main elements of the product sheet are correctly displayed     Sauce Labs    A red light    9.99
    and I add the product to the cart
    and I go to cart 
    and I check that you have a nb of products in the basket    1
    and I enter the customer information "marc" and "letepe" and "59008"    ${firstNameSauce}  ${lastnameSauce}  ${postalCodeSauce}
    and I finalize the order
    Then I check that the order was completed correctly

  





        
    


 


        


