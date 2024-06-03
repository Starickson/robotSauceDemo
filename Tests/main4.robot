*** Settings ***
Library     SeleniumLibrary
Documentation    VALIDATION DES COMPETENCES SUR ROBOT FRAMEWORK  
...              ENSEMBLE D'EXERCICES A RENDRE SUR 3 JOURS 
Resource    ../Resources/resource.robot
Suite Teardown    Run Keyword    Delete All Cookies


*** Test Cases ***

Exercice 4
    Given login page is open    ${saucedemo_url}    ${chrome}
    When valid username and password are inserted    ${email}    ${password}
    and credentials are submitted
    and welcome page is open
    and I sort the product list from lowest to highest price   ${HigherToLower} 
    Then The products are sorted in the right direction High to Low
   









# Vérifier que les produits sont triés dans le bon sens​

# Trier la liste de produits du moins cher au plus cher​

# Vérifier que les produits sont triés dans le bon sens​




        
    


 


        


