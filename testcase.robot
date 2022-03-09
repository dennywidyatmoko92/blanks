*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${url}    ${browser}    
Suite Teardown        Close Browser     

*** Variables ***
${username}    Admin        
${password}    admin123        
${url}    https://opensource-demo.orangehrmlive.com/
${browser}    chrome
${invalidpassword}    asasas

*** Keywords ***

*** Test Cases ***
login valid password
    Maximize Browser Window
    Wait Until Element Is Visible    id=txtUsername    10   
    Input Text    id=txtUsername    ${username}
    Input Text    id=txtPassword    ${password}
    Click Element    id=btnLogin
    Wait Until Page Contains    Welcome Meghana    10    
    Page Should Contain    Welcome Meghana  
    Click Element    id=welcome   
    Wait Until Element Is Visible    href=/index.php/auth/logout      10 
    Click Link    href=/index.php/auth/logout    10   
  

login invalid password      
    Wait Until Element Is Visible    id=txtUsername    10   
    Input Text    id=txtUsername    ${invalidpassword}
    Input Text    id=txtPassword    ${password}
    Click Element    id=btnLogin
    Wait Until Page Contains    Invalid credentials    10    
    Page Should Contain    Invalid credentials    
        
                          

