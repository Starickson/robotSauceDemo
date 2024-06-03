*** Settings ***
Library     SeleniumLibrary
Documentation    VALIDATION DES COMPETENCES SUR ROBOT FRAMEWORK  
...              ENSEMBLE D'EXERCICES A RENDRE SUR 3 JOURS 
Resource    ../Resources/resource.robot
Suite Teardown    Run Keyword    Delete All Cookies


*** Test Cases ***

Valid Login
    Given login page is open    ${saucedemo_url}    ${chrome}
    When valid username and password are inserted    ${email}    ${password}
    and credentials are submitted
    and welcome page is open
    and logout the application 
    Then I should return to the login page 




#OLD 

# Start
#     Start_webdriver    ${saucedemo_url}    ${chrome}

# Login
#     Login_account

# SignIn
#     EnterEmailPasswordLogin    ${email}    ${password}
#     Click Button    login-button

# Logout
#     Logout_application



        
    


 


        


