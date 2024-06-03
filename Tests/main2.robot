*** Settings ***
Library     SeleniumLibrary
Documentation    VALIDATION DES COMPETENCES SUR ROBOT FRAMEWORK  
...              ENSEMBLE D'EXERCICES A RENDRE SUR 3 JOURS 
Resource    ../Resources/resource.robot
Suite Teardown    Run Keyword    Delete All Cookies


*** Test Cases ***


Invalid Login
    Given login page is open    ${saucedemo_url}    ${chrome}
    When valid username and password are inserted    ${emailLockedOut}    ${password}
    and credentials are submitted
    Then I should see error credentials message 


# OLD

# Start
#     Start_webdriver    ${saucedemo_url}    ${chrome}

# Login
#     Login_account

# SignIn
#     EnterEmailPasswordLogin    ${emailLockedOut}    ${password}
#     Click Button    login-button

# Check_error
#     Check error message

    


 


        


